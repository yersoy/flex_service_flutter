import 'dart:convert';
import 'dart:typed_data';

import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/shared/Stories.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

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
        Container(
          height: 270,
          child: Card(
            elevation: 0,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    int lenght = this.widget.data.servicePhotoList.length >= 0
                        ? this.widget.data.servicePhotoList.length
                        : 0;

                    await image.readAsBytes().then((value) async {
                      if (value.isNotEmpty) {
                        Uint8List idata = value;
                        setState(() {
                          this.widget.data.servicePhotoList.add(
                                Photo(
                                    photoID: lenght,
                                    photoBase64Str: base64.encode(idata),
                                    photoExtension: ".jpg",
                                    photoFilePath: ""),
                              );
                        });

                        await LocalDB.saveService(
                            this.widget.data.serviceInfo.serviceId.toString(),
                            this.widget.data);
                      }
                    });
                  },
                  child: StoriesScreen(
                    userName: "Yeni Resim Ekle",
                    first: true,
                  ),
                )
              ],
            ),
          ),
        ),
        for (var photo in this.widget.data.servicePhotoList)
          Card(
            child: Column(
              children: [
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
      ],
    );
  }
}
