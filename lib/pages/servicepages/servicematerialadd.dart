import 'dart:convert';
import 'dart:developer';

import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/core/models/ProductFromInvoice.dart';
import 'package:flexserviceflutter/utils/utils.dart';

import '/core/models/ProductFromList.dart';
import '/core/models/ServiceModel.dart';
import '/core/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaterialAdd extends StatefulWidget {
  final ServiceList data;
  MaterialAdd({Key key, this.data}) : super(key: key);

  @override
  _MaterialAddState createState() => _MaterialAddState();
}

class _MaterialAddState extends State<MaterialAdd>
    with SingleTickerProviderStateMixin {
  String dropdownValue = "Listeden Ekle";
  bool fast = false;
  String searchString = "";
  Future lFuture;
  Future mFuture;
  Future rFuture;

  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lFuture = Services.getPfromList(searchString);
    mFuture = Services.getPfromPersonel(searchString);

    rFuture = Services.getPfromInvoice(
        searchString, this.widget.data.customerInfo.customerId);
    _controller = TabController(length: 3, vsync: this);
  }

  Widget listProductTile(ServiceProductList product) {
    return ListTile(
      title: Text(product.productName),
      trailing: TextButton(
        child: Text("Ekle"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Wrap(
                children: [
                  Text(
                    product.productName,
                    overflow: TextOverflow.ellipsis,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    onFieldSubmitted: (text) {
                      product.productCount = int.parse(text);
                      this.widget.data.serviceProductList.add(product);
                      LocalDB.saveService(
                              this.widget.data.serviceInfo.serviceId.toString(),
                              this.widget.data)
                          .then((value) {
                        Utils.showAuthedSnack(context,
                            product.productName + " Başarıyla Eklendi");
                        Navigator.of(context).pop();
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                      labelText: 'Adet Seçiniz',
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget listStockTile(StockList stocks) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(stocks.stockType),
            subtitle: Text(stocks.stockDate + " " + stocks.stockNo),
            trailing: Text("İrsaliye"),
          ),
          Divider(),
          for (var stock in stocks.stockActivityList)
            ListTile(
              title: Text(stock.productName),
              subtitle: Text(stock.productStrSalePrice),
              trailing: TextButton(
                child: Text("Ekle"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: Wrap(
                        children: [
                          Text(
                            stock.productName,
                            overflow: TextOverflow.ellipsis,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            onFieldSubmitted: (text) {
                              ServiceProductList product =
                                  new ServiceProductList(
                                productId: stock.productId,
                                quantity: stock.quantity,
                                productCount: int.parse(text),
                                productName: stock.productName,
                                productSalePrice: stock.productSalePrice,
                                productStrSalePrice: stock.productStrSalePrice,
                                productKdvRate: stock.productKdvRate,
                                productCode: stock.productCode,
                                hasSerialNo: stock.hasSerialNo,
                                currencyDecimalPlaces:
                                    stock.currencyDecimalPlaces,
                                productCurrencySymbol:
                                    stock.productCurrencySymbol,
                                productSaleMoneyType:
                                    stock.productSaleMoneyType,
                              );

                              this.widget.data.serviceProductList.add(product);
                              LocalDB.saveService(
                                      this
                                          .widget
                                          .data
                                          .serviceInfo
                                          .serviceId
                                          .toString(),
                                      this.widget.data)
                                  .then((value) {
                                Utils.showAuthedSnack(context,
                                    stock.productName + " Başarıyla Eklendi");
                                Navigator.of(context).pop();
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: OutlineInputBorder(),
                              labelText: 'Adet Seçiniz',
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          onTap: (index) {
            // Tab index when user select it, it start from zero
          },
          tabs: [
            Tab(icon: Icon(FontAwesomeIcons.list)),
            Tab(icon: Icon(FontAwesomeIcons.fileInvoice)),
            Tab(icon: Icon(FontAwesomeIcons.user)),
          ],
        ),
        title: Text("Yeni İşçilik & Malzeme"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              initialValue: searchString,
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Ürün Adı Giriniz',
                labelText: 'Ürün Adı *',
              ),
              onChanged: (text) {
                setState(() {
                  searchString = text;
                  lFuture = Services.getPfromList(searchString);
                  mFuture = Services.getPfromPersonel(searchString);
                  rFuture = Services.getPfromInvoice(
                      searchString, this.widget.data.customerInfo.customerId);
                });
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                Container(
                  child: FutureBuilder<ProductFromList>(
                    future: lFuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<ProductFromList> snapshot) {
                      if (snapshot.hasData && snapshot.data.data != null) {
                        return ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return listProductTile(snapshot.data.data[index]);
                            });
                      } else if (snapshot.hasError) {
                        return Column(
                          children: <Widget>[
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text('Error: ${snapshot.error}'),
                            )
                          ],
                        );
                      } else if (snapshot.hasData) {
                        return ListTile(
                          title: Text(
                            "Ürün Bulunamadı",
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: CircularProgressIndicator(),
                              width: 60,
                              height: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text('Awaiting result...'),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: FutureBuilder<ProductFromList>(
                    future: mFuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<ProductFromList> snapshot) {
                      if (snapshot.hasData && snapshot.data.data != null) {
                        return ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return listProductTile(snapshot.data.data[index]);
                            });
                      } else if (snapshot.hasError) {
                        return Column(
                          children: <Widget>[
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text('Error: ${snapshot.error}'),
                            )
                          ],
                        );
                      } else if (snapshot.hasData) {
                        return ListTile(
                          title: Text(
                            "Ürün Bulunamadı",
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: CircularProgressIndicator(),
                              width: 60,
                              height: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text('Awaiting result...'),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: FutureBuilder<ProductfromInvoice>(
                    future: rFuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<ProductfromInvoice> snapshot) {
                      if (snapshot.hasData &&
                          snapshot.data.data.stockList != null) {
                        return ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data.data.stockList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return listStockTile(
                                  snapshot.data.data.stockList[index]);
                            });
                      } else if (snapshot.hasError) {
                        return Column(
                          children: <Widget>[
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text('Error: ${snapshot.error}'),
                            )
                          ],
                        );
                      } else if (snapshot.hasData) {
                        return ListTile(
                          title: Text(
                            "Ürün Bulunamadı",
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: CircularProgressIndicator(),
                              width: 60,
                              height: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text('Awaiting result...'),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
