import 'dart:async';

import 'package:flexserviceflutter/core/models/ServiceModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/core/models/ParamModels.dart';
import 'package:flexserviceflutter/core/services.dart';
import 'package:flexserviceflutter/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceDetailPage extends StatefulWidget {
  final ServiceList data;
  ServiceDetailPage({Key key, this.data}) : super(key: key);

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  CameraPosition _kGooglePlex;
  GoogleMapController gmp;
  Completer<GoogleMapController> _mcontroller = Completer();
  List<Marker> markers = [];
  bool haslat = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    gmp.dispose();
  }

  setMap() async {
    if (this.widget.data.customerInfo.lat != "") {
      _kGooglePlex = CameraPosition(
        target: LatLng(double.parse(this.widget.data.customerInfo.lat),
            double.parse(this.widget.data.customerInfo.lng)),
        zoom: 14.4746,
      );

      markers.add(
        Marker(
            markerId: MarkerId("Location"),
            draggable: false,
            position: LatLng(double.parse(this.widget.data.customerInfo.lat),
                double.parse(this.widget.data.customerInfo.lng))),
      );
      haslat = true;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setMap();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: ListTile(
            title: Text(
              "Konu",
              style: const TextStyle(
                color: Color(0xFF1777F2),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            subtitle: Text(this.widget.data.serviceInfo.serviceSubject),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: ListTile(
            title: Text(
              "Adres",
              style: const TextStyle(
                color: Color(0xFF1777F2),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            subtitle: Text(this.widget.data.customerInfo.address),
            trailing: TextButton(
              child: Icon(Icons.send),
              onPressed: () {},
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: ListTile(
            subtitle: this.widget.data.customerInfo.customerPhone != null
                ? Text(
                    this.widget.data.customerInfo.customerPhone,
                  )
                : null,
            title: Text(
              "Telefon Numarası",
              style: const TextStyle(
                color: Color(0xFF1777F2),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            trailing: TextButton(
              child: Icon(Icons.phone),
              onPressed: () {},
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                'Servis Numarası',
              ),
            ),
            DataColumn(
              label: Text(
                this.widget.data.serviceDetail.serviceNo,
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Servis Saati')),
                DataCell(Text(this.widget.data.serviceInfo.serviceDate)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Randevu Tarihi')),
                DataCell(Text(
                    this.widget.data.serviceDetail.appointmentDate != null
                        ? this.widget.data.serviceDetail.appointmentDate
                        : "Girilmedi")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Servis Tipi')),
                DataCell(Text(this.widget.data.serviceDetail.serviceType)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Teknisyen')),
                DataCell(
                  Text(this.widget.data.serviceDetail.stTechnicianName),
                ),
              ],
            ),
            if (this.widget.data.serviceDetail.serviceExtraFields != null &&
                this.widget.data.serviceDetail.serviceExtraFields.length > 0)
              for (var extrafields
                  in this.widget.data.serviceDetail.serviceExtraFields)
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(extrafields.labelText)),
                    DataCell(
                      Text(extrafields.value),
                    ),
                  ],
                ),
          ],
        ),
        ListTile(
          title: Text("Servis Konumu"),
          trailing: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Services.updateCustomerLocation(
                      this.widget.data.customerInfo.customerId, context)
                  .then((value) async {
                GoogleMapController controller = await _mcontroller.future;
                controller
                    .moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(value.latitude, value.longitude),
                  zoom: 14.4746,
                )));
                setState(() {
                  this.widget.data.customerInfo.lat = value.latitude.toString();
                  this.widget.data.customerInfo.lng =
                      value.longitude.toString();
                  haslat = true;
                  markers.clear();
                  markers.add(
                    Marker(
                      markerId: MarkerId("Location"),
                      draggable: false,
                      position: LatLng(value.latitude, value.longitude),
                    ),
                  );
                });
              });
              LocalDB.saveService(
                  this.widget.data.serviceDetail.serviceNo, this.widget.data);
              setMap();
            },
            child: Text('Güncelle'),
          ),
        ),
        if (haslat == true)
          Container(
            height: 300,
            child: GoogleMap(
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                new Factory<OneSequenceGestureRecognizer>(
                  () => new EagerGestureRecognizer(),
                ),
              ].toSet(),
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              tiltGesturesEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              markers: Set.from(markers),
              onMapCreated: (GoogleMapController controller) {
                _mcontroller.complete(controller);
                setState(() {
                  gmp = controller;
                });
              },
            ),
          ),
        if (haslat == false)
          Center(
            child: Text("Tam Konum Bulunamadı"),
          ),
      ],
    );
  }
}
