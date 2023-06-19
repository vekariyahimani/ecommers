import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screen/addData/modal/taskmodal.dart';
import 'package:firebase/screen/controller/firebase_controller.dart';
import 'package:firebase/utils/firebase_helper.dart';
import 'package:firebase/utils/notifiction_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    FireBaseHelper.fireBaseHelper.initFirebaseMSG();
  }

  FireBaseController fireBaseController = Get.put(FireBaseController());

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      FireBaseHelper.fireBaseHelper.getuid();
    });
    return SafeArea(
        child: Scaffold(

      backgroundColor: Colors.grey.shade900,
      drawer: Drawer(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(color: Colors.black26),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        radius: 150,
                        backgroundImage:
                            AssetImage("assets/profile/himani.jpg"),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "HIMANI VEKARIYA  ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  Text(
                    "himanivekariya09@gmail.com  ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 2,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.black26),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.black26,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black26,
                    ),
                    title: Text(
                      "Account",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Get.toNamed('/profile');
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.black26,
                    ),
                    title: Text(
                      "Setting",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.black26,
                    ),
                    title: Text(
                      "info",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        Get.toNamed('/details');
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: InkWell(
                        onTap: () {
                          FireBaseHelper.fireBaseHelper.signOut();
                        },
                        child: Icon(
                          Icons.logout_outlined,
                          color: Colors.black26,
                        )),
                    title: Text(
                      "Log out",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.help,
                      color: Colors.black26,
                    ),
                    title: Text(
                      "Help",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black26,
                    ),
                    title: Text(
                      "Order",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/image/admin.png",
                      height: 30,
                      width: 30,
                    ),
                    title: Text(
                      "Admin Side",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Get.toNamed('/');
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/image/teamwork.png",
                      height: 30,
                      width: 30,
                    ),
                    title: Text(
                      "User Side",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        Get.toNamed('/start');
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FireBaseHelper.fireBaseHelper.readData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<TaskModel> taskList = [];
            var snapData = snapshot.data!.docs;
            for (var x in snapData) {
              TaskModel t1 = TaskModel(
                price: x['price'],
                rate: x['rate'],
                desc: x['desc'],
                descount: x['descount'],
                image: x['image'],
                key: x.id,
                product: x['product'],
              );
              taskList.add(t1);
            }
            return Column(
              children: [

                Expanded(
                    child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10)),
                        child: ExpansionTile(
                          backgroundColor: Colors.black,
                          leading: Container(
                              height: 300,
                              width: 80,
                              child: Image.network("${taskList[index].image}")),
                          title: Text(
                            "${taskList[index].product}",
                            style: TextStyle(color: Colors.white70),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                "${taskList[index].rate}",
                                style: TextStyle(color: Colors.white70),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "assets/image/star.png",
                                height: 16,
                                width: 16,
                              ),
                              Image.asset(
                                "assets/image/star.png",
                                height: 16,
                                width: 16,
                              ),
                              Image.asset(
                                "assets/image/star.png",
                                height: 16,
                                width: 16,
                              ),
                            ],
                          ),
                          trailing: Text(
                            "\$ ${taskList[index].price}",
                            style: TextStyle(color: Colors.white70),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    TaskModel t1 = TaskModel(
                                        price: taskList[index].price,
                                        product: taskList[index].product,
                                        rate: taskList[index].rate,
                                        key: taskList[index].key,
                                        desc: taskList[index].desc,
                                        descount: taskList[index].descount,
                                        image: taskList[index].image);
                                    Get.toNamed('/add',
                                        arguments: {"status": 1, "data": t1});
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white70,
                                      ),
                                      Text(
                                        "Update",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    FireBaseHelper.fireBaseHelper
                                        .deletData("${taskList[index].key}");
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        color: Colors.white70,
                                      ),
                                      Text(
                                        "Remove",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    TaskModel m1 = TaskModel(
                                        price: taskList[index].price,
                                        product: taskList[index].product,
                                        rate: taskList[index].rate,
                                        key: taskList[index].key,
                                        desc: taskList[index].desc,
                                        descount: taskList[index].descount,
                                        image: taskList[index].image);
                                    Get.toNamed('/details', arguments: m1);
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.white70,
                                      ),
                                      Text(
                                        "Info Product",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.toNamed('/add', arguments: {'status': 0});
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
