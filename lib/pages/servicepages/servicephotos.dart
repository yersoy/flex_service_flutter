import 'dart:convert';

import 'package:flexserviceflutter/core/localdb.dart';

import '/core/models/ServiceModel.dart';
import 'package:flutter/material.dart';

class ServicePhotos extends StatefulWidget {
  final ServiceList data;
  ServicePhotos({Key key, this.data}) : super(key: key);

  @override
  _ServicePhotosState createState() => _ServicePhotosState();
}

class _ServicePhotosState extends State<ServicePhotos> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var photo in this.widget.data.servicePhotoList)
          Card(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      title: Text("Fotoğraf"),
                      trailing: TextButton(
                          onPressed: () async {
                            setState(() {
                              this.widget.data.servicePhotoList.remove(photo);
                            });
                            await LocalDB.saveService(
                                this
                                    .widget
                                    .data
                                    .serviceInfo
                                    .serviceId
                                    .toString(),
                                this.widget.data);
                          },
                          child: Text("Sil")),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Image.memory(base64.decode(photo.photoBase64Str)),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        if (this.widget.data.servicePhotoList.length == 0)
          Padding(
            padding: EdgeInsets.all(15),
            child: Card(
              child: ListTile(
                title: Text("Fotoğraf Bulunamadı"),
              ),
            ),
          ),
      ],
    );
  }
}
