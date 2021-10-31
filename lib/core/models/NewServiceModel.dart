import 'dart:core';

class NewServiceModel {
  List<MObjectFormData> rowdata;
  int inRecorderId;
  int inCustomerId;
  int inUserGroupId;
  int inPersonalId;
  String stTechnicianPersonalId;
  String stTechnicianName;
  String stCustomerRelevantName;

  NewServiceModel(
      {this.rowdata,
      this.inRecorderId,
      this.inCustomerId,
      this.inUserGroupId,
      this.inPersonalId,
      this.stTechnicianPersonalId,
      this.stTechnicianName,
      this.stCustomerRelevantName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowdata'] = this.rowdata;
    data['InRecorderId'] = this.inRecorderId;
    data['InCustomerId'] = this.inCustomerId;
    data['InUserGroupId'] = this.inUserGroupId;
    data['InPersonalId'] = this.inPersonalId;
    data['StTechnicianPersonalId'] = this.stTechnicianPersonalId;
    data['StTechnicianName'] = this.stTechnicianName;
    data['StCustomerRelevantName'] = this.stCustomerRelevantName;
    return data;
  }

  NewServiceModel.fromJson(Map<String, dynamic> json) {
    if (json["rowdata"] != null) {
      rowdata = <MObjectFormData>[];
      json['rowdata'].forEach((v) {
        rowdata.add(new MObjectFormData.fromJson(v));
      });
    } else {
      rowdata = <MObjectFormData>[];
    }
    inRecorderId = json["InRecorderId"];
    inCustomerId = json["InCustomerId"];
    inUserGroupId = json["InUserGroupId"];
    inPersonalId = json["InPersonalId"];
    stTechnicianPersonalId = json["StTechnicianPersonalId"];
    stTechnicianName = json["StTechnicianName"];
    stCustomerRelevantName = json["StCustomerRelevantName"];
  }
}

class MObjectFormDataContainer {
  int total;
  bool success;
  String message;
  List<MObjectFormData> data;
  int code;

  MObjectFormDataContainer(
      {this.total, this.success, this.message, this.data, this.code});

  MObjectFormDataContainer.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    success = json['Success'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <MObjectFormData>[];
      json['Data'].forEach((v) {
        data.add(new MObjectFormData.fromJson(v));
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

class MObjectFormData {
  String stObjectId;
  String stObjectType;
  String stLabelText;
  String stColumnName;
  String stLabelTextShortInformation;
  bool boRequired;
  String dtDateValue;
  String stTextValue;
  bool boMultiple;
  List<MObjectIdAndName> objectComboboxOrRadioList;

  MObjectFormData(
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

  MObjectFormData.fromJson(Map<String, dynamic> json) {
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
      objectComboboxOrRadioList = <MObjectIdAndName>[];
      json['ObjectComboboxOrRadioList'].forEach((v) {
        objectComboboxOrRadioList.add(new MObjectIdAndName.fromJson(v));
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

class MObjectIdAndName {
  String name;
  int id;

  MObjectIdAndName({this.id, this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }

  MObjectIdAndName.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    name = json["Name"];
  }
}
