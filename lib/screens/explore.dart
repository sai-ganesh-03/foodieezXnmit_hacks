import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nmit_hacks2/screens/profile.dart';
import 'package:nmit_hacks2/widgets/reel_page.dart';

import '../values/colors.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  final TextEditingController _searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.transparent,
    //       elevation: 0,
    //       centerTitle: true,
    //       title: Text(
    //         "Explore",
    //         style: TextStyle(
    //           fontSize: 40,
    //           fontWeight: FontWeight.bold,
    //           color: Colors.black
    //         ),
    //       )
    //     ),
    //     body: isShowUsers ? FutureBuilder(
    //       future: FirebaseFirestore.instance.collection('users').where('username', isGreaterThanOrEqualTo: _searchController.text.toString()).get(),
    //       builder: (context, snapshot){
    //         if(!snapshot.hasData){
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         }
    //         return ListView.builder(
    //             itemCount: (snapshot.data! as dynamic).docs.length,
    //             itemBuilder: (context, index){
    //               return ListTile(
    //                 onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(uid: "123abc",))),//uid: (snapshot.data! as dynamic).docs[index]['uid']))),
    //                 leading: CircleAvatar(
    //                   backgroundImage: NetworkImage((snapshot.data! as dynamic).docs[index]['photoUrl']),
    //                 ),
    //                 title: Text((snapshot.data! as dynamic).docs[index]['username']),
    //               );
    //             }
    //         );
    //       },
    //     ) : FutureBuilder(
    //         future: FirebaseFirestore.instance.collection('posts').get(),
    //         builder: (context, snapshot){
    //           if(!snapshot.hasData){
    //             return const Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }
    //           return GridView.custom(
    //             gridDelegate: SliverQuiltedGridDelegate(
    //               crossAxisCount: 4,
    //               mainAxisSpacing: 4,
    //               crossAxisSpacing: 4,
    //               repeatPattern: QuiltedGridRepeatPattern.inverted,
    //               pattern: [
    //                 const QuiltedGridTile(2, 2),
    //                 const QuiltedGridTile(1, 1),
    //                 const QuiltedGridTile(1, 1),
    //                 const QuiltedGridTile(1, 2),
    //               ],
    //             ),
    //             childrenDelegate: SliverChildBuilderDelegate(
    //                   (context, index) => GridTile(
    //                 child: Image.network((snapshot.data! as dynamic).docs[index]['postUrl'],fit: BoxFit.cover,),
    //               ),childCount: (snapshot.data! as dynamic).docs.length,
    //             ),
    //           );
    //         }
    //     ),
    //   ),
    // );
    return ReelPage();
  }
}
