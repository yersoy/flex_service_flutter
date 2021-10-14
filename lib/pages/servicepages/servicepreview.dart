import '/core/models/ServiceModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServicePreview extends StatefulWidget {
  final ServiceList data;
  ServicePreview({Key key, this.data}) : super(key: key);

  @override
  _ServicePreviewState createState() => _ServicePreviewState();
}

class _ServicePreviewState extends State<ServicePreview> {
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
              "Adres",
              style: const TextStyle(
                color: Color(0xFF1777F2),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            subtitle: Text(this.widget.data.customerInfo.address),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        DataTable(
          dataRowHeight: 100,
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                'Servis No',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                this.widget.data.serviceDetail.serviceNo.toString(),
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Randevu Tarihi')),
                DataCell(Text(this.widget.data.serviceDetail.appointmentDate)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Servis Saati')),
                DataCell(Text(
                    DateFormat("dd.MM.yyyy HH:mm").format(DateTime.now()))),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Servis Tipi")),
                DataCell(Text(this.widget.data.serviceDetail.serviceType)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Servis Konusu")),
                DataCell(Text(this.widget.data.serviceInfo.serviceSubject)),
              ],
            ),
          ],
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: ListTile(
            title: Text(
              "Servis Verilen Cihazlar",
              style: const TextStyle(
                color: Color(0xFF1777F2),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
        DataTable(
          dataRowHeight: 100,
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                'Ürün Adı',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                " İşlem",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: <DataRow>[
            for (var product in this.widget.data.serviceRelevantProductList)
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(product.productName)),
                  DataCell(Text(product
                      .serviceOperationTypeList[0].serviceOperationTypeName)),
                ],
              ),
          ],
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: ListTile(
            title: Text(
              "İşçilik ve Malzemeler",
              style: const TextStyle(
                color: Color(0xFF1777F2),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: this.widget.data.serviceProductList.length,
            itemBuilder: (BuildContext context, int index) {
              ServiceProductList service =
                  this.widget.data.serviceProductList[index];
              return ListTile(
                title: Text(service.productName),
                subtitle: RichText(
                  text: TextSpan(
                    text: service.productCount.toString(),
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: " Adet ",
                      ),
                    ],
                  ),
                ),
                trailing: Text(service.productStrSalePrice),
              );
            }),
      ],
    );
  }
}
