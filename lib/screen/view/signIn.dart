import 'package:firebase/utils/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
            child: Padding(
              padding: EdgeInsets.only(top: 25, left: 15, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 230),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 70, right: 25, left: 25),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 330,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          controller: txtemail,
                          decoration: InputDecoration(
                              hintText: "UserEmail",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.black38),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        width: 330,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          controller: txtpassword,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.black38),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        height: 50,
                        width: 280,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                          onTap: () async {
                            String? msg = await FireBaseHelper.fireBaseHelper
                                .signIn(
                                    email: txtemail.text,
                                    password: txtpassword.text);

                            Get.snackbar("$msg", "");

                            if (msg == "Success") {
                              Get.toNamed('/home');
                            }
                          },
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: () async {

                          String? msg = await FireBaseHelper.fireBaseHelper.sighInWithGoogle();

                          Get.snackbar("$msg", "Success Full Logins");

                          if (msg == "Success") {
                            Get.offAndToNamed("/home");
                          }

                        },
                        child: Container(
                          height: 60,
                          width: 280,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2),
                                )
                              ]),
                          child: Center(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset("assets/image/g1.png")),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Contiune with Google",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 45,),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/signup');
                        },
                        child: Text(
                          "Creeate an Account! Sign Up",
                          style: TextStyle(
                              color: Colors.blue.shade800,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
