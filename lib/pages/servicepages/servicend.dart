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
    LocalDB.getService(this.widget.data.serviceInfo.serviceId.toString())
        .then((value) async {
      await Services.uploadService(
              this.widget.data.serviceInfo.serviceId, this.widget.data)
          .then((value) {
        if (value != null) {
          setState(() {
            loading = false;
          });
          if (json.decode(value.body)["Success"] == true)
            Utils.showAuthedSnack(context, "Başarıyla Kaydedildi");
          if (json.decode(value.body)["Success"] == false)
            Utils.showAuthedSnack(
                context, "Hata : " + json.decode(value.body)["Message"]);
        } else {
          Utils.showAuthedSnack(context, "Servis Cihaza Kaydedildi. ");
          setState(() {
            loading = false;
          });
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (loading == false)
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: ListTile(
                    title: Text(this.widget.data.customerInfo.customerName),
                    subtitle: Text(this.widget.data.serviceDetail.serviceNo),
                    trailing: TextButton(
                        onPressed: () {
                          sendService();
                        },
                        child: Text("Servisi Gönder")),
                  ),
                ),
              ),
            ],
          ),
        if (loading)
          Center(
            child: Container(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueGrey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
      ],
    );
  }
}
