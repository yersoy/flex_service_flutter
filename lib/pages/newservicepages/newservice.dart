import 'package:date_time_picker/date_time_picker.dart';
import 'package:flexserviceflutter/core/models/CustomerListModel.dart';
import 'package:flexserviceflutter/core/models/NewServiceModel.dart';
import 'package:flexserviceflutter/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:flexserviceflutter/core/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewService extends StatefulWidget {
  NewService({Key key}) : super(key: key);

  @override
  _NewServiceState createState() => _NewServiceState();
}

class _NewServiceState extends State<NewService> {
  final TextEditingController _typeAheadController = TextEditingController();
  int customerid;
  MObjectFormDataContainer forms;
  String relevantname;
  bool loading = false;
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
      body: Container(
        padding: EdgeInsets.all(15),
        child: loading == false
            ? Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Yeni Servis Oluştur",
                    style: const TextStyle(
                      color: Color(0xFF1777F2),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TypeAheadFormField<CustomerList>(
                    textFieldConfiguration: TextFieldConfiguration(
                        controller: this._typeAheadController,
                        decoration: const InputDecoration(
                          icon: Icon(FontAwesomeIcons.building),
                          hintText: 'Müşteri',
                          labelText: 'Müşteri Seçiniz *',
                        )),
                    suggestionsCallback: (pattern) async {
                      return await Services.searchInCustomer(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion.customerName),
                      );
                    },
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    onSuggestionSelected: (suggestion) {
                      this._typeAheadController.text =
                          suggestion.customerName.toString();
                      customerid = suggestion.customerId;
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.user),
                        labelText: "Firma İlgilisi",
                      ),
                      onChanged: (String value) {
                        relevantname = value;
                      },
                    ),
                  ),
                  FutureBuilder<MObjectFormDataContainer>(
                    future: Services.getCustomerForm(),
                    builder: (BuildContext context,
                        AsyncSnapshot<MObjectFormDataContainer> snapshot) {
                      MObjectFormDataContainer form = snapshot.data;
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: form.total,
                            itemBuilder: (BuildContext context, int index) {
                              if (form.data[index].stObjectType == "text") {
                                return Container(
                                  padding: EdgeInsets.only(top: 15),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.text_fields),
                                      labelText: form.data[index].stLabelText,
                                    ),
                                    onChanged: (String value) {
                                      form.data[index].stTextValue = value;
                                      forms = form;
                                    },
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        loading = true;
                      });
                      Services.createNewService(
                              context, forms.data, customerid, relevantname)
                          .then((value) {
                        Utils.showAuthedSnack(
                            context, "Servis Başarıyla Eklendi");
                        setState(() {
                          loading = false;
                        });
                      });
                    },
                    child: Text("Yeni Servis Oluştur"),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
