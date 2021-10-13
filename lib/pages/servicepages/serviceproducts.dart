import '/core/models/ServiceModel.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ServiceProducts extends StatefulWidget {
  final ServiceList data;
  ServiceProducts({Key key, this.data}) : super(key: key);

  @override
  _ServiceProductsState createState() => _ServiceProductsState();
}

class _ServiceProductsState extends State<ServiceProducts> {
  String dropdownValue = "One";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget ProductCard(index) {
    ServiceRelevantProductList myproduct =
        this.widget.data.serviceRelevantProductList[index];
    return Card(
        child: Column(
      children: [
        ListTile(
          title: Text(
            myproduct.productName,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {},
            child: Text('Düzenle'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 0, right: 10),
                  title: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey[200], width: 1.0)),
                    ),
                    child: myproduct.serviceTagList != null
                        ? DropdownButton<int>(
                            hint: Text("Arıza Kodu"),
                            underline: SizedBox(),
                            value: myproduct.serviceTagId,
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down),
                            onChanged: (int newValue) {
                              setState(() {
                                myproduct.serviceTagId = newValue;
                              });
                            },
                            items: myproduct.serviceTagList
                                .map<DropdownMenuItem<int>>(
                                    (ServiceTagList value) {
                              return DropdownMenuItem<int>(
                                value: value.serviceTagId,
                                child: Text(value.serviceTagTitle),
                              );
                            }).toList(),
                          )
                        : Container(),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Container(
                    child: MultiSelectDialogField<ServiceOperationTypeList>(
                      initialValue: myproduct.serviceOperationTypeIds != null
                          ? myproduct.serviceOperationTypeList
                              .where((element) => myproduct
                                  .serviceOperationTypeIds
                                  .split('|')
                                  .contains(element.serviceOperationTypeId
                                      .toString()))
                              .toList()
                          : null,
                      buttonText: Text("İşlem Tipi"),
                      buttonIcon: Icon(Icons.arrow_drop_down),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey[200], width: 1.0)),
                      ),
                      items: myproduct.serviceOperationTypeList
                          .map((e) =>
                              MultiSelectItem(e, e.serviceOperationTypeName))
                          .toList(),
                      listType: MultiSelectListType.LIST,
                      chipDisplay: MultiSelectChipDisplay.none(),
                      onConfirm: (values) {
                        List<dynamic> data = <dynamic>[];
                        values.forEach((element) {
                          data.add(element.serviceOperationTypeId);
                        });
                        myproduct.serviceOperationTypeIds = data.join("|");
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: TextFormField(
            maxLines: null,
            initialValue: myproduct.explain,
            onChanged: (string) {
              myproduct.explain = string;
            },
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: "Açıklama Giriniz",
            ),
          ),
        )
      ],
    ));
  }

  Widget CustomerProductCard(index) {
    CustomerDeviceList myproduct =
        this.widget.data.customerInfo.customerDeviceList[index];
    bool added = false;
    return Card(
        color: added == true ? Colors.blueGrey[100] : Colors.white,
        child: Column(
          children: [
            ListTile(
              title: Text(
                myproduct.productName,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    added = true;
                    this
                        .widget
                        .data
                        .serviceRelevantProductList
                        .add(new ServiceRelevantProductList(
                          customerProductId: myproduct.customerProductId,
                          productId: myproduct.productId,
                          productState: myproduct.customerProductState,
                          serialNumber: myproduct.customerProductSerialNumber,
                          productName: myproduct.productName,
                          productCode: myproduct.productCode,
                          serviceTagList: myproduct.serviceTagList,
                          serviceOperationTypeList:
                              myproduct.serviceOperationTypeList,
                        ));
                  });
                },
                child: Text('Ekle'),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text("Servis Verilecek Cihazlar"),
        ),
        if (this.widget.data.serviceRelevantProductList.length == 0)
          Padding(
            padding: EdgeInsets.all(15),
            child: Card(
              child: ListTile(
                title: Text("Ürün Bulunamadı"),
              ),
            ),
          ),
        for (var i = 0;
            i < this.widget.data.serviceRelevantProductList.length;
            i++)
          ProductCard(i),
        ListTile(
          title: Text("Müşterinin Diğer Cihazları"),
        ),
        if (this.widget.data.customerInfo.customerDeviceList.length == 0)
          Padding(
            padding: EdgeInsets.all(15),
            child: Card(
              child: ListTile(
                title: Text("Müşteri Cihazı Bulunamadı"),
              ),
            ),
          ),
        if (this.widget.data.customerInfo.customerDeviceList.length > 0)
          for (var i = 0;
              i < this.widget.data.customerInfo.customerDeviceList.length;
              i++)
            CustomerProductCard(i),
      ],
    );
  }
}
