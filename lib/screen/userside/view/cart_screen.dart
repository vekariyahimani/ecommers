import 'package:firebase/screen/addData/modal/taskmodal.dart';
import 'package:firebase/screen/controller/firebase_controller.dart';
import 'package:firebase/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  FireBaseController fireBaseController = Get.put(FireBaseController());
  var args;

  @override
  void initState() {
    super.initState();
    args = Get.arguments;
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
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
                        )),
                    Text(
                      "Your Cart",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white70,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                  stream: FireBaseHelper.fireBaseHelper.readcart(),
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
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3 / 5, crossAxisCount: 2),
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
                                      height: 155,
                                      width: 200,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "${productList[index].image}",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    " ${productList[index].product}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.white70),
                                  ),
                                  Text(
                                    " Rs ${productList[index].price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.white54),
                                  ),
                                  Text(
                                    " Discount (${productList[index].descount}%)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: Colors.green.shade800),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Get.toNamed('/bay');
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 50,
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),

                                              color: Colors.grey.shade800),
                                          alignment: Alignment.center,
                                          child: Text("Buy",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15)),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FireBaseHelper.fireBaseHelper
                                              .deletData(
                                                  "${productList[index].key}");
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 90,
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey.shade800),
                                          alignment: Alignment.center,
                                          child: Text("Remove",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          itemCount: productList.length,
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
