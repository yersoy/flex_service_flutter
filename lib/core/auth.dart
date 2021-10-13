import 'dart:convert';
import 'dart:io';

import 'package:flexserviceflutter/core/routes.dart';
import 'package:flexserviceflutter/utils/utils.dart';
import 'package:flutter/material.dart';

import '/core/Models/AccountModel.dart';
import '/core/Models/ParamModels.dart';
import '/core/constants.dart';
import '/core/firebase.dart';
import '/core/localdb.dart';

import 'package:http/http.dart' as http;

class Authorization {
  static Future<void> userLogin(String name, String password, context) async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri loginuri;
    loginuri = ssl == true
        ? Uri.https(server, Constants.loginPath)
        : Uri.http(server, Constants.loginPath);
    String token = await FCM.getToken();
    return await http
        .post(loginuri,
            body: LoginParams(
              UserName: name,
              Password: password,
              PushNotificationPlatform: Platform.localeName,
              PushNotificationRegistrationId: token,
            ).toJson())
        .then((value) async {
      AccountDetails details =
          new AccountDetails.fromJson(jsonDecode(value.body));
      if (details.success == true) {
        await LocalDB.setUser(value.body.toString());
        Navigator.pushReplacementNamed(context, "");
        Utils.showAuthedSnack(context, "Başarıyla Giriş Yapıldı!");
      }
      print(value.body.toString());
      Utils.showDefaultSnack(context, "Kullancı adı veya Şifre Yanlış");
    });
  }
}
