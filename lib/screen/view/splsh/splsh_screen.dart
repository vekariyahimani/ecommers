import 'dart:async';

import 'package:firebase/screen/view/second_screen.dart';
import 'package:firebase/screen/view/signIn.dart';
import 'package:firebase/utils/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplshScreen extends StatefulWidget {
  const SplshScreen({Key? key}) : super(key: key);

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
  User? user;
  @override


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () async {
      user = await  FireBaseHelper.fireBaseHelper.firebaseAuth.currentUser;
      if(user==null)
      {
        Get.offAndToNamed('/signin');
      }
      else
      {
        Get.offAndToNamed('/home');
      }
    });
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            alignment: Alignment.topCenter,
            child: Container(
              height: 360,
              width: double.infinity,
              child: Image.asset("assets/image/1.jpg",fit: BoxFit.cover,),
            ),
          ),
          Positioned(
            top: 290,
              left: -90,
              child:
              Container(
                height: 550,
                width: 550,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black
                ),child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      height: 100,
                        width: 100,
                        child: Image.asset("assets/image/2.png")),
                    SizedBox(height: 100,),

                    Text("GRAURY",style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.w500),),
                    SizedBox(height: 40,),
                    Text("JEWELARY ALWAYS FITS",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                  ],
                ),
              ))

        ],
      ),
    ));
  }
}
