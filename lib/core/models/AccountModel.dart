import 'package:flutter/material.dart';

class AccountDetails {
  bool success;
  String message;
  Data data;
  int code;

  AccountDetails({this.success, this.message, this.data, this.code});

  AccountDetails.fromJson(Map<String, dynamic> json) {
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
  UserAccountInfo userAccountInfo;
  ModuleInfo moduleInfo;
  List<ExchangeRateList> exchangeRateList;

  Data({this.userAccountInfo, this.moduleInfo, this.exchangeRateList});

  Data.fromJson(Map<String, dynamic> json) {
    userAccountInfo = json['UserAccountInfo'] != null
        ? new UserAccountInfo.fromJson(json['UserAccountInfo'])
        : null;
    moduleInfo = json['ModuleInfo'] != null
        ? new ModuleInfo.fromJson(json['ModuleInfo'])
        : null;
    if (json['ExchangeRateList'] != null) {
      exchangeRateList = <ExchangeRateList>[];
      json['ExchangeRateList'].forEach((v) {
        exchangeRateList.add(new ExchangeRateList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userAccountInfo != null) {
      data['UserAccountInfo'] = this.userAccountInfo.toJson();
    }
    if (this.moduleInfo != null) {
      data['ModuleInfo'] = this.moduleInfo.toJson();
    }
    if (this.exchangeRateList != null) {
      data['ExchangeRateList'] =
          this.exchangeRateList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserAccountInfo {
  int userAccountId;
  String email;
  String sessionId;
  int personalId;
  int userGroupId;
  String personalName;
  bool seeProductPrice;
  bool seeTeamStatus;
  bool roleCustomerProductNewRecord;
  bool roleCustomerProductEditOwnRecord;
  bool roleCustomerProductDeleteOwnRecord;

  UserAccountInfo(
      {this.userAccountId,
      this.email,
      this.sessionId,
      this.personalId,
      this.userGroupId,
      this.personalName,
      this.seeProductPrice,
      this.seeTeamStatus,
      this.roleCustomerProductNewRecord,
      this.roleCustomerProductEditOwnRecord,
      this.roleCustomerProductDeleteOwnRecord});

  UserAccountInfo.fromJson(Map<String, dynamic> json) {
    userAccountId = json['UserAccountId'];
    email = json['Email'];
    sessionId = json['SessionId'];
    personalId = json['PersonalId'];
    userGroupId = json['UserGroupId'];
    personalName = json['PersonalName'];
    seeProductPrice = json['SeeProductPrice'];
    seeTeamStatus = json['SeeTeamStatus'];
    roleCustomerProductNewRecord = json['RoleCustomerProductNewRecord'];
    roleCustomerProductEditOwnRecord = json['RoleCustomerProductEditOwnRecord'];
    roleCustomerProductDeleteOwnRecord =
        json['RoleCustomerProductDeleteOwnRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserAccountId'] = this.userAccountId;
    data['Email'] = this.email;
    data['SessionId'] = this.sessionId;
    data['PersonalId'] = this.personalId;
    data['UserGroupId'] = this.userGroupId;
    data['PersonalName'] = this.personalName;
    data['SeeProductPrice'] = this.seeProductPrice;
    data['SeeTeamStatus'] = this.seeTeamStatus;
    data['RoleCustomerProductNewRecord'] = this.roleCustomerProductNewRecord;
    data['RoleCustomerProductEditOwnRecord'] =
        this.roleCustomerProductEditOwnRecord;
    data['RoleCustomerProductDeleteOwnRecord'] =
        this.roleCustomerProductDeleteOwnRecord;
    return data;
  }
}

class ModuleInfo {
  int currentCurrencyId;
  String currentCurrencySymbol;
  bool stockModule;
  bool multiSelectServiceProduct;
  bool serviceControlListActive;
  int serviceAgainServiceState;
  bool useRecipe;

  ModuleInfo(
      {this.currentCurrencyId,
      this.currentCurrencySymbol,
      this.stockModule,
      this.multiSelectServiceProduct,
      this.serviceControlListActive,
      this.serviceAgainServiceState,
      this.useRecipe});

  ModuleInfo.fromJson(Map<String, dynamic> json) {
    currentCurrencyId = json['CurrentCurrencyId'];
    currentCurrencySymbol = json['CurrentCurrencySymbol'];
    stockModule = json['StockModule'];
    multiSelectServiceProduct = json['MultiSelectServiceProduct'];
    serviceControlListActive = json['ServiceControlListActive'];
    serviceAgainServiceState = json['ServiceAgainServiceState'];
    useRecipe = json['UseRecipe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CurrentCurrencyId'] = this.currentCurrencyId;
    data['CurrentCurrencySymbol'] = this.currentCurrencySymbol;
    data['StockModule'] = this.stockModule;
    data['MultiSelectServiceProduct'] = this.multiSelectServiceProduct;
    data['ServiceControlListActive'] = this.serviceControlListActive;
    data['ServiceAgainServiceState'] = this.serviceAgainServiceState;
    data['UseRecipe'] = this.useRecipe;
    return data;
  }
}

class ExchangeRateList {
  int currencyId;
  double exchangeRate;
  String currencySymbol;

  ExchangeRateList({this.currencyId, this.exchangeRate, this.currencySymbol});

  ExchangeRateList.fromJson(Map<String, dynamic> json) {
    currencyId = json['CurrencyId'];
    exchangeRate = json['ExchangeRate'];
    currencySymbol = json['CurrencySymbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CurrencyId'] = this.currencyId;
    data['ExchangeRate'] = this.exchangeRate;
    data['CurrencySymbol'] = this.currencySymbol;
    return data;
  }
}
