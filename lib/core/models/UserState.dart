class UserStateModel {
  bool success;
  String message;
  Data data;
  int code;

  UserStateModel({this.success, this.message, this.data, this.code});

  UserStateModel.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    message = json['Message'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  List<UserStateList> userStateList;
  String currentPersonalImageUrl;

  Data({this.userStateList, this.currentPersonalImageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['UserStateList'] != null) {
      userStateList = new List<UserStateList>();
      json['UserStateList'].forEach((v) {
        userStateList.add(new UserStateList.fromJson(v));
      });
    }
    currentPersonalImageUrl = json['CurrentPersonalImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userStateList != null) {
      data['UserStateList'] =
          this.userStateList.map((v) => v.toJson()).toList();
    }
    data['CurrentPersonalImageUrl'] = this.currentPersonalImageUrl;
    return data;
  }
}

class UserStateList {
  int userStateId;
  String stateTypeName;
  String customerName;
  String personalName;
  String personalImageUrl;
  String recordDate;
  int personalCount;

  UserStateList(
      {this.userStateId,
      this.stateTypeName,
      this.customerName,
      this.personalName,
      this.personalImageUrl,
      this.recordDate,
      this.personalCount});

  UserStateList.fromJson(Map<String, dynamic> json) {
    userStateId = json['UserStateId'];
    stateTypeName = json['StateTypeName'];
    customerName = json['CustomerName'];
    personalName = json['PersonalName'];
    personalImageUrl = json['PersonalImageUrl'];
    recordDate = json['RecordDate'];
    personalCount = json['PersonalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserStateId'] = this.userStateId;
    data['StateTypeName'] = this.stateTypeName;
    data['CustomerName'] = this.customerName;
    data['PersonalName'] = this.personalName;
    data['PersonalImageUrl'] = this.personalImageUrl;
    data['RecordDate'] = this.recordDate;
    data['PersonalCount'] = this.personalCount;
    return data;
  }
}
