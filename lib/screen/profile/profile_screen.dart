import 'package:firebase/utils/notifiction_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.menu_open,
                        color: Colors.white54,
                      ),
                      Icon(
                        Icons.settings_outlined,
                        color: Colors.white54,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/profile/himani.jpg"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "HIMANI VEKARIYA",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white70,
                          size: 18,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Gujrat , India",
                          style: TextStyle(color: Colors.white70),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 420,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  "assets/image/facebook.png",
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  "assets/image/instagram.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  "assets/image/twitter.png",
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                      title: "Notification",
                                      content: Column(
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    NotifictioService
                                                        .notifictioService
                                                        .showScedualeNotification();
                                                  },
                                                  icon: Icon(Icons.timer_outlined)),
                                              Text("Sceduale Notifiction")
                                            ],
                                          ),
                                          Row(
                                            children: [ IconButton(
                                                onPressed: () {
                                                  NotifictioService.notifictioService.showNotification();
                                                },
                                                icon: Icon(Icons.notifications)),
                                              Text("Show Notifiction")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    NotifictioService.notifictioService.soundNotification();
                                                  },
                                                  icon: Icon(Icons.music_note)),
                                              Text("Ringtone Notifiction")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                  onPressed: () {
                                  NotifictioService.notifictioService.imageNotification();
                                  },
                                  icon: Icon(Icons.image),),
                                              Text("Image Notifiction")
                                            ],
                                          ),

                                        ],
                                      ));
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(
                                    "assets/image/notification 1.png",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.email_outlined,color: Colors.white,),
                        Text("himanivekariya109@gmail.com",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    ),),
                    Padding(padding: EdgeInsets.all(10),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),child: Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.phone,color: Colors.white,),
                        SizedBox(width: 15,),

                        Text("7623065575",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    ),),
                    Padding(padding: EdgeInsets.all(10),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),child: Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.location_on_outlined,color: Colors.white,),
                        SizedBox(width: 15,),

                        Text("satathr sos, a.k.road,surat",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    ),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
