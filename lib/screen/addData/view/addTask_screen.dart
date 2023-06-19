import 'package:firebase/screen/addData/modal/taskmodal.dart';
import 'package:firebase/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var args;
  TextEditingController txtProduct = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtRate = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  TextEditingController txtDescount = TextEditingController();
  TextEditingController txtImage = TextEditingController();

  @override
  void initState() {
    super.initState();

    args = Get.arguments;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (args['status'] == 1) {
      txtProduct = TextEditingController(text: args['data'].product);
      txtPrice = TextEditingController(text: args['data'].price);
      txtRate = TextEditingController(text: args['data'].rate);
      txtDesc = TextEditingController(text: args['data'].desc);
      txtDescount = TextEditingController(text: args['data'].descount);
      txtImage = TextEditingController(text: args['data'].image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Icon(Icons.more_vert),
          SizedBox(width: 15,),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: txtProduct,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.production_quantity_limits,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white),


                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Product",

                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.white),


                cursorColor: Colors.white,
                controller: txtPrice,
                decoration: InputDecoration(

                    prefixIcon: Icon(
                      Icons.currency_rupee,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Price",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.white),

                cursorColor: Colors.white,
                controller: txtRate,
                decoration: InputDecoration(

                    prefixIcon: Icon(
                      Icons.rate_review_outlined,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Rate",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.white),

                cursorColor: Colors.white,
                controller: txtDesc,
                decoration: InputDecoration(

                    prefixIcon: Icon(
                      Icons.description_outlined,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Description",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.white),

                cursorColor: Colors.white,
                controller: txtDescount,
                decoration: InputDecoration(

                    prefixIcon: Icon(
                      Icons.av_timer,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Discount",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.white),

                cursorColor: Colors.white,
                controller: txtImage,
                decoration: InputDecoration(

                    prefixIcon: Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: "Images",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    if (args['status'] == 1) {
                      TaskModel t1 = TaskModel(
                          key: args['data'].key,
                          product: txtProduct.text,
                          price: txtPrice.text,
                          rate: txtRate.text,
                          descount: txtDescount.text,
                          desc: txtDesc.text,
                          image: txtImage.text);
                      FireBaseHelper.fireBaseHelper.updateData(t1);
                      Get.toNamed('/home');
                    } else {
                      FireBaseHelper.fireBaseHelper.addTask(
                          product: txtProduct.text,
                          price: txtPrice.text,
                          rate: txtRate.text,
                          desc: txtDesc.text,
                          descount: txtDescount.text,
                          image: txtImage.text);

                      Get.toNamed('/home');
                    }
                  },
                  child: Text(
                    args['status'] == 1 ? "Update data" : "Add data",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
