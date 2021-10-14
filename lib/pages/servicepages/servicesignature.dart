import 'dart:convert';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/core/models/ServiceModel.dart';
import 'package:flexserviceflutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class SignPage extends StatefulWidget {
  ServiceList data;
  SignPage({Key key, this.data}) : super(key: key);
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  List<Path> _paths = <Path>[];
  ByteData imgBytes;
  String _msg = '';
  bool _loading = false;

  Future<ui.Image> get rendered {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    Signature painter = Signature(paths: _paths);
    var size = context.size;
    painter.paint(canvas, size);
    return recorder.endRecording().toImage(
          size.width.floor(),
          size.height.floor(),
        );
  }

  @override
  void initState() {
    super.initState();
  }

  _showImage() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonTheme(
                  child: ElevatedButton(
                    onPressed: () async {
                      await LocalDB.getUploadService(
                              this.widget.data.serviceInfo.serviceId.toString())
                          .then((value) async {
                        value.signatureImageBase64Str =
                            base64.encode(imgBytes.buffer.asUint8List());
                        await LocalDB.saveUploadService(
                                this
                                    .widget
                                    .data
                                    .serviceInfo
                                    .serviceId
                                    .toString(),
                                value)
                            .then((value) {
                          Utils.showAuthedSnack(context, "İmza Kaydedildi");
                          Navigator.of(context).pop();
                        });
                      });
                    },
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 3,
                child: imgBytes != null
                    ? Image.memory(
                        new Uint8List.view(imgBytes.buffer),
                      )
                    : new Container(
                        height: 0,
                      ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: Text('Lütfen İmzalayın'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => _paths.clear(),
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.save),
              color: Colors.white,
              onPressed: () async {
                final img = await rendered;
                final pngBytes =
                    await img.toByteData(format: ui.ImageByteFormat.png);

                setState(() {
                  imgBytes = pngBytes;
                });

                _showImage();
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          height: 300,
          child: DottedBorder(
            color: Colors.black,
            strokeWidth: 1,
            child: Container(
              child: GestureDetector(
                onPanStart: (DragStartDetails details) {
                  setState(() {
                    RenderBox box = context.findRenderObject();
                    Offset _localPosition =
                        box.globalToLocal(details.globalPosition);
                    _localPosition = _localPosition.translate(
                        0.0, -(AppBar().preferredSize.height + 20));
                    Path path = new Path();
                    path.moveTo(_localPosition.dx, _localPosition.dy);
                    _paths = List.from(_paths)..add(new Path.from(path));
                  });
                },
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    RenderBox box = context.findRenderObject();
                    Offset _localPosition =
                        box.globalToLocal(details.globalPosition);
                    _localPosition = _localPosition.translate(
                        0.0, -(AppBar().preferredSize.height + 20));
                    Path path = _paths.last;
                    path.lineTo(_localPosition.dx, _localPosition.dy);
                  });
                },
                child: CustomPaint(
                  painter: Signature(paths: _paths),
                  size: Size.infinite,
                ),
              ),
            ),
          ),
        ));
  }
}

class Signature extends CustomPainter {
  List<Path> paths = <Path>[];

  Signature({this.paths});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;

    for (Path p in paths) {
      canvas.drawPath(p, paint);
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => true;
}
