class ServiceModel {
  int total;
  bool success;
  String message;
  Data data;
  int code;

  ServiceModel({this.total, this.success, this.message, this.data, this.code});

  ServiceModel.fromJson(Map<String, dynamic> json) {
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
  int assignedServiceCount;
  List<ServiceDefaultMailList> serviceDefaultMailList;
  List<ServiceOperationTypeList> serviceOperationTypeList;
  List<ServiceExplainList> serviceExplainList;
  List<StateList> serviceStateList;
  List<MyPersonalList> myPersonalList;
  List<ServiceTemplateList> serviceTemplateList;
  List<ServiceList> serviceList;

  Data(
      {this.assignedServiceCount,
      this.serviceDefaultMailList,
      this.serviceOperationTypeList,
      this.serviceExplainList,
      this.serviceStateList,
      this.myPersonalList,
      this.serviceTemplateList,
      this.serviceList});

  Data.fromJson(Map<String, dynamic> json) {
    assignedServiceCount = json['AssignedServiceCount'];
    if (json['ServiceDefaultMailList'] != null) {
      serviceDefaultMailList = new List<ServiceDefaultMailList>();
      json['ServiceDefaultMailList'].forEach((v) {
        serviceDefaultMailList.add(new ServiceDefaultMailList.fromJson(v));
      });
    }
    if (json['ServiceOperationTypeList'] != null) {
      serviceOperationTypeList = new List<ServiceOperationTypeList>();
      json['ServiceOperationTypeList'].forEach((v) {
        serviceOperationTypeList.add(new ServiceOperationTypeList.fromJson(v));
      });
    }
    if (json['ServiceExplainList'] != null) {
      serviceExplainList = new List<ServiceExplainList>();
      json['ServiceExplainList'].forEach((v) {
        serviceExplainList.add(new ServiceExplainList.fromJson(v));
      });
    }
    if (json['ServiceStateList'] != null) {
      serviceStateList = new List<StateList>();
      json['ServiceStateList'].forEach((v) {
        serviceStateList.add(new StateList.fromJson(v));
      });
    }
    if (json['MyPersonalList'] != null) {
      myPersonalList = new List<MyPersonalList>();
      json['MyPersonalList'].forEach((v) {
        myPersonalList.add(new MyPersonalList.fromJson(v));
      });
    }
    if (json['ServiceTemplateList'] != null) {
      serviceTemplateList = new List<ServiceTemplateList>();
      json['ServiceTemplateList'].forEach((v) {
        serviceTemplateList.add(new ServiceTemplateList.fromJson(v));
      });
    }
    if (json['ServiceList'] != null) {
      serviceList = new List<ServiceList>();
      json['ServiceList'].forEach((v) {
        serviceList.add(new ServiceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AssignedServiceCount'] = this.assignedServiceCount;
    if (this.serviceDefaultMailList != null) {
      data['ServiceDefaultMailList'] =
          this.serviceDefaultMailList.map((v) => v.toJson()).toList();
    }
    if (this.serviceOperationTypeList != null) {
      data['ServiceOperationTypeList'] =
          this.serviceOperationTypeList.map((v) => v.toJson()).toList();
    }
    if (this.serviceExplainList != null) {
      data['ServiceExplainList'] =
          this.serviceExplainList.map((v) => v.toJson()).toList();
    }
    if (this.serviceStateList != null) {
      data['ServiceStateList'] =
          this.serviceStateList.map((v) => v.toJson()).toList();
    }
    if (this.myPersonalList != null) {
      data['MyPersonalList'] =
          this.myPersonalList.map((v) => v.toJson()).toList();
    }
    if (this.serviceTemplateList != null) {
      data['ServiceTemplateList'] =
          this.serviceTemplateList.map((v) => v.toJson()).toList();
    }
    if (this.serviceList != null) {
      data['ServiceList'] = this.serviceList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceDefaultMailList {
  String mailAddress;

  ServiceDefaultMailList({this.mailAddress});

  ServiceDefaultMailList.fromJson(Map<String, dynamic> json) {
    mailAddress = json['MailAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MailAddress'] = this.mailAddress;
    return data;
  }
}

class ServiceOperationTypeList {
  int serviceOperationTypeId;
  String serviceOperationTypeName;

  ServiceOperationTypeList(
      {this.serviceOperationTypeId, this.serviceOperationTypeName});

  ServiceOperationTypeList.fromJson(Map<String, dynamic> json) {
    serviceOperationTypeId = json['ServiceOperationTypeId'];
    serviceOperationTypeName = json['ServiceOperationTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceOperationTypeId'] = this.serviceOperationTypeId;
    data['ServiceOperationTypeName'] = this.serviceOperationTypeName;
    return data;
  }
}

class ServiceExplainList {
  int serviceExplainId;
  String serviceExplainTitle;
  String serviceExplain;

  ServiceExplainList(
      {this.serviceExplainId, this.serviceExplainTitle, this.serviceExplain});

  ServiceExplainList.fromJson(Map<String, dynamic> json) {
    serviceExplainId = json['ServiceExplainId'];
    serviceExplainTitle = json['ServiceExplainTitle'];
    serviceExplain = json['ServiceExplain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceExplainId'] = this.serviceExplainId;
    data['ServiceExplainTitle'] = this.serviceExplainTitle;
    data['ServiceExplain'] = this.serviceExplain;
    return data;
  }
}

class StateList {
  int serviceStateId;
  String serviceStateName;
  String textColor;
  String backgroundColor;
  bool pushNotification;

  StateList(
      {this.serviceStateId,
      this.serviceStateName,
      this.textColor,
      this.backgroundColor,
      this.pushNotification});

  StateList.fromJson(Map<String, dynamic> json) {
    serviceStateId = json['ServiceStateId'];
    serviceStateName = json['ServiceStateName'];
    textColor = json['TextColor'];
    backgroundColor = json['BackgroundColor'];
    pushNotification = json['PushNotification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceStateId'] = this.serviceStateId;
    data['ServiceStateName'] = this.serviceStateName;
    data['TextColor'] = this.textColor;
    data['BackgroundColor'] = this.backgroundColor;
    data['PushNotification'] = this.pushNotification;
    return data;
  }
}

class MyPersonalList {
  int personalId;
  String personalName;
  bool personalGender;
  String personalEmail;

  MyPersonalList(
      {this.personalId,
      this.personalName,
      this.personalGender,
      this.personalEmail});

  MyPersonalList.fromJson(Map<String, dynamic> json) {
    personalId = json['PersonalId'];
    personalName = json['PersonalName'];
    personalGender = json['PersonalGender'];
    personalEmail = json['PersonalEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PersonalId'] = this.personalId;
    data['PersonalName'] = this.personalName;
    data['PersonalGender'] = this.personalGender;
    data['PersonalEmail'] = this.personalEmail;
    return data;
  }
}

class ServiceTemplateList {
  int templateId;
  String templateName;
  String fileName;

  ServiceTemplateList({this.templateId, this.templateName, this.fileName});

  ServiceTemplateList.fromJson(Map<String, dynamic> json) {
    templateId = json['TemplateId'];
    templateName = json['TemplateName'];
    fileName = json['FileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TemplateId'] = this.templateId;
    data['TemplateName'] = this.templateName;
    data['FileName'] = this.fileName;
    return data;
  }
}

class Photo {
  int photoID;
  String photoBase64Str;
  String photoFilePath;
  String photoExtension;
  Photo(
      {this.photoID,
      this.photoBase64Str,
      this.photoExtension,
      this.photoFilePath});
  Photo.fromJson(Map<String, dynamic> json) {
    photoID = json['PhotoID'];
    photoBase64Str = json['PhotoBase64Str'];
    photoFilePath = json['PhotoFilePath'];
    photoExtension = json['PhotoExtension'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PhotoID'] = this.photoID;
    data['PhotoBase64Str'] = this.photoBase64Str;
    data['PhotoFilePath'] = this.photoFilePath;
    data['PhotoExtension'] = this.photoExtension;

    return data;
  }
}

class ServiceList {
  ServiceInfo serviceInfo;
  CustomerInfo customerInfo;
  StateList serviceStateInfo;
  ServiceDetail serviceDetail;
  List<ServiceProductList> serviceProductList;
  List<ServiceRelevantProductList> serviceRelevantProductList;
  List<ServiceStockList> serviceStockList;
  List<Photo> servicePhotoList;
  String serviceNewRelaventPersonalName;

  ServiceList(
      {this.serviceInfo,
      this.customerInfo,
      this.serviceStateInfo,
      this.serviceDetail,
      this.serviceProductList,
      this.serviceRelevantProductList,
      this.serviceStockList,
      this.servicePhotoList,
      this.serviceNewRelaventPersonalName});

  ServiceList.fromJson(Map<String, dynamic> json) {
    serviceInfo = json['ServiceInfo'] != null
        ? new ServiceInfo.fromJson(json['ServiceInfo'])
        : null;
    customerInfo = json['CustomerInfo'] != null
        ? new CustomerInfo.fromJson(json['CustomerInfo'])
        : null;
    serviceStateInfo = json['ServiceStateInfo'] != null
        ? new StateList.fromJson(json['ServiceStateInfo'])
        : null;
    serviceDetail = json['ServiceDetail'] != null
        ? new ServiceDetail.fromJson(json['ServiceDetail'])
        : null;
    if (json['ServiceProductList'] != null) {
      serviceProductList = new List<ServiceProductList>();
      json['ServiceProductList'].forEach((v) {
        serviceProductList.add(new ServiceProductList.fromJson(v));
      });
    }
    if (json['ServiceRelevantProductList'] != null) {
      serviceRelevantProductList = new List<ServiceRelevantProductList>();
      json['ServiceRelevantProductList'].forEach((v) {
        serviceRelevantProductList
            .add(new ServiceRelevantProductList.fromJson(v));
      });
    }
    if (json['ServiceStockList'] != null) {
      serviceStockList = new List<ServiceStockList>();
      json['ServiceStockList'].forEach((v) {
        serviceStockList.add(new ServiceStockList.fromJson(v));
      });
    }
    if (json['ServicePhotoList'] != null) {
      servicePhotoList = <Photo>[];
      json['ServicePhotoList'].forEach((v) {
        servicePhotoList.add(new Photo.fromJson(v));
      });
    }
    serviceNewRelaventPersonalName = json['ServiceNewRelaventPersonalName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceInfo != null) {
      data['ServiceInfo'] = this.serviceInfo.toJson();
    }
    if (this.customerInfo != null) {
      data['CustomerInfo'] = this.customerInfo.toJson();
    }
    if (this.serviceStateInfo != null) {
      data['ServiceStateInfo'] = this.serviceStateInfo.toJson();
    }
    if (this.serviceDetail != null) {
      data['ServiceDetail'] = this.serviceDetail.toJson();
    }
    if (this.serviceProductList != null) {
      data['ServiceProductList'] =
          this.serviceProductList.map((v) => v.toJson()).toList();
    }
    if (this.serviceRelevantProductList != null) {
      data['ServiceRelevantProductList'] =
          this.serviceRelevantProductList.map((v) => v.toJson()).toList();
    }
    if (this.serviceStockList != null) {
      data['ServiceStockList'] =
          this.serviceStockList.map((v) => v.toJson()).toList();
    }
    if (this.servicePhotoList != null) {
      data['ServicePhotoList'] =
          this.servicePhotoList.map((v) => v.toJson()).toList();
    }
    data['ServiceNewRelaventPersonalName'] =
        this.serviceNewRelaventPersonalName;
    return data;
  }
}

class ServiceInfo {
  int serviceId;
  String serviceSubject;
  bool serviceReadingStatus;
  String serviceStartedDate;
  String serviceReadingDate;
  String serviceDate;

  ServiceInfo(
      {this.serviceId,
      this.serviceSubject,
      this.serviceReadingStatus,
      this.serviceStartedDate,
      this.serviceReadingDate,
      this.serviceDate});

  ServiceInfo.fromJson(Map<String, dynamic> json) {
    serviceId = json['ServiceId'];
    serviceSubject = json['ServiceSubject'];
    serviceReadingStatus = json['ServiceReadingStatus'];
    serviceStartedDate = json['ServiceStartedDate'];
    serviceReadingDate = json['ServiceReadingDate'];
    serviceDate = json['ServiceDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceId'] = this.serviceId;
    data['ServiceSubject'] = this.serviceSubject;
    data['ServiceReadingStatus'] = this.serviceReadingStatus;
    data['ServiceStartedDate'] = this.serviceStartedDate;
    data['ServiceReadingDate'] = this.serviceReadingDate;
    data['ServiceDate'] = this.serviceDate;
    return data;
  }
}

class CustomerInfo {
  int customerId;
  String customerName;
  String address;
  String customerPhone;
  String lat;
  String lng;
  List<CustomerDeviceList> customerDeviceList;
  List<CustomerPersonalList> customerPersonalList;

  CustomerInfo(
      {this.customerId,
      this.customerName,
      this.address,
      this.customerPhone,
      this.lat,
      this.lng,
      this.customerDeviceList,
      this.customerPersonalList});

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    customerId = json['CustomerId'];
    customerName = json['CustomerName'];
    address = json['Address'];
    customerPhone = json['CustomerPhone'];
    lat = json['Lat'];
    lng = json['Lng'];
    if (json['CustomerDeviceList'] != null) {
      customerDeviceList = new List<CustomerDeviceList>();
      json['CustomerDeviceList'].forEach((v) {
        customerDeviceList.add(new CustomerDeviceList.fromJson(v));
      });
    }
    if (json['CustomerPersonalList'] != null) {
      customerPersonalList = new List<CustomerPersonalList>();
      json['CustomerPersonalList'].forEach((v) {
        customerPersonalList.add(new CustomerPersonalList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerId'] = this.customerId;
    data['CustomerName'] = this.customerName;
    data['Address'] = this.address;
    data['CustomerPhone'] = this.customerPhone;
    data['Lat'] = this.lat;
    data['Lng'] = this.lng;
    if (this.customerDeviceList != null) {
      data['CustomerDeviceList'] =
          this.customerDeviceList.map((v) => v.toJson()).toList();
    }
    if (this.customerPersonalList != null) {
      data['CustomerPersonalList'] =
          this.customerPersonalList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerDeviceList {
  int customerProductId;
  int productId;
  String productName;
  String productCode;
  String customerProductState;
  String customerProductSerialNumber;
  int customerProductSavedPlatform;
  List<ServiceTagList> serviceTagList;
  List<ServiceOperationTypeList> serviceOperationTypeList;

  CustomerDeviceList(
      {this.customerProductId,
      this.productId,
      this.productName,
      this.productCode,
      this.customerProductState,
      this.customerProductSerialNumber,
      this.customerProductSavedPlatform,
      this.serviceTagList,
      this.serviceOperationTypeList});

  CustomerDeviceList.fromJson(Map<String, dynamic> json) {
    customerProductId = json['CustomerProductId'];
    productId = json['ProductId'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    customerProductState = json['CustomerProductState'];
    customerProductSerialNumber = json['CustomerProductSerialNumber'];
    customerProductSavedPlatform = json['CustomerProductSavedPlatform'];
    if (json['ServiceTagList'] != null) {
      serviceTagList = new List<ServiceTagList>();
      json['ServiceTagList'].forEach((v) {
        serviceTagList.add(new ServiceTagList.fromJson(v));
      });
    }
    if (json['ServiceOperationTypeList'] != null) {
      serviceOperationTypeList = new List<ServiceOperationTypeList>();
      json['ServiceOperationTypeList'].forEach((v) {
        serviceOperationTypeList.add(new ServiceOperationTypeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerProductId'] = this.customerProductId;
    data['ProductId'] = this.productId;
    data['ProductName'] = this.productName;
    data['ProductCode'] = this.productCode;
    data['CustomerProductState'] = this.customerProductState;
    data['CustomerProductSerialNumber'] = this.customerProductSerialNumber;
    data['CustomerProductSavedPlatform'] = this.customerProductSavedPlatform;
    if (this.serviceTagList != null) {
      data['ServiceTagList'] =
          this.serviceTagList.map((v) => v.toJson()).toList();
    }
    if (this.serviceOperationTypeList != null) {
      data['ServiceOperationTypeList'] =
          this.serviceOperationTypeList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceTagList {
  int serviceTagId;
  String serviceTagTitle;
  String serviceTagExplain;

  ServiceTagList(
      {this.serviceTagId, this.serviceTagTitle, this.serviceTagExplain});

  ServiceTagList.fromJson(Map<String, dynamic> json) {
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

class CustomerPersonalList {
  int customerPersonalId;
  String personalName;
  bool personalGender;
  String personalEmail;

  CustomerPersonalList(
      {this.customerPersonalId,
      this.personalName,
      this.personalGender,
      this.personalEmail});

  CustomerPersonalList.fromJson(Map<String, dynamic> json) {
    customerPersonalId = json['CustomerPersonalId'];
    personalName = json['PersonalName'];
    personalGender = json['PersonalGender'];
    personalEmail = json['PersonalEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerPersonalId'] = this.customerPersonalId;
    data['PersonalName'] = this.personalName;
    data['PersonalGender'] = this.personalGender;
    data['PersonalEmail'] = this.personalEmail;
    return data;
  }
}

class ServiceDetail {
  String serviceNo;
  String customerRelevantName;
  String customerRelevantPersonalGsm;
  String serviceType;
  String information;
  String appointmentDate;
  String stTechnicianName;
  List<ServiceExtraFields> serviceExtraFields;

  ServiceDetail(
      {this.serviceNo,
      this.customerRelevantName,
      this.customerRelevantPersonalGsm,
      this.serviceType,
      this.information,
      this.appointmentDate,
      this.stTechnicianName,
      this.serviceExtraFields});

  ServiceDetail.fromJson(Map<String, dynamic> json) {
    serviceNo = json['ServiceNo'];
    customerRelevantName = json['CustomerRelevantName'];
    customerRelevantPersonalGsm = json['CustomerRelevantPersonalGsm'];
    serviceType = json['ServiceType'];
    information = json['Information'];
    appointmentDate = json['AppointmentDate'];
    stTechnicianName = json['StTechnicianName'];
    if (json['ServiceExtraFields'] != null) {
      serviceExtraFields = new List<ServiceExtraFields>();
      json['ServiceExtraFields'].forEach((v) {
        serviceExtraFields.add(new ServiceExtraFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceNo'] = this.serviceNo;
    data['CustomerRelevantName'] = this.customerRelevantName;
    data['CustomerRelevantPersonalGsm'] = this.customerRelevantPersonalGsm;
    data['ServiceType'] = this.serviceType;
    data['Information'] = this.information;
    data['AppointmentDate'] = this.appointmentDate;
    data['StTechnicianName'] = this.stTechnicianName;
    if (this.serviceExtraFields != null) {
      data['ServiceExtraFields'] =
          this.serviceExtraFields.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceExtraFields {
  String labelText;
  String value;

  ServiceExtraFields({this.labelText, this.value});

  ServiceExtraFields.fromJson(Map<String, dynamic> json) {
    labelText = json['LabelText'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LabelText'] = this.labelText;
    data['Value'] = this.value;
    return data;
  }
}

class ServiceProductList {
  int productId;
  int warehouseId;
  double quantity;
  String productCode;
  String productName;
  bool hasSerialNo;
  int lineItemRowTypeId;
  int productKdvRate;
  String productStrSalePrice;
  double productSalePrice;
  int currencyDecimalPlaces;
  int productSaleMoneyType;
  String productCurrencySymbol;
  int productCount;
  bool productDeleted;
  int inUsage;

  ServiceProductList(
      {this.productId,
      this.warehouseId,
      this.quantity,
      this.productCode,
      this.productName,
      this.hasSerialNo,
      this.lineItemRowTypeId,
      this.productKdvRate,
      this.productStrSalePrice,
      this.productSalePrice,
      this.currencyDecimalPlaces,
      this.productSaleMoneyType,
      this.productCurrencySymbol,
      this.productCount,
      this.productDeleted,
      this.inUsage});

  ServiceProductList.fromJson(Map<String, dynamic> json) {
    productId = json['ProductId'];
    warehouseId = json['WarehouseId'];
    quantity = json['Quantity'];
    productCode = json['ProductCode'];
    productName = json['ProductName'];
    hasSerialNo = json['HasSerialNo'];
    lineItemRowTypeId = json['LineItemRowTypeId'];
    productKdvRate = json['ProductKdvRate'];
    productStrSalePrice = json['ProductStrSalePrice'];
    productSalePrice = json['ProductSalePrice'];
    currencyDecimalPlaces = json['CurrencyDecimalPlaces'];
    productSaleMoneyType = json['ProductSaleMoneyType'];
    productCurrencySymbol = json['ProductCurrencySymbol'];
    productCount = json['ProductCount'];
    productDeleted = json['ProductDeleted'];
    inUsage = json['InUsage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['WarehouseId'] = this.warehouseId;
    data['Quantity'] = this.quantity;
    data['ProductCode'] = this.productCode;
    data['ProductName'] = this.productName;
    data['HasSerialNo'] = this.hasSerialNo;
    data['LineItemRowTypeId'] = this.lineItemRowTypeId;
    data['ProductKdvRate'] = this.productKdvRate;
    data['ProductStrSalePrice'] = this.productStrSalePrice;
    data['ProductSalePrice'] = this.productSalePrice;
    data['CurrencyDecimalPlaces'] = this.currencyDecimalPlaces;
    data['ProductSaleMoneyType'] = this.productSaleMoneyType;
    data['ProductCurrencySymbol'] = this.productCurrencySymbol;
    data['ProductCount'] = this.productCount;
    data['ProductDeleted'] = this.productDeleted;
    data['InUsage'] = this.inUsage;
    return data;
  }
}

class ServiceRelevantProductList {
  int serviceRelevantProductId;
  int customerProductId;
  int productId;
  String productName;
  String productCode;
  String productState;
  String serialNumber;
  String explain;
  int serviceTagId;
  String serviceOperationTypeIds;
  List<ServiceTagList> serviceTagList;
  List<ServiceOperationTypeList> serviceOperationTypeList;

  ServiceRelevantProductList(
      {this.serviceRelevantProductId,
      this.customerProductId,
      this.productId,
      this.productName,
      this.productCode,
      this.productState,
      this.serialNumber,
      this.explain,
      this.serviceTagId,
      this.serviceOperationTypeIds,
      this.serviceTagList,
      this.serviceOperationTypeList});

  ServiceRelevantProductList.fromJson(Map<String, dynamic> json) {
    serviceRelevantProductId = json['ServiceRelevantProductId'];
    customerProductId = json['CustomerProductId'];
    productId = json['ProductId'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    productState = json['ProductState'];
    serialNumber = json['SerialNumber'];
    explain = json['Explain'];
    serviceTagId = json['ServiceTagId'];
    serviceOperationTypeIds = json['ServiceOperationTypeIds'];
    if (json['ServiceTagList'] != null) {
      serviceTagList = new List<ServiceTagList>();
      json['ServiceTagList'].forEach((v) {
        serviceTagList.add(new ServiceTagList.fromJson(v));
      });
    }
    if (json['ServiceOperationTypeList'] != null) {
      serviceOperationTypeList = new List<ServiceOperationTypeList>();
      json['ServiceOperationTypeList'].forEach((v) {
        serviceOperationTypeList.add(new ServiceOperationTypeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceRelevantProductId'] = this.serviceRelevantProductId;
    data['CustomerProductId'] = this.customerProductId;
    data['ProductId'] = this.productId;
    data['ProductName'] = this.productName;
    data['ProductCode'] = this.productCode;
    data['ProductState'] = this.productState;
    data['SerialNumber'] = this.serialNumber;
    data['Explain'] = this.explain;
    data['ServiceTagId'] = this.serviceTagId;
    data['ServiceOperationTypeIds'] = this.serviceOperationTypeIds;
    if (this.serviceTagList != null) {
      data['ServiceTagList'] =
          this.serviceTagList.map((v) => v.toJson()).toList();
    }
    if (this.serviceOperationTypeList != null) {
      data['ServiceOperationTypeList'] =
          this.serviceOperationTypeList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceStockList {
  int stockId;
  String stockDate;
  String stockNo;
  String stockType;
  List<StockActivityList> stockActivityList;

  ServiceStockList(
      {this.stockId,
      this.stockDate,
      this.stockNo,
      this.stockType,
      this.stockActivityList});

  ServiceStockList.fromJson(Map<String, dynamic> json) {
    stockId = json['StockId'];
    stockDate = json['StockDate'];
    stockNo = json['StockNo'];
    stockType = json['StockType'];
    if (json['StockActivityList'] != null) {
      stockActivityList = new List<StockActivityList>();
      json['StockActivityList'].forEach((v) {
        stockActivityList.add(new StockActivityList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StockId'] = this.stockId;
    data['StockDate'] = this.stockDate;
    data['StockNo'] = this.stockNo;
    data['StockType'] = this.stockType;
    if (this.stockActivityList != null) {
      data['StockActivityList'] =
          this.stockActivityList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StockActivityList {
  int stockActivityId;
  int stockId;
  double quantity;
  int productId;
  String productCode;
  String productName;
  int productKdvRate;
  bool hasSerialNo;
  String productStrSalePrice;
  double productSalePrice;
  int productSaleMoneyType;
  int currencyDecimalPlaces;
  String productCurrencySymbol;
  int usingProductCount;
  int notUsingProductCount;
  List<Null> productSerialNoList;

  StockActivityList(
      {this.stockActivityId,
      this.stockId,
      this.quantity,
      this.productId,
      this.productCode,
      this.productName,
      this.productKdvRate,
      this.hasSerialNo,
      this.productStrSalePrice,
      this.productSalePrice,
      this.productSaleMoneyType,
      this.currencyDecimalPlaces,
      this.productCurrencySymbol,
      this.usingProductCount,
      this.notUsingProductCount,
      this.productSerialNoList});

  StockActivityList.fromJson(Map<String, dynamic> json) {
    stockActivityId = json['StockActivityId'];
    stockId = json['StockId'];
    quantity = json['Quantity'];
    productId = json['ProductId'];
    productCode = json['ProductCode'];
    productName = json['ProductName'];
    productKdvRate = json['ProductKdvRate'];
    hasSerialNo = json['HasSerialNo'];
    productStrSalePrice = json['ProductStrSalePrice'];
    productSalePrice = json['ProductSalePrice'];
    productSaleMoneyType = json['ProductSaleMoneyType'];
    currencyDecimalPlaces = json['CurrencyDecimalPlaces'];
    productCurrencySymbol = json['ProductCurrencySymbol'];
    usingProductCount = json['UsingProductCount'];
    notUsingProductCount = json['NotUsingProductCount'];
    if (json['ProductSerialNoList'] != null) {
      productSerialNoList = new List<Null>();
      json['ProductSerialNoList'].forEach((v) {
        productSerialNoList.add(Null);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StockActivityId'] = this.stockActivityId;
    data['StockId'] = this.stockId;
    data['Quantity'] = this.quantity;
    data['ProductId'] = this.productId;
    data['ProductCode'] = this.productCode;
    data['ProductName'] = this.productName;
    data['ProductKdvRate'] = this.productKdvRate;
    data['HasSerialNo'] = this.hasSerialNo;
    data['ProductStrSalePrice'] = this.productStrSalePrice;
    data['ProductSalePrice'] = this.productSalePrice;
    data['ProductSaleMoneyType'] = this.productSaleMoneyType;
    data['CurrencyDecimalPlaces'] = this.currencyDecimalPlaces;
    data['ProductCurrencySymbol'] = this.productCurrencySymbol;
    data['UsingProductCount'] = this.usingProductCount;
    data['NotUsingProductCount'] = this.notUsingProductCount;
    data['ProductSerialNoList'] = this.productSerialNoList;

    return data;
  }
}
