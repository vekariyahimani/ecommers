import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase/screen/addData/modal/taskmodal.dart';
import 'package:firebase/screen/controller/firebase_controller.dart';
import 'package:firebase/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  FireBaseController fireBaseController = Get.put(FireBaseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black54,
            body: StreamBuilder(
              stream: FireBaseHelper.fireBaseHelper.readData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  var data = snapshot.data!.docs;

                  List<TaskModel> productList = [];

                  for (var x in data) {
                    TaskModel t1 = TaskModel(
                      price: x['price'],
                      rate: x['rate'],
                      desc: x['desc'],
                      descount: x['descount'],
                      image: x['image'],
                      key: x.id,
                      product: x['product'],
                    );
                    productList.add(t1);
                  }
                  return Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 10, right: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Delivery address",
                                      style: TextStyle(color: Colors.white54),
                                    ),
                                    Text(
                                      "Salatiga City,Central Java",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                InkWell(
                                    onTap: () {
                                      Get.toNamed('/cart');
                                    },
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.notifications_active_outlined,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black)),
                              child: TextField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  prefixIcon: Icon(Icons.search_rounded),
                                  hintText: "Search here....",
                                  hintStyle: TextStyle(color: Colors.black)
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                height: 100,
                                width: 480,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    fireBaseController!.jimage[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              autoPlay: true,
                              height: 200,
                              aspectRatio: 1,
                              viewportFraction: 0.8,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              enlargeFactor: 0.3,
                              initialPage: 2,
                              autoPlayInterval: Duration(seconds: 3),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Text(
                              "Recent Product",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            SizedBox(width: 140,),
                            Text("Filter",     style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),),
                            SizedBox(width: 13,),
                            Icon(Icons.filter_alt_outlined,color: Colors.white,)
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3 / 4, crossAxisCount: 2),
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                TaskModel m1 = TaskModel(
                                    price: productList[index].price,
                                    product: productList[index].product,
                                    rate: productList[index].rate,
                                    key: productList[index].key,
                                    desc: productList[index].desc,
                                    descount: productList[index].descount,
                                    image: productList[index].image);
                                Get.toNamed('/det', arguments: m1);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 130,
                                      width: 200,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "${productList[index].image}",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                  SizedBox(height: 2,),
                                  Text(
                                    " ${productList[index].product}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.white54),
                                  ),
                                  SizedBox(height: 6,),
                                  Text(
                                    " Rs ${productList[index].price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white70),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.shade800),
                                    alignment: Alignment.center,
                                    child: Text("Add to cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          itemCount: productList.length,
                        ),
                      )
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            )));
  }
}
