import 'package:cached_network_image/cached_network_image.dart';
import 'package:flexserviceflutter/core/constants.dart';
import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/core/models/UserState.dart';
import 'package:flexserviceflutter/core/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserState extends StatefulWidget {
  UserState({Key key}) : super(key: key);

  @override
  _UserStateState createState() => _UserStateState();
}

class _UserStateState extends State<UserState> {
  String url;
  initServer() async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    setState(() {
      url = ssl == true
          ? Uri.https(server, "").toString()
          : Uri.http(server, "").toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Color(0xFF1777F2)),
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage("assets/images/logo_white.png"),
          width: 140,
        ),
        centerTitle: false,
      ),
      body: FutureBuilder<UserStateModel>(
        future: Services.getUserStates(), // async work
        builder:
            (BuildContext context, AsyncSnapshot<UserStateModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Container(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blueGrey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              );
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(top: 5, left: 25),
                      leading: FadeInImage.assetNetwork(
                        imageErrorBuilder: (BuildContext context,
                            Object exception, StackTrace stackTrace) {
                          return Image.asset("assets/images/personel.png");
                        },
                        placeholder: "assets/images/personel.png",
                        image: snapshot.data.data.currentPersonalImageUrl,
                      ),
                      title: Text("Durumum"),
                      subtitle: Text("Düzenlemek için tıkla"),
                    ),
                    ListTile(
                      title: Text("Ekip Durumu"),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data.data.userStateList.length,
                        itemBuilder: (BuildContext context, int index) {
                          UserStateList data =
                              snapshot.data.data.userStateList[index];
                          return ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: url + data.personalImageUrl,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const SizedBox(
                                child: Icon(Icons.error),
                                width: 58,
                              ),
                            ),
                            title: Text(data.personalName),
                            subtitle: Text(data.stateTypeName),
                          );
                        },
                      ),
                    ),
                  ],
                );
          }
        },
      ),
    );
  }
}
