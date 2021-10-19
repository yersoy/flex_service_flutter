import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/core/models/ServiceModel.dart';
import 'package:flexserviceflutter/core/services.dart';
import 'package:flexserviceflutter/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:connectivity/connectivity.dart';

class ServiceEnd extends StatefulWidget {
  ServiceList data;
  ServiceEnd({Key key, this.data}) : super(key: key);

  @override
  _ServiceEndState createState() => _ServiceEndState();
}

class _ServiceEndState extends State<ServiceEnd> {
  bool net = false;
  bool loading = false;
  String explain = "";
  String servicestate = "";
  var dropdownValue;
  void check() async {
    var connectivityResult = await DataConnectionChecker().hasConnection;
    if (connectivityResult) {
      net = true;
    } else {
      net = false;
    }
  }

  Future sendService() async {
    setState(() {
      loading = true;
    });

    return await LocalDB.getService(
            this.widget.data.serviceInfo.serviceId.toString())
        .then((value) async {
      return await Services.uploadService(
              this.widget.data.serviceInfo.serviceId, this.widget.data)
          .then((value) {
        if (value != null) {
          setState(() {
            loading = false;
          });
          if (json.decode(value.body)["Success"] == true)
            Utils.showAuthedSnack(context, "Servis Başarıyla Gönderildi");
          if (json.decode(value.body)["Success"] == false)
            Utils.showAuthedSnack(
                context, "Hata : " + json.decode(value.body)["Message"]);
        } else {
          Utils.showAuthedSnack(context, "Servis Cihaza Kaydedildi. ");
          setState(() {
            loading = false;
          });
        }
      }).onError((error, stackTrace) {
        setState(() {
          loading = false;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
    LocalDB.getUploadService(this.widget.data.serviceInfo.serviceId.toString())
        .then((value) {
      LocalDB.getDefaults().then((value) {
        servicestate = value.data.serviceStateList[0].serviceStateName;
      });
      explain = value.explainText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        if (loading == false)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(25),
                    onTap: () {},
                    title: Text(
                      servicestate != null
                          ? "Servis " + servicestate
                          : "Servis Durumu Girilmedi",
                      style: const TextStyle(
                          color: Color(0xFF1777F2),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(25),
                    onTap: () {},
                    title: Text(
                      "Servis Açıklaması",
                      style: const TextStyle(
                          color: Color(0xFF1777F2),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                    subtitle:
                        Text(explain != null ? explain : " Açıklama Girilmedi"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(25),
                    onTap: () {
                      sendService();
                    },
                    title: Text(
                      this.widget.data.serviceDetail.serviceNo,
                      style: const TextStyle(
                          color: Color(0xFF1777F2),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                    subtitle: Text("Servisi Gönder"),
                    trailing: Image.asset(
                      "assets/images/send.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        if (loading)
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                width: 140,
                height: 140,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  backgroundColor: Colors.blueGrey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
