import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flexserviceflutter/utils/utils.dart';
import 'package:flutter/material.dart';

class FCM {
  static Future<bool> getPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
    return true;
  }

  static Future<bool> initialize() {
    return Firebase.initializeApp().then((app) {
      if (app != null) {
        return true;
      }

      return false;
    });
  }

  static Future<String> getToken(context) {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((message) {
      print('Got a message whilst in the foreground!');

      if (message.notification != null) {
        Utils.showAuthedSnack(context, message.notification?.title);
      }
    });
    return messaging.getToken().then((value) {
      return value;
    });
  }
}
