import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:http/http.dart' as http;

class NotifictioService {
  static NotifictioService notifictioService = NotifictioService._();

  NotifictioService._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initNotification() {
    AndroidInitializationSettings androidSetting =
        AndroidInitializationSettings('appicon');

    DarwinInitializationSettings iOSSeting = DarwinInitializationSettings();

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidSetting, iOS: iOSSeting);

    tz.initializeTimeZones();

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  showNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("1", "ANDROID");

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    flutterLocalNotificationsPlugin.show(
        1, "Flutter Show Notification", "show", notificationDetails);
  }

  showScedualeNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("1", "ANDROID");

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        "Flutter Sceduale Notification",
        "Sceduale",
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 3)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  soundNotification() {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("1", "ANDROID",
            sound: RawResourceAndroidNotificationSound('ringtone'));

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);


    flutterLocalNotificationsPlugin.show(
        1, "Flutter Show Notification", "music", notificationDetails);


  }

  imageNotification()
  async {
    String link="https://cdn.notonthehighstreet.com/fs/28/41/4c33-fe8d-4282-b1b5-47632dd015bc/original_granny-necklace-or-bracelet.jpg";
    var base64=await baseToUrl(link);


    BigPictureStyleInformation bigPictureStyleInformation=BigPictureStyleInformation(ByteArrayAndroidBitmap.fromBase64String(base64));

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails("1", "ANDROID",
        styleInformation: bigPictureStyleInformation);

    DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

   await flutterLocalNotificationsPlugin.show(
        1, "Flutter Show Image Notification", "image", notificationDetails);



  }
  baseToUrl(String link)
  async {


    var response =await http.get(Uri.parse(link));
    var base64=base64Encode(response.bodyBytes);
    return base64;

  }


  showFireNotification(String title ,String body)

  async {

    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails("1", "ANDROID",);

    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);



    await flutterLocalNotificationsPlugin.show(
        1, "$title", "$body", notificationDetails);



  }

}
