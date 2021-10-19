import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/core/models/ServiceModel.dart';
import 'package:flutter/material.dart';

class ServiceMaterials extends StatefulWidget {
  final ServiceList data;
  ServiceMaterials({Key key, this.data}) : super(key: key);

  @override
  _ServiceMaterialsState createState() => _ServiceMaterialsState();
}

class _ServiceMaterialsState extends State<ServiceMaterials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {},
      // ),
      body: ListView(shrinkWrap: true, children: [
        if (this.widget.data.serviceProductList.length == 0)
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Image.asset("assets/images/service.png"),
              ],
            ),
          ),
        if (this.widget.data.serviceProductList.length == 0)
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'İşçilik Eklenmedi',
                    style: const TextStyle(
                      color: Color(0xFF1777F2),
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (this.widget.data.serviceProductList.length != 0)
          ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: this.widget.data.serviceProductList.length,
              itemBuilder: (BuildContext context, int index) {
                ServiceProductList service =
                    this.widget.data.serviceProductList[index];
                return ListTile(
                  title: Text(service.productName),
                  subtitle: RichText(
                    text: TextSpan(
                      text: service.productCount.toString(),
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: " Adet ",
                        ),
                        TextSpan(
                          text: service.productStrSalePrice,
                        ),
                      ],
                    ),
                  ),
                  trailing: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      setState(() {
                        this.widget.data.serviceProductList.remove(service);
                      });
                      LocalDB.saveService(
                          this.widget.data.serviceInfo.serviceId.toString(),
                          this.widget.data);
                    },
                    child: Icon(Icons.delete_outline),
                  ),
                );
              }),
      ]),
    );
  }
}
