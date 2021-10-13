import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GmapContainer extends StatefulWidget {
  final LatLng data;
  GmapContainer({Key key, this.data}) : super(key: key);

  @override
  GmapContainerState createState() => GmapContainerState();
}

class GmapContainerState extends State<GmapContainer> {
  CameraPosition _kGooglePlex;
  GoogleMapController gmp;
  Completer<GoogleMapController> _mcontroller = Completer();
  List<Marker> markers = [];
  setMap() async {
    _kGooglePlex = CameraPosition(
      target: LatLng(this.widget.data.latitude, this.widget.data.longitude),
      zoom: 14.4746,
    );

    markers.add(
      Marker(
        markerId: MarkerId("Location"),
        draggable: false,
        position: LatLng(this.widget.data.latitude, this.widget.data.longitude),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setMap();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
