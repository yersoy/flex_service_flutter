class ProductfromInvoice {
  int total;
  bool success;
  String message;
  Data data;
  int code;

  ProductfromInvoice(
      {this.total, this.success, this.message, this.data, this.code});

  ProductfromInvoice.fromJson(Map<String, dynamic> json) {
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
  List<StockList> stockList;

  Data({this.stockList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['StockList'] != null) {
      stockList = new List<StockList>();
      json['StockList'].forEach((v) {
        stockList.add(new StockList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stockList != null) {
      data['StockList'] = this.stockList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StockList {
  int stockId;
  String stockDate;
  String stockNo;
  int stockActivityType;
  String stockType;
  String stockUsingText;
  List<StockActivityList> stockActivityList;

  StockList(
      {this.stockId,
      this.stockDate,
      this.stockNo,
      this.stockActivityType,
      this.stockType,
      this.stockUsingText,
      this.stockActivityList});

  StockList.fromJson(Map<String, dynamic> json) {
    stockId = json['StockId'];
    stockDate = json['StockDate'];
    stockNo = json['StockNo'];
    stockActivityType = json['StockActivityType'];
    stockType = json['StockType'];
    stockUsingText = json['StockUsingText'];
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
    data['StockActivityType'] = this.stockActivityType;
    data['StockType'] = this.stockType;
    data['StockUsingText'] = this.stockUsingText;
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
  dynamic quantity;
  int productId;
  String productCode;
  String productName;
  int productKdvRate;
  bool hasSerialNo;
  String productStrSalePrice;
  dynamic productSalePrice;
  int productSaleMoneyType;
  int currencyDecimalPlaces;
  String productCurrencySymbol;
  int usingProductCount;
  int notUsingProductCount;
  List productSerialNoList;

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

    productSerialNoList = json['ProductSerialNoList'];
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
    if (this.productSerialNoList.isNotEmpty) {
      productSerialNoList = this.productSerialNoList;
    }
    return data;
  }
}
