import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/core/models/ServiceDefaults.dart';

import '/core/models/ServiceModel.dart';
import 'package:flutter/material.dart';

class ServiceStatus extends StatefulWidget {
  final ServiceList data;
  ServiceStatus({Key key, this.data}) : super(key: key);

  @override
  _ServiceStatusState createState() => _ServiceStatusState();
}

class _ServiceStatusState extends State<ServiceStatus> {
  ServiceStateList dropdownValue = ServiceStateList();
  List<ServiceStateList> list = <ServiceStateList>[];
  TextEditingController controller = TextEditingController();
  Future initDefaults() async {
    LocalDB.getDefaults().then((value) {
      list = value.data.serviceStateList;
      dropdownValue = value.data.serviceStateList[0];
    });
  }

  @override
  void initState() {
    super.initState();
    initDefaults();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text("Servis Açıklaması"),
        ),
        Divider(),
        ListTile(
          subtitle: TextField(
            textInputAction: TextInputAction.done,
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
            controller: controller,
            onChanged: (text) async {
              await LocalDB.getUploadService(
                      this.widget.data.serviceInfo.serviceId.toString())
                  .then((value) async {
                value.explainText = text;
                LocalDB.saveUploadService(
                    this.widget.data.serviceInfo.serviceId.toString(), value);
                print(value.explainText);
              });
            },
            maxLines: 8,
            decoration: InputDecoration.collapsed(hintText: "Açıklama"),
          ),
        ),
        Divider(),
        ListTile(
          title: Text("Servis Durumu"),
        ),
        ListTile(
          subtitle: DropdownButton<ServiceStateList>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            isExpanded: true,
            style: TextStyle(color: Colors.blue),
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            onChanged: (ServiceStateList newValue) async {
              setState(() {
                dropdownValue = newValue;
              });
              await LocalDB.getUploadService(
                      this.widget.data.serviceInfo.serviceId.toString())
                  .then((value) async {
                value.explainText = controller.text;
                value.serviceStateId = newValue.serviceStateId;
                LocalDB.saveUploadService(
                    this.widget.data.serviceInfo.serviceId.toString(), value);
                print(value.explainText);
                print(value.serviceStateId);
              });
            },
            items: list.map<DropdownMenuItem<ServiceStateList>>(
                (ServiceStateList value) {
              return DropdownMenuItem<ServiceStateList>(
                value: value,
                child: Text(value.serviceStateName),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
