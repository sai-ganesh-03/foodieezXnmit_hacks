import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nmit_hacks2/screens/home_base.dart';
import 'package:provider/provider.dart';
import 'package:nmit_hacks2/values/colors.dart';

import '../services/google_sign_in.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          Timer(
              const Duration(seconds: 3),
                  ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeBase()))
          );
        }
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black12, Colors.black12, Colors.blueAccent.withOpacity(0.1), ],

              ),
            ),
            child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: 450,
                        width: 450,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/logo.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    (!snapshot.hasData) ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 27),
                          child: Text(
                            "Continue Login with",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                            provider.googleLogin();
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[100]
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(width: 30,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Google account",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "******@gmail.com",
                                        style: TextStyle(
                                          fontSize: 14
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: primaryColor,
                                  size: 30,
                                ),
                                SizedBox(width: 15,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ) :

                    SpinKitRipple(
                      color: primaryColor,
                      size: 80,
                      duration: const Duration(milliseconds: 1000),
                    ),
                    const SizedBox(height: 60,),

                  ],
                )
            ),
          ),
        );
      },
    );

  }
}
