import 'dart:async';

import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/core/models/ServiceModel.dart';
import 'package:flexserviceflutter/pages/servicepage.dart';
import 'package:flexserviceflutter/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(PostScreen());
}

class PostScreen extends StatelessWidget {
  final ServiceList data;
  String userImage,
      username,
      caption,
      timeAgo,
      likes,
      comments,
      shares,
      lat,
      lng,
      profileImage;
  bool mapWidget;
  PostScreen({
    Key key,
    this.userImage,
    this.username,
    this.caption,
    this.timeAgo,
    this.mapWidget,
    this.lat,
    this.lng,
    this.likes,
    this.comments,
    this.shares,
    this.profileImage,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return PostScreenPage(
      data: data,
      userImage: this.userImage,
      username: this.username,
      lat: this.lat,
      lng: this.lng,
      caption: this.caption,
      timeAgo: this.timeAgo,
      mapWidget: this.mapWidget,
      likes: this.likes,
      comments: this.comments,
      shares: this.shares,
      profileImage: this.profileImage,
    );
  }
}

class PostScreenPage extends StatefulWidget {
  final ServiceList data;
  bool mapWidget;
  String userImage,
      username,
      caption,
      timeAgo,
      imageUrl,
      lat,
      lng,
      likes,
      comments,
      shares,
      profileImage;
  PostScreenPage({
    Key key,
    this.userImage,
    this.username,
    this.lat,
    this.lng,
    this.caption,
    this.timeAgo,
    this.mapWidget,
    this.likes,
    this.comments,
    this.shares,
    this.profileImage,
    @required this.data,
  });

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreenPage> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex;
  List<Marker> markers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.mapWidget)
      _kGooglePlex = CameraPosition(
        target: LatLng(double.parse(widget.lat), double.parse(widget.lng)),
        zoom: 14.4746,
      );
    if (widget.mapWidget)
      markers.add(
        Marker(
          markerId: MarkerId("Location"),
          draggable: false,
          position: LatLng(
            double.parse(widget.lat),
            double.parse(widget.lng),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 0.0,
      ),
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(
                    profileImage: widget.userImage,
                    username: widget.username,
                    timeAgo: widget.timeAgo,
                    data: this.widget.data,
                  ),
                  const SizedBox(height: 4.0),
                  Text(widget.caption),
                  widget.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 6.0),
                ],
              ),
            ),
            widget.mapWidget == true
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 300,
                      child: GoogleMap(
                        scrollGesturesEnabled: true,
                        zoomGesturesEnabled: true,
                        tiltGesturesEnabled: true,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        gestureRecognizers:
                            <Factory<OneSequenceGestureRecognizer>>[
                          new Factory<OneSequenceGestureRecognizer>(
                            () => new EagerGestureRecognizer(),
                          ),
                        ].toSet(),
                        mapType: MapType.hybrid,
                        initialCameraPosition: _kGooglePlex,
                        markers: Set.from(markers),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(
                likes: widget.likes,
                comments: widget.comments,
                share: widget.shares,
                data: this.widget.data,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final String profileImage;
  final String username;
  final String timeAgo;
  final ServiceList data;
  const _PostHeader({
    Key key,
    @required this.profileImage,
    @required this.username,
    @required this.timeAgo,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  if (data.serviceInfo.serviceReadingStatus)
                    Icon(
                      Icons.check,
                      color: Color(0xFF1777F2),
                      size: 12.0,
                    )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final String likes, comments, share;
  final ServiceList data;

  const _PostStats({
    Key key,
    @required this.likes,
    @required this.comments,
    @required this.share,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool show = data.customerInfo.lat == " " || data.customerInfo.lat.isEmpty
        ? false
        : true;
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                Icons.play_arrow,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Servise Başla',
              onTap: () {
                start(context, data);
              },
            ),
            if (show)
              _PostButton(
                  icon: Icon(
                    Icons.directions,
                    color: Colors.grey[600],
                    size: 20.0,
                  ),
                  label: 'Haritalarda Aç',
                  onTap: () async {
                    print("object1");
                    if (data.customerInfo.lat != " " &&
                        data.customerInfo.lat.isNotEmpty) {
                      String googleUrl =
                          'https://www.google.com/maps/search/?api=1&query=' +
                              data.customerInfo.lat +
                              ',' +
                              data.customerInfo.lng;

                      await canLaunch(googleUrl)
                          ? await launch(googleUrl)
                          : throw 'Could not launch $googleUrl';
                    }
                  }),
            if (!show)
              _PostButton(
                  icon: Icon(
                    Icons.directions,
                    color: Colors.grey[600],
                    size: 20.0,
                  ),
                  label: 'Haritalarda Aç',
                  onTap: () async {
                    print("object2");
                    Clipboard.setData(
                        ClipboardData(text: data.customerInfo.address));
                    Utils.showAuthedSnack(context,
                        "Tam Konum Bulunamadığı için Adres Kopyalandı");
                  }),
          ],
        ),
      ],
    );
  }
}

void start(context, ServiceList data) async {
  await LocalDB.setDate(data.serviceInfo.serviceId.toString(), DateTime.now());
  await LocalDB.getUploadService(data.serviceInfo.serviceId.toString()).then(
    (value) async {
      value.serviceBeginDate = DateFormat("yyyyTMMTdd").format(DateTime.now());
      await LocalDB.saveUploadService(
          data.serviceInfo.serviceId.toString(), value);
    },
  );
  Navigator.of(context, rootNavigator: true).push(
    MaterialPageRoute(
      builder: (context) => ServicePage(
        data: data,
      ),
    ),
  );
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
