class ProductFormObjects {
  int total;
  bool success;
  String message;
  List<Data> data;
  int code;

  ProductFormObjects(
      {this.total, this.success, this.message, this.data, this.code});

  ProductFormObjects.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    success = json['Success'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
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

class Data {
  String stObjectId;
  String stObjectType;
  String stLabelText;
  String stColumnName;
  Null stLabelTextShortInformation;
  bool boRequired;
  String dtDateValue;
  String stTextValue;
  bool boMultiple;
  List<ObjectComboboxOrRadioList> objectComboboxOrRadioList;

  Data(
      {this.stObjectId,
      this.stObjectType,
      this.stLabelText,
      this.stColumnName,
      this.stLabelTextShortInformation,
      this.boRequired,
      this.dtDateValue,
      this.stTextValue,
      this.boMultiple,
      this.objectComboboxOrRadioList});

  Data.fromJson(Map<String, dynamic> json) {
    stObjectId = json['StObjectId'];
    stObjectType = json['StObjectType'];
    stLabelText = json['StLabelText'];
    stColumnName = json['StColumnName'];
    stLabelTextShortInformation = json['StLabelTextShortInformation'];
    boRequired = json['BoRequired'];
    dtDateValue = json['DtDateValue'];
    stTextValue = json['StTextValue'];
    boMultiple = json['BoMultiple'];
    if (json['ObjectComboboxOrRadioList'] != null) {
      objectComboboxOrRadioList = new List<ObjectComboboxOrRadioList>();
      json['ObjectComboboxOrRadioList'].forEach((v) {
        objectComboboxOrRadioList
            .add(new ObjectComboboxOrRadioList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StObjectId'] = this.stObjectId;
    data['StObjectType'] = this.stObjectType;
    data['StLabelText'] = this.stLabelText;
    data['StColumnName'] = this.stColumnName;
    data['StLabelTextShortInformation'] = this.stLabelTextShortInformation;
    data['BoRequired'] = this.boRequired;
    data['DtDateValue'] = this.dtDateValue;
    data['StTextValue'] = this.stTextValue;
    data['BoMultiple'] = this.boMultiple;
    if (this.objectComboboxOrRadioList != null) {
      data['ObjectComboboxOrRadioList'] =
          this.objectComboboxOrRadioList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ObjectComboboxOrRadioList {
  int id;
  String name;

  ObjectComboboxOrRadioList({this.id, this.name});

  ObjectComboboxOrRadioList.fromJson(Map<String, dynamic> json) {
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

class MCustomerDeviceAddModel {
  int customerProductId;
  int recorderId;
  int customerId;
  int productId;
  int customerProductStateId;
  String setupDate;
  String guaranteeBegin;
  String guaranteeEnd;
  String serialNumber;
  int productCount;
  String explain;

  MCustomerDeviceAddModel(
      {this.customerProductId,
      this.recorderId,
      this.customerId,
      this.productId,
      this.customerProductStateId,
      this.setupDate,
      this.guaranteeBegin,
      this.guaranteeEnd,
      this.serialNumber,
      this.productCount,
      this.explain});

  MCustomerDeviceAddModel.fromJson(Map<String, dynamic> json) {
    customerProductId = json['CustomerProductId'];
    recorderId = json['RecorderId'];
    customerId = json['CustomerId'];
    productId = json['ProductId'];
    customerProductStateId = json['CustomerProductStateId'];
    setupDate = json['SetupDate'];
    guaranteeBegin = json['GuaranteeBegin'];
    guaranteeEnd = json['GuaranteeEnd'];
    serialNumber = json['SerialNumber'];
    productCount = json['ProductCount'];
    explain = json['Explain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerProductId'] = this.customerProductId;
    data['RecorderId'] = this.recorderId;
    data['CustomerId'] = this.customerId;
    data['ProductId'] = this.productId;
    data['CustomerProductStateId'] = this.customerProductStateId;
    data['SetupDate'] = this.setupDate;
    data['GuaranteeBegin'] = this.guaranteeBegin;
    data['GuaranteeEnd'] = this.guaranteeEnd;
    data['SerialNumber'] = this.serialNumber;
    data['ProductCount'] = this.productCount;
    data['Explain'] = this.explain;
    return data;
  }
}
