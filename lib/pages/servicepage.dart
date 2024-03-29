import 'dart:convert';
import 'dart:typed_data';

import 'package:flexserviceflutter/core/localdb.dart';

import 'package:flexserviceflutter/pages/servicepages/customerProductAdd.dart';
import 'package:flexserviceflutter/pages/servicepages/servicend.dart';

import 'package:flexserviceflutter/pages/servicepages/servicestatus.dart';
import 'package:flexserviceflutter/pages/servicepages/servicematerials.dart';
import 'package:flexserviceflutter/pages/servicepages/servicephotos.dart';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';

import '/core/models/ServiceModel.dart';
import '/core/services.dart';
import '/pages/servicepages/servicedetail.dart';

import 'package:flutter/material.dart';

import 'servicePages/servicefinish.dart';
import 'servicepages/servicematerialadd.dart';
import 'servicepages/servicepreview.dart';
import 'servicepages/serviceproducts.dart';

class ServicePage extends StatefulWidget {
  ServiceList data;
  ServicePage({Key key, this.data}) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Point> signdata = new List<Point>();
  int pageIndex;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 8, vsync: this);
    _controller.addListener(() {
      setState(() {
        pageIndex = _controller.index;
      });
    });
    LocalDB.getUser().then((value) {
      Services.servicesUpdateReading(
          this.widget.data.serviceInfo.serviceId.toString(),
          value.data.userAccountInfo.sessionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Color(0xFF1777F2)),
        backgroundColor: Colors.white,
        title: Text(
          this.widget.data.customerInfo.customerName,
          style: const TextStyle(
            color: Color(0xFF1777F2),
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
        ),
        centerTitle: false,
        actions: <Widget>[
          if (_controller.index == 1)
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Color(0xFFe6eef5),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 24,
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerProductAdd(
                              data: this.widget.data,
                            )),
                  );
                },
              ),
            ),
          if (_controller.index == 2)
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Color(0xFFe6eef5),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 24,
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MaterialAdd(data: this.widget.data)),
                  );
                },
              ),
            ),
          SizedBox(
            width: 10,
          )
        ],
        bottom: TabBar(
          labelColor: Color(0xFF1777F2),
          unselectedLabelColor: Colors.grey,
          controller: _controller,
          isScrollable: true,
          tabs: <Widget>[
            Tab(text: "Detay"),
            Tab(text: "Cihazlar"),
            Tab(text: "İşçilik / Malzeme"),
            Tab(text: "Fotoraflar"),
            Tab(text: "Onay"),
            Tab(text: "Önizleme"),
            Tab(text: "İmzalayın"),
            Tab(text: "Bitir"),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                children: <Widget>[
                  ServiceDetailPage(data: this.widget.data),
                  ServiceProducts(data: this.widget.data),
                  ServiceMaterials(data: this.widget.data),
                  ServicePhotos(data: this.widget.data),
                  ServiceStatus(data: this.widget.data),
                  ServicePreview(data: this.widget.data),
                  ServiceFinish(
                    data: this.widget.data,
                    sign: signdata,
                  ),
                  ServiceEnd(data: this.widget.data),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
