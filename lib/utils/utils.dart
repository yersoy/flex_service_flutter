import 'package:flexserviceflutter/core/localdb.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static void showAuthedSnack(BuildContext context, String message) {
    LocalDB.getUser().then((value) => Flushbar(
          title: "Sayın " + value.data.userAccountInfo.personalName,
          message: message,
          duration: Duration(seconds: 3),
        )..show(context));
  }

  static void showDefaultSnack(BuildContext context, String message) {
    Flushbar(
      title: "Ritma Flex",
      message: message,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
