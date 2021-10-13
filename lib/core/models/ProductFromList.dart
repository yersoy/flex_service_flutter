import 'dart:ffi';

import '/core/models/ServiceModel.dart';

class ProductFromList {
  int total;
  bool success;
  String message;
  List<ServiceProductList> data;
  int code;

  ProductFromList(
      {this.total, this.success, this.message, this.data, this.code});

  ProductFromList.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    success = json['Success'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <ServiceProductList>[];
      json['Data'].forEach((v) {
        data.add(new ServiceProductList.fromJson(v));
      });
    }
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['Success'] = this.success;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['Code'] = this.code;
    return data;
  }
}
