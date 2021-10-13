class UploadServiceDTO {
  int serviceId;
  String sessionId;
  int serviceStateId;
  String explainText;
  int approverPersonalId;
  String approverPersonalName;
  String signatureImageBase64Str;
  String serviceBeginDate;
  String serviceEndDate;
  dynamic serviceTotalSeconds;
  int serviceTemplateId;
  String serviceTemplateFileName;
  int taskId;
  List<ListProductSimple> productList;
  List<PersonalWarehouseProductSimple> stockProductList;
  List<StockSimple> stockIdList;
  List<PersonalWarehouseProductSimple> personalWarehouseProductList;
  List<PersonalWarehouseProductSimple> personalWarehouseProductRecipeList;
  List<ServiceImageSimpleModel> serviceImageList;
  List<ServiceRelevantProductSimple> serviceRelevantProductList;

  UploadServiceDTO({
    this.serviceId,
    this.sessionId,
    this.serviceStateId,
    this.explainText,
    this.approverPersonalId,
    this.approverPersonalName,
    this.signatureImageBase64Str,
    this.serviceBeginDate,
    this.serviceEndDate,
    this.serviceTotalSeconds,
    this.serviceTemplateId,
    this.serviceTemplateFileName,
    this.taskId,
    this.productList,
    this.personalWarehouseProductList,
    this.serviceImageList,
    this.serviceRelevantProductList,
    this.personalWarehouseProductRecipeList,
    this.stockProductList,
    this.stockIdList,
  });
  UploadServiceDTO.fromJson(Map<String, dynamic> json) {
    serviceId = json['ServiceId'];
    sessionId = json['SessionId'];
    explainText = json['ExplainText'];
    serviceStateId = json['ServiceStateId'];
    approverPersonalId = json['ApproverPersonalId'];
    approverPersonalName = json['ApproverPersonalName'];
    signatureImageBase64Str = json['SignatureImageBase64Str'];
    serviceBeginDate = json['ServiceBeginDate'];
    serviceEndDate = json['ServiceEndDate'];
    serviceTotalSeconds = json['ServiceTotalSeconds'];
    serviceTemplateId = json['ServiceTemplateId'];
    serviceTemplateFileName = json['ServiceTemplateFileName'];
    taskId = json['TaskId'];
    productList = <ListProductSimple>[];

    if (json['ProductList'] != null) {
      json['ProductList'].forEach((v) {
        productList.add(new ListProductSimple.fromJson(v));
      });
    }

    if (json['PersonalWarehouseProductList'] == null)
      personalWarehouseProductList = <PersonalWarehouseProductSimple>[];

    serviceImageList = <ServiceImageSimpleModel>[];
    if (json['ServiceImageList'] != null) {
      json['ServiceImageList'].forEach((v) {
        serviceImageList.add(new ServiceImageSimpleModel.fromJson(v));
      });
    }
    serviceRelevantProductList = <ServiceRelevantProductSimple>[];
    if (json['ServiceRelevantProductList'] != null) {
      json['ServiceRelevantProductList'].forEach((v) {
        serviceRelevantProductList
            .add(ServiceRelevantProductSimple.fromJson(v));
      });
    }
    stockProductList = <PersonalWarehouseProductSimple>[];
    if (json['StockProductList'] != null) {
      json['StockProductList'].forEach((v) {
        stockProductList.add(new PersonalWarehouseProductSimple.fromJson(v));
      });
    }

    stockIdList = <StockSimple>[];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceId'] = this.serviceId;
    data['SessionId'] = this.sessionId;
    data['ServiceStateId'] = this.serviceStateId;
    data['ExplainText'] = this.explainText;
    data['ApproverPersonalId'] = this.approverPersonalId;
    data['ApproverPersonalName'] = this.serviceId;
    data['SignatureImageBase64Str'] = this.signatureImageBase64Str;
    data['ServiceBeginDate'] = this.serviceBeginDate;
    data['ServiceEndDate'] = this.serviceEndDate;
    data['ServiceTotalSeconds'] = this.serviceTotalSeconds;
    data['ServiceTemplateId'] = this.serviceTemplateId;
    data['ServiceTemplateFileName'] = this.serviceTemplateFileName;
    data['TaskId'] = this.taskId;
    data['ProductList'] = <ListProductSimple>[];
    if (this.productList != null)
      data['ProductList'] = this.productList.map((v) => v.toJson()).toList();

    data['PersonalWarehouseProductList'] = <PersonalWarehouseProductSimple>[];
    if (this.personalWarehouseProductList != null)
      data['PersonalWarehouseProductList'] =
          this.personalWarehouseProductList.map((v) => v.toJson()).toList();
    if (this.serviceImageList != null)
      data['ServiceImageList'] =
          this.serviceImageList.map((v) => v.toJson()).toList();
    if (this.serviceRelevantProductList != null)
      data['ServiceRelevantProductList'] =
          this.serviceRelevantProductList.map((v) => v.toJson()).toList();
    data['PersonalWarehouseProductRecipeList'] =
        <PersonalWarehouseProductSimple>[];
    if (this.personalWarehouseProductRecipeList != null)
      this.personalWarehouseProductRecipeList.map((v) => v.toJson()).toList();
    data['StockProductList'] = <PersonalWarehouseProductSimple>[];
    data['StockIdList'] = <StockSimple>[];

    return data;
  }
}

class StockSimple {
  dynamic stockId;
  dynamic stockDate;
  dynamic stockNo;
  dynamic stockType;
  StockSimple({this.stockDate, this.stockId, this.stockNo, this.stockType});
  StockSimple.fromJson(Map<String, dynamic> json) {
    stockId = json['StockId'];
    stockDate = json['StockDate'];
    stockNo = json['StockNo'];
    stockType = json['StockType'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StockId'] = this.stockId;
    data['StockDate'] = this.stockDate;
    data['StockNo'] = this.stockNo;
    data['StockType'] = this.stockType;
    return data;
  }
}

class ListProductSimple {
  // int serviceProductId;
  int productId;
  String productCode;
  String productName;
  double quantity;
  // dynamic unit;
  bool productIsAdded;
  int inUsage;
  ListProductSimple({
    this.inUsage,
    this.productCode,
    this.productId,
    this.productIsAdded,
    this.productName,
    this.quantity,
    // this.serviceProductId,
    // this.unit,
  });
  ListProductSimple.fromJson(Map<String, dynamic> json) {
    inUsage = json['InUsage'];
    productCode = json['ProductCode'];
    productId = json['ProductId'];
    productIsAdded = json['ProductIsAdded'];
    productName = json['ProductName'];
    quantity = json['Quantity'];
    // serviceProductId = json['ServiceProductId'];
    // unit = json['Unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['ServiceProductId'] = this.serviceProductId;
    data['ProductId'] = this.productId;
    data['ProductCode'] = this.productCode;
    data['ProductName'] = this.productName;
    data['Quantity'] = this.quantity;
    // data['Unit'] = this.unit;
    data['ProductIsAdded'] = this.productIsAdded;
    data['InUsage'] = this.inUsage;
    return data;
  }
}

//Personel Deposundan
class PersonalWarehouseProductSimple {
  int stockActivityId;
  int productId;
  String productCode;
  String productName;
  dynamic quantity;
  // dynamic unit;
  dynamic productSerialNo;
  PersonalWarehouseProductSimple({
    this.productCode,
    this.productId,
    this.productName,
    this.productSerialNo,
    this.quantity,
    this.stockActivityId,
    // this.unit,
  });
  PersonalWarehouseProductSimple.fromJson(Map<String, dynamic> json) {
    productSerialNo = json['ProductSerialNo'];
    productCode = json['ProductCode'];
    productId = json['ProductId'];
    stockActivityId = json['StockActivityId'];
    productName = json['ProductName'];
    quantity = json['Quantity'];
    // unit = json['Unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductSerialNo'] = this.productSerialNo;
    data['ProductId'] = this.productId;
    data['ProductCode'] = this.productCode;
    data['ProductName'] = this.productName;
    data['Quantity'] = this.quantity;
    // data['Unit'] = this.unit;
    data['StockActivityId'] = this.stockActivityId;

    return data;
  }
}

class ServiceRelevantProductSimple {
  int productId;
  dynamic customerProductId;
  String serialintber;
  String serviceTag;
  String serviceOperationTypeId;
  String productExplain;
  ServiceRelevantProductSimple({
    this.customerProductId,
    this.productExplain,
    this.productId,
    this.serialintber,
    this.serviceOperationTypeId,
    this.serviceTag,
  });
  ServiceRelevantProductSimple.fromJson(Map<String, dynamic> json) {
    customerProductId = json['CustomerProductId'];
    productExplain = json['ProductExplain'];
    productId = json['ProductId'];
    serialintber = json['Serialintber'];
    serviceOperationTypeId = json['ServiceOperationTypeId'];
    serviceTag = json['ServiceTag'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['CustomerProductId'] = this.customerProductId;
    data['Serialintber'] = this.serialintber;
    data['ServiceTag'] = this.serviceTag;
    data['ServiceOperationTypeId'] = this.serviceOperationTypeId;
    data['ProductExplain'] = this.productExplain;

    return data;
  }
}

class ServiceImageSimpleModel {
  int imageId;
  String imageName;
  String imageFilePath;
  String imageBase64Str;
  String imageExtension;

  ServiceImageSimpleModel(
      {this.imageId, this.imageName, this.imageBase64Str, this.imageFilePath});
  ServiceImageSimpleModel.fromJson(Map<String, dynamic> json) {
    imageId = json['ImageId'];
    imageName = json['ImageName'];
    imageFilePath = json['ImageFilePath'];
    imageBase64Str = json['ImageBase64Str'];
    imageExtension = json['ImageExtension'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageId'] = this.imageId;
    data['ImageName'] = this.imageName;
    data['ImageBase64Str'] = this.imageFilePath;
    data['ImageBase64Str'] = this.imageBase64Str;
    data['ImageExtension'] = this.imageExtension;

    return data;
  }
}
