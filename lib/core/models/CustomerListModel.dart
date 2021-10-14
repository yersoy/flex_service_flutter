class CustomerListModel {
  int total;
  bool success;
  String message;
  Data data;
  int code;

  CustomerListModel(
      {this.total, this.success, this.message, this.data, this.code});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    success = json['Success'];
    message = json['Message'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total'] = this.total;
    data['Success'] = this.success;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    data['Code'] = this.code;
    return data;
  }
}

class Data {
  List<CustomerList> customerList;

  Data({this.customerList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['CustomerList'] != null) {
      customerList = new List<CustomerList>();
      json['CustomerList'].forEach((v) {
        customerList.add(new CustomerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerList != null) {
      data['CustomerList'] = this.customerList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerList {
  int customerId;
  String tel1;
  String cityName;
  String customerName;
  String county;

  CustomerList(
      {this.customerId,
      this.tel1,
      this.cityName,
      this.customerName,
      this.county});

  CustomerList.fromJson(Map<String, dynamic> json) {
    customerId = json['CustomerId'];
    tel1 = json['Tel1'];
    cityName = json['CityName'];
    customerName = json['CustomerName'];
    county = json['County'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerId'] = this.customerId;
    data['Tel1'] = this.tel1;
    data['CityName'] = this.cityName;
    data['CustomerName'] = this.customerName;
    data['County'] = this.county;
    return data;
  }
}
