import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              "https://cdn.shopify.com/s/files/1/0604/9257/8980/products/NL-PR-10673.CR_15813a70-15cf-4ba1-8081-6cdb113f3595.jpg?v=1663928280",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black45),
          ),
          Positioned(
              top: 700,
              left: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  Get.toNamed('/user');
                },
                child: Container(
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        letterSpacing: 1),
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
