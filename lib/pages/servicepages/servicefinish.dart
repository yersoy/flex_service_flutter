import 'package:flexserviceflutter/core/models/ServiceModel.dart';
import 'package:flutter/material.dart';

import 'servicesignature.dart';

class ServiceFinish extends StatefulWidget {
  ServiceList data;
  ServiceFinish({Key key, this.data}) : super(key: key);

  @override
  _ServiceFinishState createState() => _ServiceFinishState();
}

class _ServiceFinishState extends State<ServiceFinish> {
  @override
  Widget build(BuildContext context) {
    return SignPage(data: this.widget.data);
  }
}
