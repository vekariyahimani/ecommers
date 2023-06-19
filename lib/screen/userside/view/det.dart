import 'package:firebase/screen/controller/firebase_controller.dart';
import 'package:firebase/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetScreen extends StatefulWidget {
  const DetScreen({Key? key}) : super(key: key);

  @override
  State<DetScreen> createState() => _DetScreenState();
}

class _DetScreenState extends State<DetScreen> {
  FireBaseController fireBaseController = Get.put(FireBaseController());
  var args;

  @override
  void initState() {
    super.initState();
    args = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black54,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back,color: Colors.white,)),
                          SizedBox(
                            width: 65,
                          ),
                          Text(
                            "Detalis Product",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 250,
                        width: double.infinity,
                        child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network("${args.image}",fit: BoxFit.cover,)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${args.product}",
                              style: TextStyle(color: Colors.white70, fontSize: 20),
                            ),
                            Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ]),
                                child: Icon(Icons.favorite_border)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "\$  ${args.price}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Discount ( ${args.descount} % )",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Choose the color",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 45,
                            width: 65,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            height: 45,
                            width: 65,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            height: 45,
                            width: 65,
                            decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            height: 45,
                            width: 65,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            height: 45,
                            width: 65,
                            decoration: BoxDecoration(
                                color: Colors.yellow.shade50,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/image/1.jpg"),
                          ),
                          SizedBox(width: 15,),
                          Column(
                            children: [
                              Text(
                                "GRAURY STORE",
                                style:
                                TextStyle(fontWeight: FontWeight.w500,color: Colors.white70, fontSize: 16),
                              ),
                              Text("online digital store",style: TextStyle(color: Colors.white54),)
                            ],
                          ),
                          SizedBox(width: 30,),
                          Container(
                            height: 45,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, 1),
                                      color: Colors.black12,
                                      blurRadius: 1,
                                      spreadRadius: 1
                                  )
                                ]
                            ),child: Center(
                            child: Text("Follow"),
                          ),
                          ),

                        ],
                      ),

                      SizedBox(height: 20,),
                      Text("${args.desc}",style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 60,),
                      InkWell(
                        onTap: () {
                          FireBaseHelper.fireBaseHelper.cart(args);
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width:double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.20),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),child: Center(
                            child: Text("Add To Cart",style: TextStyle(color: Colors.white70,fontSize: 16,fontWeight: FontWeight.w600),),
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
