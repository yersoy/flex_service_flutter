import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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

  static getToken() {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    return messaging.getToken().then((value) {
      return value;
    });
  }
}
