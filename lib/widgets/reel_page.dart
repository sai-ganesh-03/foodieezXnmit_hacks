import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class ReelPage extends StatefulWidget {
  const ReelPage({Key? key}) : super(key: key);

  @override
  State<ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<ReelPage> {

  late VideoPlayerController _videoPlayerController;

  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
        "assets/r12.mp4")
      ..initialize().then((value) {
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
        _videoPlayerController.setVolume(1);
      });

    if(_videoPlayerController.value.isInitialized){
        debugPrint("yes");
    } else {
      debugPrint("no");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index){
          return Container(
            child: Center(
              child: Stack(
                children: [
                  VideoPlayer(_videoPlayerController),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 12,
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Icon(Icons.person_outline_sharp, size: 40, color: Colors.white,),
                                      SizedBox(width: 15,),
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.white
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.location_on_outlined, size: 25,),
                                        SizedBox(width: 15,),
                                        Expanded(child: Text(
                                          "Location",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,

                                          ),
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ),
                            Flexible(
                              flex: 2,
                              child: Column(
                                children: const [
                                  Icon(FontAwesomeIcons.eye, size: 35, color: Colors.white,),
                                  SizedBox(height: 15,),
                                  Icon(FontAwesomeIcons.heart, size: 35, color: Colors.white,),
                                  SizedBox(height: 15,),
                                  Icon(Icons.share_outlined, size: 35, color: Colors.white,),
                                  SizedBox(height: 15,),
                                  Icon(FontAwesomeIcons.bookmark, size: 35, color: Colors.white,),
                                  SizedBox(height: 15,),
                                  Icon(FontAwesomeIcons.commentDots, size: 35, color: Colors.white,),
                                  SizedBox(height: 15,),
                                ],
                              )
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
