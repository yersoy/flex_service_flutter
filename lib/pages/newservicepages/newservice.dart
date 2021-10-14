import 'package:flexserviceflutter/core/models/CustomerListModel.dart';
import 'package:flexserviceflutter/core/models/ParamModels.dart';
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
        child: ListView(
          children: [
            Text(
              "Yeni Servis Oluştur",
              style: const TextStyle(
                color: Color(0xFF1777F2),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
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
              validator: (value) {
                if (value.isEmpty) return 'Please select a city';
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (suggestion) {
                this._typeAheadController.text =
                    suggestion.customerName.toString();
              },
            ),
          ],
        ),
      ),
    );
  }
}
