import 'package:firebase/screen/addData/view/addTask_screen.dart';
import 'package:firebase/screen/profile/profile_screen.dart';
import 'package:firebase/screen/userside/view/bay_screen.dart';
import 'package:firebase/screen/userside/view/cart_screen.dart';
import 'package:firebase/screen/userside/view/det.dart';
import 'package:firebase/screen/userside/view/show_data.dart';
import 'package:firebase/screen/userside/view/start_screen.dart';
import 'package:firebase/screen/view/detils_screen.dart';
import 'package:firebase/screen/view/signIn.dart';
import 'package:firebase/screen/view/signUp.dart';
import 'package:firebase/screen/view/splsh/home_screen.dart';
import 'package:firebase/screen/view/splsh/splsh_screen.dart';
import 'package:firebase/utils/notifiction_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await NotifictioService.notifictioService.initNotification();


  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [

        GetPage(name: '/', page: () => SplshScreen(),),
        GetPage(name: '/second', page: () => SplshScreen(),),
        GetPage(name: '/signin', page: () => SignInScreen(),),
        GetPage(name: '/signup', page: () => SignUpScreen(),),
        GetPage(name: '/home', page: () => HomeScreen(),),
        GetPage(name: '/add', page: () => AddTaskScreen(),),
        GetPage(name: '/profile', page: () => ProfileScreen(),),
        GetPage(name: '/details', page: () => DetilsScreen(),),
        GetPage(name: '/user', page: () => ShowData(),),
        GetPage(name: '/cart', page: () => CartScreen(),),
        GetPage(name: '/det', page: () => DetScreen(),),
        GetPage(name: '/start', page: () => StartScreen(),),
        GetPage(name: '/bay', page: () => BayScreen(),),
      ],
    )
  );
}