import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nmit_hacks2/resources/auth_methods.dart';
import 'package:nmit_hacks2/resources/firestore_methods.dart';
import 'package:nmit_hacks2/values/colors.dart';
import 'package:nmit_hacks2/widgets/follow_button.dart';
import '../services/utils.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  final String uid;
  const Profile({Key? key, required this.uid}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // var userData = {};
  // int postLength = 0;
  // int followers = 0;
  bool isFollowing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
  }

  // getData() async {
  //   try{
  //     var snap = await FirebaseFirestore.instance.collection('users').doc(widget.uid).get();
  //     var posts = await FirebaseFirestore.instance.collection('posts').where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
  //     setState(() {
  //       userData = snap.data()!;
  //       postLength = posts.docs.length;
  //       isFollowing = userData['followers'].contains(FirebaseAuth.instance.currentUser!.uid);
  //     });
  //   } catch(e) {
  //     showSnackBar(e.toString(), context);
  //   }
  // }

  Column buildStatColumn(int num, String label){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8,),
        Text(
          label,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          // child: Text(userData['username']),
          child: Text('username'),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      // backgroundImage: NetworkImage(userData['photoUrl']),
                      backgroundImage: NetworkImage('photoUrl'),
                      radius: 50,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // buildStatColumn(postLength, "Posts"),
                              buildStatColumn(1, "Posts"),
                              // buildStatColumn(userData['followers'].length, "Followers"),
                              buildStatColumn(1, "Followers"),
                              // buildStatColumn(userData['following'].length, "Following"),
                              buildStatColumn(1, "Following"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              (FirebaseAuth.instance.currentUser!.uid == widget.uid) ?
                              FollowButton(
                                backgroundColor: primaryColor,
                                borderColor: Colors.grey,
                                text: "Sign out",
                                textColor: primaryColor,
                                cusMethod: () async {
                                  await AuthMethods().signOut();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                                },
                              ) : isFollowing ?
                              FollowButton(
                                backgroundColor: Colors.grey,
                                borderColor: Colors.grey,
                                text: "Unfollow",
                                textColor: primaryColor,
                                // cusMethod: () async {
                                //   await FirestoreMethods().followUser(FirebaseAuth.instance.currentUser!.uid, userData['uid']);
                                //   setState(() {
                                //     isFollowing = false;
                                //     followers--;
                                //   });
                                // },
                              ) :
                              FollowButton(
                                backgroundColor: primaryColor,
                                borderColor: primaryColor,
                                text: "Follow",
                                textColor: primaryColor,
                                // cusMethod: () async {
                                //   await FirestoreMethods().followUser(FirebaseAuth.instance.currentUser!.uid, userData['uid']);
                                //   setState(() {
                                //     isFollowing = true;
                                //     followers++;
                                //   });
                                // },
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    // userData['username'],
                    'username',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 1),
                  // child: Text(userData['bio']),
                  child: Text('bio'),
                ),
              ],
            ),
          ),
          const Divider(),
          FutureBuilder(
              future: FirebaseFirestore.instance.collection('posts').where('uid', isEqualTo: widget.uid).get(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 1.5,
                        childAspectRatio: 1
                    ),
                    itemBuilder: (context, index){
                      DocumentSnapshot snap = (snapshot.data! as dynamic).docs[index];
                      return Container(
                        child: Image(
                          image: NetworkImage(
                            snap['postUrl'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                );
              }
          ),
        ],
      ),
    );
  }
}
