import 'package:flexserviceflutter/core/localdb.dart';

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
    return ListView(shrinkWrap: true, children: [
      if (this.widget.data.serviceProductList.length == 0)
        Padding(
          padding: EdgeInsets.all(15),
          child: Card(
            child: ListTile(
              title: Text("İşçilik Bulunamadı"),
            ),
          ),
        ),
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
    ]);
  }
}
