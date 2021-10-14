import 'dart:convert';
import 'package:flexserviceflutter/core/models/UploadService.dart';

import '/core/models/ServiceDefaults.dart';
import '/core/models/ServiceModel.dart';
import '/core/services.dart';
import 'package:flutter/material.dart';

import '/core/routes.dart';

import '/core/models/AccountModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static setServer(String server, String http) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ssl', http);
    await prefs.setString('server', server);
  }

  static Future<String> getServer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('server') != null) return prefs.getString('server');
    return null;
  }

  static Future<bool> getSsl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('ssl') != null) {
      if (prefs.getString('ssl') == "http") return false;
      return true;
    }
    return false;
  }

  static setUser(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userdata', data);
  }

  static setDate(String id, DateTime date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String st = await prefs.getString('servisdate' + id);
    if (st == null || st == "")
      await prefs.setString('servisdate' + id, date.toIso8601String());
  }

  static Future<DateTime> getDate(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String st = await prefs.getString('servisdate' + id);
    DateTime date = DateTime.parse(st);
    return date;
  }

  static setDefaults(ServiceDefaults data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('servicedefaults', json.encode(data.toJson()));
  }

  static Future<ServiceDefaults> getDefaults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String s = prefs.getString('servicedefaults');
    dynamic dataj = json.decode(s);
    ServiceDefaults data = ServiceDefaults.fromJson(dataj);
    return data;
  }

  static Future<AccountDetails> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userdata') != null) {
      dynamic jsondata = jsonDecode(prefs.getString('userdata'));
      AccountDetails data = new AccountDetails.fromJson(jsondata);
      return data;
    }
    return null;
  }

  static Future isAuthancated(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userdata') != null) {
      await Services.getServiceData();
      return Navigator.pushReplacementNamed(context, Routes.HomePage);
    } else {
      Navigator.pushReplacementNamed(context, Routes.LoginPage);
    }
  }

  static Future saveService(String id, ServiceList data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("service" + id, json.encode(data));
  }

  static Future<UploadServiceDTO> saveUploadService(
      String id, UploadServiceDTO data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    saveServiceLocal(int.parse(id));
    await prefs.setString("uploadservice" + id, json.encode(data));
    return data;
  }

  static Future<List<dynamic>> saveServiceLocal(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String s = await prefs.getString("uploaded");
    List<dynamic> data;
    if (s.isNotEmpty) {
      data = json.decode(s);
      if (data.contains(id)) {
        return data;
      } else {
        data.add(id);
        await prefs.setString("uploaded", json.encode(data));
        return data;
      }
    } else {
      data = <int>[];
      await prefs.setString("uploaded", json.encode(data));
      return data;
    }
  }

  static Future<List<dynamic>> getServiceLocal(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String s = await prefs.getString("uploaded");
    List<dynamic> data;
    if (s != null) {
      data = json.decode(s);
    } else {
      data = <dynamic>[];
    }

    return data;
  }

  static Future<ServiceList> getService(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic data = await json.decode(prefs.getString("service" + id));
    ServiceList slist = ServiceList.fromJson(data);
    return slist;
  }

  static Future<UploadServiceDTO> getUploadService(String id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      dynamic s = prefs.getString("uploadservice" + id);
      if (s != null) {
        dynamic data = await json.decode(s);
        UploadServiceDTO slist = UploadServiceDTO.fromJson(data);
        return slist;
      } else {
        UploadServiceDTO slist = new UploadServiceDTO();
        await prefs.setString(
            "uploadservice" + id, json.encode(slist.toJson()));
        return slist;
      }
    } on Exception catch (_) {
      UploadServiceDTO slist = new UploadServiceDTO();
      return slist;
    }
  }
}
