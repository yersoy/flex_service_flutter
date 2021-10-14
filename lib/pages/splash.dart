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
  Completer<GoogleMapController> _controller = Completer();
  check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      timer?.cancel();
      setState(() {
        net = true;
      });
      return;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      timer?.cancel();
      setState(() {
        net = true;
      });
      return;
    }
    setState(() {
      net = false;
    });
    return;
  }

  init() async {
    await check();
    if (net == true) {
      timer?.cancel();
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
    } else {
      timer = Timer.periodic(Duration(seconds: 5), (Timer t) => init());
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    timer?.cancel();
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
          child: net == true
              ? CircularProgressIndicator(
                  backgroundColor: Colors.blueGrey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                )
              : Text(
                  "İnternet Bağlantısı Gerekiyor",
                  style: const TextStyle(
                    color: Color(0xFF1777F2),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
        ),
      ),
    );
  }
}
