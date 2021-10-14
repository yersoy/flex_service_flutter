import 'dart:async';

import 'package:flexserviceflutter/core/models/AccountModel.dart';
import 'package:flexserviceflutter/core/models/CustomerListModel.dart';
import 'package:flexserviceflutter/core/models/ProductFromInvoice.dart';
import 'package:flexserviceflutter/core/models/ProductFromList.dart';
import 'package:flexserviceflutter/core/models/ServiceDefaults.dart';
import 'package:flexserviceflutter/core/models/UploadService.dart';
import 'package:flexserviceflutter/core/models/UserState.dart';
import 'package:flexserviceflutter/pages/userstates.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:geolocator/geolocator.dart';

import '/core/localdb.dart';
import '/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'constants.dart';
import 'models/ParamModels.dart';
import 'models/ProductFormObjects.dart';
import 'models/ServiceModel.dart';

class Services {
  static Future<Response> getServices() async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.serviceListPath)
        : Uri.http(server, Constants.serviceListPath);

    return await LocalDB.getUser().then((value) async {
      return await http.post(uri,
          body: new ServiceGlobalParams(
            sessionId: value.data.userAccountInfo.sessionId,
          ).toJson());
    });
  }

  static Future<List<ProductSearchItem>> searchInServices(String text) async {
    print(text);
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.searchInServicePath)
        : Uri.http(server, Constants.searchInServicePath);

    return await http
        .post(uri, body: {"Search": text.isNotEmpty ? text : ""}).then((value) {
      ProductSearch data = ProductSearch.fromJson(json.decode(value.body));
      return data.data;
    });
  }

  static servicesUpdateReading(String serviceId, String sessionId) async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.updateReadingPath)
        : Uri.http(server, Constants.updateReadingPath);

    return await http
        .post(uri, body: {"serviceId": serviceId, "sessionId": sessionId});
  }

  static Future<Position> updateCustomerLocation(dynamic id, context) async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.customerLocationUpdatepath)
        : Uri.http(server, Constants.customerLocationUpdatepath);

    Position pos = await Utils.determinePosition();
    return await http
        .post(
      uri,
      body: CustomerLocationModel(
              inCustomerId: id.toString(),
              stGoogleMapsLat: pos.latitude.toString(),
              stGoogleMapsLng: pos.longitude.toString())
          .toJson(),
    )
        .then((value) {
      Utils.showAuthedSnack(context, "Konumunuz Başarıyla Güncellendi!");
      return pos;
    });
  }

  static Future<ServiceList> saveFormCustomerProduct(ProductFormObjects data,
      ServiceList service, int productId, int recorderID, context, name) async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.customerProductUpatePath)
        : Uri.http(server, Constants.customerProductUpatePath);
    MCustomerDeviceAddModel newmodel = MCustomerDeviceAddModel();
    newmodel.customerId = service.customerInfo.customerId;
    newmodel.productId = productId;
    newmodel.recorderId = recorderID;
    for (var item in data.data) {
      switch (item.stColumnName) {
        case "StExplain":
          if (item.stTextValue == "" || item.stTextValue == null)
            newmodel.explain = null;
          newmodel.explain = item.stTextValue;
          break;
        case "DtSetupDate":
          if (item.dtDateValue == "" || item.dtDateValue == null)
            newmodel.setupDate = null;
          newmodel.setupDate = item.dtDateValue;
          break;
        case "DtGuaranteeBegin":
          if (item.dtDateValue == "" || item.dtDateValue == null)
            newmodel.guaranteeBegin = null;
          newmodel.guaranteeBegin = item.dtDateValue;
          break;
        case "DtGuaranteeEnd":
          if (item.dtDateValue == "" || item.dtDateValue == null)
            newmodel.guaranteeEnd = null;
          newmodel.guaranteeEnd = item.dtDateValue;
          break;
        case "StSerialNumber":
          if (item.stTextValue == "" || item.stTextValue == null)
            newmodel.serialNumber = null;
          newmodel.serialNumber = item.stTextValue;
          break;
        case "FlCount":
          if (item.stTextValue == "" || item.stTextValue == null)
            newmodel.productCount = null;
          newmodel.productCount = int.parse(item.stTextValue);
          break;
        case "InCustomerProductStateId":
          if (item.stTextValue == "" || item.stTextValue == null)
            newmodel.customerProductStateId = 0;
          else {
            newmodel.customerProductStateId = int.parse(item.stTextValue);
          }
          break;
      }
    }

    return await http
        .post(uri,
            headers: {
              "Content-Type": "application/json",
              'Accept': 'application/json'
            },
            body: json.encode(newmodel))
        .then((value) {
      if (json.decode(value.body)["Success"] == true) {
        print(value.body);

        CustomerDeviceList newservice = CustomerDeviceList();
        CustomerProductServer data =
            CustomerProductServer.fromJson(json.decode(value.body)["Data"]);
        LocalDB.getDefaults().then((value) {
          newservice.customerProductId = data.customerProductId;
          newservice.customerProductSerialNumber = newmodel.serialNumber;
          newservice.productId = newmodel.productId;
          newservice.serviceTagList = data.customerProductTagList;
          newservice.productCode = "";
          newservice.customerProductState = "";
          newservice.productName = name;
          newservice.customerProductSavedPlatform = 1;
          newservice.serviceOperationTypeList =
              value.data.serviceOperationTypeList;
          service.customerInfo.customerDeviceList.add(newservice);
        });
        Utils.showAuthedSnack(context, "Yeni Ürün Başarıyla Eklendi!");
        return service;
      } else {
        Utils.showAuthedSnack(context,
            "Yazılımsal bir hata oldu." + json.decode(value.body)["Message"]);
      }
      return null;
    });
  }

  static Future<ProductFormObjects> formCustomerProduct() async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.formCustomerProduct)
        : Uri.http(server, Constants.formCustomerProduct);

    return await http.post(uri).then((value) {
      ProductFormObjects data =
          ProductFormObjects.fromJson(json.decode(value.body));
      return data;
    });
  }

  static Future<ServiceDefaults> getServiceData() async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.getServiceData)
        : Uri.http(server, Constants.getServiceData);
    return LocalDB.getUser().then((value) async {
      return await http.post(uri, body: {
        "sessionId": value.data.userAccountInfo.sessionId
      }).then((value) async {
        ServiceDefaults data =
            ServiceDefaults.fromJson(json.decode(value.body));
        await LocalDB.setDefaults(data);
        return data;
      });
    });
  }

  static Future<ProductFromList> getPfromList(String text) async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.getAllProductsList)
        : Uri.http(server, Constants.getAllProductsList);
    return await http
        .post(uri, body: {"Search": text.isNotEmpty ? text : ""}).then((value) {
      ProductFromList data = ProductFromList.fromJson(json.decode(value.body));
      return data;
    });
  }

  static Future<ProductFromList> getPfromPersonel(String text) async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.getProductListOnPersonnelWarehouse)
        : Uri.http(server, Constants.getProductListOnPersonnelWarehouse);
    return LocalDB.getUser().then((value) async {
      return await http
          .post(uri,
              headers: {"Content-Type": "application/json"},
              body: json.encode({
                "Search": text.isNotEmpty ? text : "",
                "SessionId": value.data.userAccountInfo.sessionId
              }))
          .then((value) {
        print(json.encode(value.body));
        ProductFromList data =
            ProductFromList.fromJson(json.decode(value.body));
        return data;
      });
    });
  }

  static Future<ProductfromInvoice> getPfromInvoice(
      String text, int customerId) async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.stockActivityList)
        : Uri.http(server, Constants.stockActivityList);
    return LocalDB.getUser().then((value) async {
      return await http
          .post(uri,
              headers: {"Content-Type": "application/json"},
              body: json.encode(
                  new StockParams(searchText: "", customerId: customerId)))
          .then((value) {
        ProductfromInvoice products = ProductfromInvoice.fromJson(
            json.decode(value.body.replaceAll(r'\', '')));

        return products;
      });
    });
  }

  static Future<UserStateModel> getUserStates() async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.getAllUserStateList)
        : Uri.http(server, Constants.getAllUserStateList);
    return LocalDB.getUser().then((value) async {
      return await http
          .post(uri,
              headers: {"Content-Type": "application/json"},
              body: json.encode(new ServiceGlobalParams(
                  personalId: value.data.userAccountInfo.personalId)))
          .then((value) {
        UserStateModel data =
            new UserStateModel.fromJson(json.decode(value.body));
        return data;
      });
    });
  }

  static Future<Response> uploadService(
      int serviceId, ServiceList service, bool net) async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.updateservicepath)
        : Uri.http(server, Constants.updateservicepath);

    return await LocalDB.getUploadService(serviceId.toString())
        .then((uploadservice) async {
      return await LocalDB.getUser().then((user) async {
        return await LocalDB.getDate(serviceId.toString()).then((value) async {
          uploadservice.serviceId = serviceId;
          uploadservice.sessionId = user.data.userAccountInfo.sessionId;
          uploadservice.approverPersonalId =
              user.data.userAccountInfo.personalId;

          uploadservice.approverPersonalName =
              user.data.userAccountInfo.personalName;
          uploadservice.serviceEndDate = DateTime.now().toIso8601String();
          uploadservice.serviceBeginDate = value.toIso8601String();
          uploadservice.serviceTotalSeconds =
              value.difference(DateTime.now()).inSeconds.toString();
          for (var item in service.serviceProductList) {
            ListProductSimple prod = ListProductSimple();
            prod.productCode = item.productCode;
            prod.productId = item.productId;
            prod.productIsAdded = true;
            prod.productName = item.productName;
            prod.quantity = item.quantity;

            prod.inUsage = 1;

            uploadservice.productList.add(prod);
          }
          for (var item in service.serviceRelevantProductList) {
            ServiceRelevantProductSimple dat = ServiceRelevantProductSimple();

            dat.productId = item.productId;
            dat.productExplain = item.explain;
            dat.serialintber = item.serialNumber;
            dat.serviceOperationTypeId = item.serviceOperationTypeIds;
            dat.serviceTag = item.serviceTagId.toString();
            uploadservice.serviceRelevantProductList.add(dat);
          }
          for (var item in service.servicePhotoList) {
            ServiceImageSimpleModel prod = ServiceImageSimpleModel();
            prod.imageBase64Str = item.photoBase64Str;
            prod.imageExtension = ".jpg";
            prod.imageFilePath = "";
            prod.imageName = "";
            prod.imageId = item.photoID;

            uploadservice.serviceImageList.add(prod);
          }
          uploadservice.serviceTemplateId = 1;
          uploadservice.serviceTemplateFileName = "";
          uploadservice.taskId = 1;

          if (net) {
            return await http.post(
              uri,
              headers: {"Content-Type": "application/json"},
              body: json.encode(uploadservice),
            );
          }
          await LocalDB.saveUploadService(serviceId.toString(), uploadservice);
          return null;
        });
      });
    });
  }

  static Future<List<CustomerList>> searchInCustomer(String searchText) async {
    String server = await LocalDB.getServer();
    bool ssl = await LocalDB.getSsl();
    Uri uri = ssl == true
        ? Uri.https(server, Constants.searchInCustomer)
        : Uri.http(server, Constants.searchInCustomer);
    return await http
        .post(uri,
            headers: {"Content-Type": "application/json"},
            body: json.encode(new ServiceGlobalParams(searchText: searchText)))
        .then((value) {
      CustomerListModel data =
          new CustomerListModel.fromJson(json.decode(value.body));
      print(value.body);
      return data.data.customerList;
    });
  }
}
