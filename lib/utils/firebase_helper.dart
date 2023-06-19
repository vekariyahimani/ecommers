import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/screen/addData/modal/taskmodal.dart';
import 'package:firebase/utils/notifiction_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseHelper {
  static FireBaseHelper fireBaseHelper = FireBaseHelper._();

  FireBaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> signUp({required email, required password}) async {
    String msg = "";
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => msg = "Success")
        .catchError((e) => msg = "$e");
    return msg;
  }

  Future<String?> signIn({required email, required password}) async {
    String? msg;

    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => msg = "Success")
        .catchError((e) => msg = "$e");

    return msg;
  }

  bool checkUser() {
    User? user;
    return user != null;
  }

  Future<String> sighInWithGoogle() async {
    String msg = "";
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication auth = await googleSignInAccount!.authentication;

    AuthCredential crd = GoogleAuthProvider.credential(
        accessToken: auth.accessToken, idToken: auth.idToken);

    return await firebaseAuth
        .signInWithCredential(crd)
        .then((value) => null)
        .then((value) => msg = "Success")
        .catchError((e) => msg = "$e");
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut().then((value) => Get.offAndToNamed('/second'));
  }

  Map<String, String?> userDetails() {
    User? user = firebaseAuth.currentUser;

    String? email = user!.email;
    String? img = user.photoURL;
    String? name = user.displayName;

    return {"email": email, "img": img, "name": name};
  }

  String getuid() {
    User? user = firebaseAuth.currentUser;
    String? uid = user!.uid;
    return uid;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readData() {
    String? uid = getuid();
    return firestore
        .collection("product")
        .doc('$uid')
        .collection('data')
        .snapshots();
  }

  void addTask({product, price, desc, rate, descount, image,}) {
    String uid = getuid();

    firestore.collection("product").doc(uid).collection("data").add({
      "product": product,
      "price": price,
      "desc":desc,
      "descount":descount,
      "rate":rate,
      "image":image,
    });
  }

  void updateData(TaskModel task) {
    String uid = getuid();

    firestore
        .collection("product")
        .doc("$uid")
        .collection("data")
        .doc(task.key)
        .set({
      "product": "${task.product}",
      "price": "${task.price}",
      "rate": "${task.rate}",
      "desc": "${task.desc}",
      "descount": "${task.descount}",
      "image": "${task.image}",
    });
  }

  Future<void> deletData(String key) async {
    String uid = getuid();

    await firestore
        .collection("product")
        .doc("$uid")
        .collection("data")
        .doc(key)
        .delete();
  }

  FirebaseMessaging firebaseMessaging=FirebaseMessaging.instance;

  Future<void> initFirebaseMSG()
  async {
    var fcmToken=await firebaseMessaging.getToken();


    print("Token============$fcmToken");

    await firebaseMessaging.setAutoInitEnabled(true);
    NotificationSettings settings=await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,

    );


    FirebaseMessaging.onMessage.listen((msg) {

      if(msg.notification!=null)
        {
          String? title=msg.notification!.title;
          String? body=msg.notification!.body;


          NotifictioService.notifictioService.showFireNotification(title!, body!);


        }
    });
  }



  Stream<QuerySnapshot<Map<String, dynamic>>> userReadData() {
    return firestore.collection("user data").doc("user").collection("cart").snapshots();
  }

  void cart(TaskModel task)
  {
    String uid =getuid();

    firestore.collection('cart').doc('$uid').collection("data").add(
      {
        "product": "${task.product}",
        "price": "${task.price}",
        "rate": "${task.rate}",
        "desc": "${task.desc}",
        "descount": "${task.descount}",
        "image": "${task.image}",
      }
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readcart()
  {
    String uid =getuid();
    return firestore.collection('cart').doc('$uid').collection('data').snapshots();
  }
}
