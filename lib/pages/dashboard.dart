import 'dart:async';
import 'dart:convert';
import 'package:flexserviceflutter/shared/AppBarButton.dart';
import 'package:flexserviceflutter/shared/Post.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/core/models/ServiceModel.dart';
import 'package:flexserviceflutter/core/services.dart';
import 'package:flexserviceflutter/pages/servicepage.dart';

import 'package:flexserviceflutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

goService(context, ServiceList data) async {
  await LocalDB.setDate(data.serviceInfo.serviceId.toString(), DateTime.now());
  await LocalDB.getUploadService(data.serviceInfo.serviceId.toString()).then(
    (value) async {
      if (value.serviceBeginDate == "" || value.serviceBeginDate.isEmpty) {
        value.serviceBeginDate =
            DateFormat("yyyyTMMTdd").format(DateTime.now());
        await LocalDB.saveUploadService(
            data.serviceInfo.serviceId.toString(), value);
      }
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

showDetails(context, ServiceList data) {
  try {
    Completer<GoogleMapController> _controller = Completer();

    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(double.parse(data.customerInfo.lat),
          double.parse(data.customerInfo.lng)),
      zoom: 14.4746,
    );
    List<Marker> markers = [];
    markers.add(
      Marker(
        markerId: MarkerId("Location"),
        draggable: false,
        position: LatLng(
          double.parse(data.customerInfo.lat),
          double.parse(data.customerInfo.lng),
        ),
      ),
    );
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Wrap(
              children: [
                ListTile(
                  title: Text("Açıklama"),
                  subtitle: Text(data.serviceInfo.serviceSubject.isNotEmpty
                      ? data.serviceInfo.serviceSubject
                      : "Açıklama Girilmedi"),
                  trailing: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      goService(context, data);
                    },
                    child: Text('Servisi Başlat'),
                  ),
                ),
                Container(
                  height: 300,
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    markers: Set.from(markers),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  } on Exception {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: Column(
              children: [
                if (data.serviceInfo.serviceSubject.isNotEmpty)
                  ListTile(
                    title: Text("Açıklama"),
                    subtitle: Text(data.serviceInfo.serviceSubject),
                    trailing: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        goService(context, data);
                      },
                      child: Text('Servisi Başlat'),
                    ),
                  ),
                if (data.serviceInfo.serviceSubject.isEmpty)
                  ListTile(
                    title: Text("Açıklama ve GPS bilgileri bulunamadı"),
                    trailing: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        goService(context, data);
                      },
                      child: Text('Servisi Başlat'),
                    ),
                  ),
                ListTile(
                  title: Text("Adres"),
                  subtitle: Text(data.customerInfo.address),
                  trailing: Icon(Icons.copy),
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: data.customerInfo.address));
                    Utils.showAuthedSnack(context, "Adres Kopyalandı");
                  },
                ),
              ],
            ),
          );
        });
  }
}

Widget serviceItem(context, ServiceList data) {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          onTap: () {
            showDetails(context, data);
          },
          isThreeLine: true,
          title: new Text(
            data.customerInfo.customerName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 17),
          ),
          subtitle: Text(data.customerInfo.address),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 8),
              child: TextButton(
                child: Text(data.serviceStateInfo.serviceStateName),
                onPressed: () {/* ... */},
              ),
            ),
            if (data.serviceInfo.serviceReadingStatus == true)
              Container(
                padding: EdgeInsets.only(left: 8),
                child: TextButton(
                  child: Icon(Icons.check),
                  onPressed: () {/* ... */},
                ),
              ),
          ],
        ),
      ],
    ),
  );
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController _mainTabBarController;
  Future<Response> getServices;
  final TrackingScrollController scrollController = TrackingScrollController();
  int loflist = 0;
  @override
  void initState() {
    super.initState();
    _mainTabBarController = new TabController(length: 2, vsync: this);
    getServices = Services.getServices().then((value) {
      setState(() {
        ServiceModel service =
            new ServiceModel.fromJson(jsonDecode(value.body));
        loflist = service.data.serviceList.length;
      });
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: SliverAppBar(
                      pinned: false,
                      brightness: Brightness.light,
                      backgroundColor: Colors.white,
                      title: Image(
                        image: AssetImage("assets/images/logo_white.png"),
                        width: 140,
                      ),
                      centerTitle: false,
                      floating: true,
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: AppBarButton(
                            icon: Icons.refresh,
                            iconSize: 25.0,
                            onPressed: () {
                              setState(() {
                                getServices = null;
                                getServices =
                                    Services.getServices().then((value) {
                                  setState(() {
                                    ServiceModel service =
                                        new ServiceModel.fromJson(
                                            jsonDecode(value.body));
                                    loflist = service.data.serviceList.length;
                                  });
                                  return value;
                                });
                              });
                              Utils.showAuthedSnack(
                                  context, "Servisler Başarıyla Yenilendi");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        controller: _mainTabBarController,
                        labelColor: Color(0xFF1777F2),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: "Servisler (" + loflist.toString() + ")",
                          ),
                          Tab(
                            text: "Yüklemeyi Bekleyen (0)",
                          ),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                controller: _mainTabBarController,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        FutureBuilder(
                          future: getServices,
                          builder: (context, AsyncSnapshot<Response> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              ServiceModel service = new ServiceModel.fromJson(
                                  jsonDecode(snapshot.data.body));
                              if (service.data.serviceList.length == 0)
                                return Card(
                                  elevation: 0.0,
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 8.0, 12.0, 0.0),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Divider(height: 20.0, thickness: 0.5),
                                        Text(
                                          'Servis Bulunamadı',
                                          style: const TextStyle(
                                            color: Color(0xFF1777F2),
                                            fontSize: 28.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: -1.2,
                                          ),
                                        ),
                                        Divider(height: 20.0, thickness: 0.5),
                                      ],
                                    ),
                                  ),
                                );

                              if (service.data.serviceList.length != 0)
                                return Flexible(
                                  child: ListView.builder(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: service.data.serviceList.length,
                                    itemBuilder: (context, index) {
                                      ServiceList data =
                                          service.data.serviceList[index];

                                      return PostScreen(
                                        username:
                                            data.customerInfo.customerName,
                                        caption:
                                            data.serviceInfo.serviceSubject,
                                        timeAgo:
                                            data.serviceDetail.appointmentDate,
                                        mapWidget: data.customerInfo.lat ==
                                                    " " ||
                                                data.customerInfo.lat.isEmpty
                                            ? false
                                            : true,
                                        lat: data.customerInfo.lat,
                                        lng: data.customerInfo.lng,
                                        data: data,
                                      );
                                    },
                                  ),
                                );
                            }
                            return Container(
                              height: MediaQuery.of(context).size.height - 200,
                              child: Center(
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.blueGrey,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.blue),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Card(
                      elevation: 0.0,
                      child: Container(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Divider(height: 20.0, thickness: 0.5),
                            Text(
                              'Servis Bulunamadı',
                              style: const TextStyle(
                                color: Color(0xFF1777F2),
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1.2,
                              ),
                            ),
                            Divider(height: 20.0, thickness: 0.5),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
