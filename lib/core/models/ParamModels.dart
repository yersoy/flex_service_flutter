import 'package:flexserviceflutter/core/models/ServiceModel.dart';

class LoginParams {
  final String UserName;
  final String Password;
  final String PushNotificationRegistrationId;
  final String PushNotificationPlatform;

  LoginParams(
      {this.UserName,
      this.Password,
      this.PushNotificationRegistrationId,
      this.PushNotificationPlatform});

  factory LoginParams.fromJson(Map<String, dynamic> json) {
    return LoginParams(
        UserName: json['UserName'],
        Password: json['Password'],
        PushNotificationRegistrationId: json['PushNotificationRegistrationId'],
        PushNotificationPlatform: json['PushNotificationPlatform']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.UserName;
    data['Password'] = this.Password;
    data['PushNotificationRegistrationId'] =
        this.PushNotificationRegistrationId;
    data['PushNotificationPlatform'] = this.PushNotificationPlatform;
    return data;
  }
}

class ServiceGlobalParams {
  String sessionId;
  int serviceId;
  int customerId;
  int personalId;
  String searchText;
  dynamic serviceStartLat;
  dynamic serviceStartLng;

  ServiceGlobalParams(
      {this.sessionId,
      this.serviceId,
      this.customerId,
      this.personalId,
      this.searchText,
      this.serviceStartLat,
      this.serviceStartLng});

  ServiceGlobalParams.fromJson(Map<String, dynamic> json) {
    sessionId = json['SessionId'];
    serviceId = json['ServiceId'];
    customerId = json['CustomerId'];
    personalId = json['PersonalId'];
    searchText = json['SearchText'];
    serviceStartLat = json['ServiceStartLat'];
    serviceStartLng = json['ServiceStartLng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SessionId'] = this.sessionId;
    if (this.serviceId != null) data['ServiceId'] = this.serviceId;
    if (this.customerId != null) data['CustomerId'] = this.customerId;
    if (this.personalId != null) data['PersonalId'] = this.personalId;
    if (this.searchText != null) data['SearchText'] = this.searchText;
    if (this.serviceStartLat != null)
      data['ServiceStartLat'] = this.serviceStartLat;
    if (this.serviceStartLng != null)
      data['ServiceStartLng'] = this.serviceStartLng;
    return data;
  }
}

class CustomerLocationModel {
  String inCustomerId;
  String stGoogleMapsLat;
  String stGoogleMapsLng;
  CustomerLocationModel(
      {this.inCustomerId, this.stGoogleMapsLat, this.stGoogleMapsLng});

  CustomerLocationModel.fromJson(Map<String, dynamic> json) {
    inCustomerId = json['InCustomerId'];
    stGoogleMapsLat = json['StGoogleMapsLat'];
    stGoogleMapsLng = json['StGoogleMapsLng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['InCustomerId'] = this.inCustomerId;
    data['StGoogleMapsLat'] = this.stGoogleMapsLat;
    data['StGoogleMapsLng'] = this.stGoogleMapsLng;

    return data;
  }
}

class ProductSearch {
  int total;
  bool success;
  String message;
  List<ProductSearchItem> data;
  int code;
  ProductSearch({this.total, this.message, this.success, this.data, this.code});
  ProductSearch.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    success = json['Success'];
    message = json['Message'];
    data = <ProductSearchItem>[];
    if (json['Data'] != null) {
      json['Data'].forEach((v) {
        data.add(new ProductSearchItem.fromJson(v));
      });
    }

    code = json['Code'];
  }
}

class ProductSearchItem {
  int id;
  String name;
  ProductSearchItem({this.id, this.name});
  ProductSearchItem.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }
}

class CustomerProductServer {
  int customerProductId;
  List<ServiceTagList> customerProductTagList;

  CustomerProductServer({this.customerProductId, this.customerProductTagList});

  CustomerProductServer.fromJson(Map<String, dynamic> json) {
    customerProductId = json['CustomerProductId'];
    if (json['CustomerProductTagList'] != null) {
      customerProductTagList = new List<ServiceTagList>();
      json['CustomerProductTagList'].forEach((v) {
        customerProductTagList.add(new ServiceTagList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerProductId'] = this.customerProductId;
    if (this.customerProductTagList != null) {
      data['CustomerProductTagList'] =
          this.customerProductTagList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerProductTagList {
  int serviceTagId;
  String serviceTagTitle;
  String serviceTagExplain;

  CustomerProductTagList(
      {this.serviceTagId, this.serviceTagTitle, this.serviceTagExplain});

  CustomerProductTagList.fromJson(Map<String, dynamic> json) {
    serviceTagId = json['ServiceTagId'];
    serviceTagTitle = json['ServiceTagTitle'];
    serviceTagExplain = json['ServiceTagExplain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceTagId'] = this.serviceTagId;
    data['ServiceTagTitle'] = this.serviceTagTitle;
    data['ServiceTagExplain'] = this.serviceTagExplain;
    return data;
  }
}

class StockParams {
  String searchText;
  int customerId;
  StockParams({this.searchText, this.customerId});
  StockParams.fromJson(Map<String, dynamic> json) {
    searchText = json["SearchText"];
    customerId = int.parse(json["CustomerId"]);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SearchText'] = this.searchText;
    data['CustomerId'] = this.customerId;

    return data;
  }
}
