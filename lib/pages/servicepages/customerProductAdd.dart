import 'package:date_time_picker/date_time_picker.dart';
import 'package:flexserviceflutter/core/localdb.dart';
import 'package:flexserviceflutter/core/models/ProductFormObjects.dart';

import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '/core/models/ParamModels.dart';
import 'package:flexserviceflutter/core/services.dart';

import '/core/models/ServiceModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomerProductAdd extends StatefulWidget {
  final ServiceList data;
  CustomerProductAdd({Key key, this.data}) : super(key: key);

  @override
  _CustomerProductAddState createState() => _CustomerProductAddState();
}

class _CustomerProductAddState extends State<CustomerProductAdd> {
  final TextEditingController _typeAheadController = TextEditingController();
  ProductFormObjects productobj;
  int productId;
  int recorderID;
  String name;
  ObjectComboboxOrRadioList dvalue;
  Future<ProductFormObjects> ftr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ftr = Services.formCustomerProduct().then((value) => productobj = value);
    LocalDB.getUser()
        .then((value) => recorderID = value.data.userAccountInfo.personalId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Müşteri Ürünü"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Services.saveFormCustomerProduct(productobj, this.widget.data,
                  productId, recorderID, context, name)
              .then((value) async {
            await LocalDB.saveService(
                this.widget.data.serviceInfo.serviceId.toString(), value);
          });
        },
        child: const Icon(FontAwesomeIcons.save),
      ),
      body: FutureBuilder<ProductFormObjects>(
        future: ftr,
        builder:
            (BuildContext context, AsyncSnapshot<ProductFormObjects> snapshot) {
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
                return ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TypeAheadField<ProductSearchItem>(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: this._typeAheadController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.new_label),
                              hintText: 'Ürün',
                              labelText: 'Ürün Seçiniz *',
                            )),
                        suggestionsCallback: (pattern) async {
                          return await Services.searchInServices(pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion.name),
                          );
                        },
                        transitionBuilder:
                            (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (suggestion) {
                          this._typeAheadController.text =
                              suggestion.name.toString();
                          productId = suggestion.id;
                          name = suggestion.name;
                        },
                      ),
                    ),
                    for (var formobj in snapshot.data.data)
                      if (formobj.stObjectType == 'text' ||
                          formobj.stObjectType == 'memo')
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            maxLines: null,
                            decoration: InputDecoration(
                              icon: Icon(
                                  formobj.stColumnName == 'StSerialNumber'
                                      ? FontAwesomeIcons.hashtag
                                      : FontAwesomeIcons.comment),
                              hintText: formobj.stLabelText,
                              labelText: formobj.stLabelText,
                            ),
                            onChanged: (String value) {
                              formobj.stTextValue = value;
                            },
                          ),
                        ),
                    for (var formobj in snapshot.data.data)
                      if (formobj.stObjectType == 'datetime')
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: DateTimePicker(
                            dateMask: 'dd.MM.yyyy',
                            decoration: InputDecoration(
                              icon: Icon(Icons.date_range),
                              hintText: formobj.stLabelText,
                              labelText: formobj.stLabelText,
                            ),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            dateLabelText: 'Date',
                            onChanged: (val) {
                              DateTime time = DateTime.parse(val);
                              String formattedDate =
                                  DateFormat("yyyyTMMTdd").format(time);
                              formobj.dtDateValue = formattedDate;
                            },
                          ),
                        ),
                    for (var formobj in snapshot.data.data)
                      if (formobj.stObjectType == 'number')
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            maxLines: null,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              icon: Icon(FontAwesomeIcons.hashtag),
                              hintText: formobj.stLabelText,
                              labelText: formobj.stLabelText,
                            ),
                            onChanged: (String value) {
                              formobj.stTextValue = value;
                            },
                          ),
                        ),
                    for (var formobj in snapshot.data.data)
                      if (formobj.stObjectType == 'combobox')
                        ListTile(
                          title: Text(
                            formobj.stLabelText,
                            textAlign: TextAlign.left,
                          ),
                          subtitle: DropdownButton<ObjectComboboxOrRadioList>(
                            value: dvalue,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (ObjectComboboxOrRadioList newValue) {
                              setState(() {
                                dvalue = newValue;
                              });
                              formobj.stTextValue = newValue.id.toString();
                            },
                            items: formobj.objectComboboxOrRadioList.map<
                                    DropdownMenuItem<
                                        ObjectComboboxOrRadioList>>(
                                (ObjectComboboxOrRadioList value) {
                              return DropdownMenuItem<
                                  ObjectComboboxOrRadioList>(
                                value: value,
                                child: Text(value.name),
                              );
                            }).toList(),
                          ),
                        ),
                  ],
                  shrinkWrap: true,
                );
          }
        },
      ),
    );
  }
}
