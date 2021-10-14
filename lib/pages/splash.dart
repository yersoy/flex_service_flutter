import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flexserviceflutter/core/models/AccountModel.dart';
import 'package:flexserviceflutter/core/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/core/Routes.dart';
import '/core/firebase.dart';
import '/core/localdb.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool net = true;
  Timer timer;

  init() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
      playSound: true,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        .createNotificationChannel(channel);
    await FCM.initialize();
    await FCM.getPermission();
    await LocalDB.isAuthancated(context);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0e1124),
      body: Center(
        child: Container(
            width: net == false ? MediaQuery.of(context).size.width - 70 : 70,
            height: 70,
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueGrey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            )),
      ),
    );
  }
}
