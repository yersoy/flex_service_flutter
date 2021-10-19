import 'dart:convert';

import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/core/models/ServiceModel.dart';
import 'package:flexserviceflutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class ServiceFinish extends StatefulWidget {
  ServiceList data;
  List<Point> sign;
  ServiceFinish({Key key, this.data, @required this.sign}) : super(key: key);

  @override
  _ServiceFinishState createState() => _ServiceFinishState();
}

class _ServiceFinishState extends State<ServiceFinish> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.value = this.widget.sign;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text("Lütfen Gri Alanı İmzalayın"),
          trailing: TextButton(
            onPressed: () async {
              await LocalDB.getUploadService(
                      this.widget.data.serviceInfo.serviceId.toString())
                  .then((value) async {
                this.widget.sign = _controller.value;
                value.signatureImageBase64Str =
                    base64Encode(await _controller.toPngBytes());

                await LocalDB.saveUploadService(
                        this.widget.data.serviceInfo.serviceId.toString(),
                        value)
                    .then((value) {
                  Utils.showAuthedSnack(context, "İmza Kaydedildi");
                });
              });
            },
            child: Text("İmzayı Kaydet"),
          ),
        ),
        Signature(
          controller: _controller,
          width: MediaQuery.of(context).size.width,
          height: 260,
          backgroundColor: Color(0xFFe6eef5),
        ),
        Center(
          child: TextButton(
            onPressed: () async {
              _controller.clear();
            },
            child: Text("İMZAYİ TEMİZLE"),
          ),
        ),
      ],
    );
  }
}
