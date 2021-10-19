class TbService {
  int inServiceId;
  int inCustomerId;
  String stServiceNo;
  int inPersonalId;
  String stCustomerRelevantName;
  int inServiceReceiverTypeId;
  String dtDeclarationTime;
  String dtAppointmentTime;
  int inServiceTypeId;
  String stTechnicianPersonalId;
  int inServiceTechnicianTypeId;
  int inServiceStateId;
  String stSubject;
  String stExplain;
  String stExtraColumn1;
  String stExtraColumn2;
  String stExtraColumn3;
  String stExtraColumn4;
  String stExtraColumn5;
  String stExtraColumn6;
  String stExtraColumn7;
  String stExtraColumn8;
  String stExtraColumn9;
  String stExtraColumn10;
  int inExtraColumn1;
  int inExtraColumn2;
  int inExtraColumn3;
  int inExtraColumn4;
  int inExtraColumn5;
  int flExtraColumn1;
  int flExtraColumn2;
  int flExtraColumn3;
  int flExtraColumn4;
  int flExtraColumn5;
  bool boExtraColumn1;
  bool boExtraColumn2;
  bool boExtraColumn3;
  bool boExtraColumn4;
  bool boExtraColumn5;
  int inRecorderId;
  double flMoneyRate2;
  double flMoneyRate3;
  double flMoneyRate4;
  int flMoneyRate5;
  int flServiceTotalTax;
  int flServiceTotalWithoutTax;
  int flDiscountPrice;
  int flServiceTotalTaxMoney1;
  int flServiceTotalWithoutTaxMoney1;
  int flServiceTotalTaxMoney2;
  int flServiceTotalWithoutTaxMoney2;
  int flServiceTotalTaxMoney3;
  int flServiceTotalWithoutTaxMoney3;
  int flServiceTotalTaxMoney4;
  int flServiceTotalWithoutTaxMoney4;
  int flServiceTotalTaxMoney5;
  int flServiceTotalWithoutTaxMoney5;
  int flGlobalDiscountRate1;
  int inGlobalDiscountType1;
  int flGlobalDiscountRate2;
  int inGlobalDiscountType2;
  String stColumnVisible;
  int inServiceCurrencyOrderNo;
  String dtStartDate;
  String dtEndDate;
  int inApproverPersonalId;
  String stAccessory;
  String stReceivingState;
  int inServiceYear;
  int inServiceNoYear;
  int inServiceNoCustomer;
  int inServiceNoCustomerYear;
  int inServiceNoRelevant;
  int inServiceNoRelevantYear;
  int inServiceNoRelevantCustomer;
  int inServiceNoRelevantCustomerYear;
  String stTechnicianName;
  String stApproverPersonalName;
  String dtRecord;
  int inUpdaterId;
  String dtUpdate;
  int inUserGroupId;
  bool boHasTask;
  int flBuyPriceTotal;
  int flProfitTotal;
  int flEstimatedTime;
  int flBuyPriceTotalMoney1;
  int flBuyPriceTotalMoney2;
  int flBuyPriceTotalMoney3;
  int flBuyPriceTotalMoney4;
  int flBuyPriceTotalMoney5;
  int flProfitTotalMoney1;
  int flProfitTotalMoney2;
  int flProfitTotalMoney3;
  int flProfitTotalMoney4;
  int flProfitTotalMoney5;
  int inSeconds;
  String dtReadingDate;
  int inServiceProcessingTime;
  int inServiceDurationOfIntervention;
  int inRevisionNo;

  TbService(
      {this.inServiceId,
      this.inCustomerId,
      this.stServiceNo,
      this.inPersonalId,
      this.stCustomerRelevantName,
      this.inServiceReceiverTypeId,
      this.dtDeclarationTime,
      this.dtAppointmentTime,
      this.inServiceTypeId,
      this.stTechnicianPersonalId,
      this.inServiceTechnicianTypeId,
      this.inServiceStateId,
      this.stSubject,
      this.stExplain,
      this.stExtraColumn1,
      this.stExtraColumn2,
      this.stExtraColumn3,
      this.stExtraColumn4,
      this.stExtraColumn5,
      this.stExtraColumn6,
      this.stExtraColumn7,
      this.stExtraColumn8,
      this.stExtraColumn9,
      this.stExtraColumn10,
      this.inExtraColumn1,
      this.inExtraColumn2,
      this.inExtraColumn3,
      this.inExtraColumn4,
      this.inExtraColumn5,
      this.flExtraColumn1,
      this.flExtraColumn2,
      this.flExtraColumn3,
      this.flExtraColumn4,
      this.flExtraColumn5,
      this.boExtraColumn1,
      this.boExtraColumn2,
      this.boExtraColumn3,
      this.boExtraColumn4,
      this.boExtraColumn5,
      this.inRecorderId,
      this.flMoneyRate2,
      this.flMoneyRate3,
      this.flMoneyRate4,
      this.flMoneyRate5,
      this.flServiceTotalTax,
      this.flServiceTotalWithoutTax,
      this.flDiscountPrice,
      this.flServiceTotalTaxMoney1,
      this.flServiceTotalWithoutTaxMoney1,
      this.flServiceTotalTaxMoney2,
      this.flServiceTotalWithoutTaxMoney2,
      this.flServiceTotalTaxMoney3,
      this.flServiceTotalWithoutTaxMoney3,
      this.flServiceTotalTaxMoney4,
      this.flServiceTotalWithoutTaxMoney4,
      this.flServiceTotalTaxMoney5,
      this.flServiceTotalWithoutTaxMoney5,
      this.flGlobalDiscountRate1,
      this.inGlobalDiscountType1,
      this.flGlobalDiscountRate2,
      this.inGlobalDiscountType2,
      this.stColumnVisible,
      this.inServiceCurrencyOrderNo,
      this.dtStartDate,
      this.dtEndDate,
      this.inApproverPersonalId,
      this.stAccessory,
      this.stReceivingState,
      this.inServiceYear,
      this.inServiceNoYear,
      this.inServiceNoCustomer,
      this.inServiceNoCustomerYear,
      this.inServiceNoRelevant,
      this.inServiceNoRelevantYear,
      this.inServiceNoRelevantCustomer,
      this.inServiceNoRelevantCustomerYear,
      this.stTechnicianName,
      this.stApproverPersonalName,
      this.dtRecord,
      this.inUpdaterId,
      this.dtUpdate,
      this.inUserGroupId,
      this.boHasTask,
      this.flBuyPriceTotal,
      this.flProfitTotal,
      this.flEstimatedTime,
      this.flBuyPriceTotalMoney1,
      this.flBuyPriceTotalMoney2,
      this.flBuyPriceTotalMoney3,
      this.flBuyPriceTotalMoney4,
      this.flBuyPriceTotalMoney5,
      this.flProfitTotalMoney1,
      this.flProfitTotalMoney2,
      this.flProfitTotalMoney3,
      this.flProfitTotalMoney4,
      this.flProfitTotalMoney5,
      this.inSeconds,
      this.dtReadingDate,
      this.inServiceProcessingTime,
      this.inServiceDurationOfIntervention,
      this.inRevisionNo});

  TbService.fromJson(Map<String, dynamic> json) {
    inServiceId = json['InServiceId'];
    inCustomerId = json['InCustomerId'];
    stServiceNo = json['StServiceNo'];
    inPersonalId = json['InPersonalId'];
    stCustomerRelevantName = json['StCustomerRelevantName'];
    inServiceReceiverTypeId = json['InServiceReceiverTypeId'];
    dtDeclarationTime = json['DtDeclarationTime'];
    dtAppointmentTime = json['DtAppointmentTime'];
    inServiceTypeId = json['InServiceTypeId'];
    stTechnicianPersonalId = json['StTechnicianPersonalId'];
    inServiceTechnicianTypeId = json['InServiceTechnicianTypeId'];
    inServiceStateId = json['InServiceStateId'];
    stSubject = json['StSubject'];
    stExplain = json['StExplain'];
    stExtraColumn1 = json['StExtraColumn1'];
    stExtraColumn2 = json['StExtraColumn2'];
    stExtraColumn3 = json['StExtraColumn3'];
    stExtraColumn4 = json['StExtraColumn4'];
    stExtraColumn5 = json['StExtraColumn5'];
    stExtraColumn6 = json['StExtraColumn6'];
    stExtraColumn7 = json['StExtraColumn7'];
    stExtraColumn8 = json['StExtraColumn8'];
    stExtraColumn9 = json['StExtraColumn9'];
    stExtraColumn10 = json['StExtraColumn10'];
    inExtraColumn1 = json['InExtraColumn1'];
    inExtraColumn2 = json['InExtraColumn2'];
    inExtraColumn3 = json['InExtraColumn3'];
    inExtraColumn4 = json['InExtraColumn4'];
    inExtraColumn5 = json['InExtraColumn5'];
    flExtraColumn1 = json['FlExtraColumn1'];
    flExtraColumn2 = json['FlExtraColumn2'];
    flExtraColumn3 = json['FlExtraColumn3'];
    flExtraColumn4 = json['FlExtraColumn4'];
    flExtraColumn5 = json['FlExtraColumn5'];
    boExtraColumn1 = json['BoExtraColumn1'];
    boExtraColumn2 = json['BoExtraColumn2'];
    boExtraColumn3 = json['BoExtraColumn3'];
    boExtraColumn4 = json['BoExtraColumn4'];
    boExtraColumn5 = json['BoExtraColumn5'];
    inRecorderId = json['InRecorderId'];
    flMoneyRate2 = json['FlMoneyRate2'];
    flMoneyRate3 = json['FlMoneyRate3'];
    flMoneyRate4 = json['FlMoneyRate4'];
    flMoneyRate5 = json['FlMoneyRate5'];
    flServiceTotalTax = json['FlServiceTotalTax'];
    flServiceTotalWithoutTax = json['FlServiceTotalWithoutTax'];
    flDiscountPrice = json['FlDiscountPrice'];
    flServiceTotalTaxMoney1 = json['FlServiceTotalTaxMoney1'];
    flServiceTotalWithoutTaxMoney1 = json['FlServiceTotalWithoutTaxMoney1'];
    flServiceTotalTaxMoney2 = json['FlServiceTotalTaxMoney2'];
    flServiceTotalWithoutTaxMoney2 = json['FlServiceTotalWithoutTaxMoney2'];
    flServiceTotalTaxMoney3 = json['FlServiceTotalTaxMoney3'];
    flServiceTotalWithoutTaxMoney3 = json['FlServiceTotalWithoutTaxMoney3'];
    flServiceTotalTaxMoney4 = json['FlServiceTotalTaxMoney4'];
    flServiceTotalWithoutTaxMoney4 = json['FlServiceTotalWithoutTaxMoney4'];
    flServiceTotalTaxMoney5 = json['FlServiceTotalTaxMoney5'];
    flServiceTotalWithoutTaxMoney5 = json['FlServiceTotalWithoutTaxMoney5'];
    flGlobalDiscountRate1 = json['FlGlobalDiscountRate1'];
    inGlobalDiscountType1 = json['InGlobalDiscountType1'];
    flGlobalDiscountRate2 = json['FlGlobalDiscountRate2'];
    inGlobalDiscountType2 = json['InGlobalDiscountType2'];
    stColumnVisible = json['StColumnVisible'];
    inServiceCurrencyOrderNo = json['InServiceCurrencyOrderNo'];
    dtStartDate = json['DtStartDate'];
    dtEndDate = json['DtEndDate'];
    inApproverPersonalId = json['InApproverPersonalId'];
    stAccessory = json['StAccessory'];
    stReceivingState = json['StReceivingState'];
    inServiceYear = json['InServiceYear'];
    inServiceNoYear = json['InServiceNoYear'];
    inServiceNoCustomer = json['InServiceNoCustomer'];
    inServiceNoCustomerYear = json['InServiceNoCustomerYear'];
    inServiceNoRelevant = json['InServiceNoRelevant'];
    inServiceNoRelevantYear = json['InServiceNoRelevantYear'];
    inServiceNoRelevantCustomer = json['InServiceNoRelevantCustomer'];
    inServiceNoRelevantCustomerYear = json['InServiceNoRelevantCustomerYear'];
    stTechnicianName = json['StTechnicianName'];
    stApproverPersonalName = json['StApproverPersonalName'];
    dtRecord = json['DtRecord'];
    inUpdaterId = json['InUpdaterId'];
    dtUpdate = json['DtUpdate'];
    inUserGroupId = json['InUserGroupId'];
    boHasTask = json['BoHasTask'];
    flBuyPriceTotal = json['FlBuyPriceTotal'];
    flProfitTotal = json['FlProfitTotal'];
    flEstimatedTime = json['FlEstimatedTime'];
    flBuyPriceTotalMoney1 = json['FlBuyPriceTotalMoney1'];
    flBuyPriceTotalMoney2 = json['FlBuyPriceTotalMoney2'];
    flBuyPriceTotalMoney3 = json['FlBuyPriceTotalMoney3'];
    flBuyPriceTotalMoney4 = json['FlBuyPriceTotalMoney4'];
    flBuyPriceTotalMoney5 = json['FlBuyPriceTotalMoney5'];
    flProfitTotalMoney1 = json['FlProfitTotalMoney1'];
    flProfitTotalMoney2 = json['FlProfitTotalMoney2'];
    flProfitTotalMoney3 = json['FlProfitTotalMoney3'];
    flProfitTotalMoney4 = json['FlProfitTotalMoney4'];
    flProfitTotalMoney5 = json['FlProfitTotalMoney5'];
    inSeconds = json['InSeconds'];
    dtReadingDate = json['DtReadingDate'];
    inServiceProcessingTime = json['InServiceProcessingTime'];
    inServiceDurationOfIntervention = json['InServiceDurationOfIntervention'];
    inRevisionNo = json['InRevisionNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['InServiceId'] = this.inServiceId;
    data['InCustomerId'] = this.inCustomerId;
    data['StServiceNo'] = this.stServiceNo;
    data['InPersonalId'] = this.inPersonalId;
    data['StCustomerRelevantName'] = this.stCustomerRelevantName;
    data['InServiceReceiverTypeId'] = this.inServiceReceiverTypeId;
    data['DtDeclarationTime'] = this.dtDeclarationTime;
    data['DtAppointmentTime'] = this.dtAppointmentTime;
    data['InServiceTypeId'] = this.inServiceTypeId;
    data['StTechnicianPersonalId'] = this.stTechnicianPersonalId;
    data['InServiceTechnicianTypeId'] = this.inServiceTechnicianTypeId;
    data['InServiceStateId'] = this.inServiceStateId;
    data['StSubject'] = this.stSubject;
    data['StExplain'] = this.stExplain;
    data['StExtraColumn1'] = this.stExtraColumn1;
    data['StExtraColumn2'] = this.stExtraColumn2;
    data['StExtraColumn3'] = this.stExtraColumn3;
    data['StExtraColumn4'] = this.stExtraColumn4;
    data['StExtraColumn5'] = this.stExtraColumn5;
    data['StExtraColumn6'] = this.stExtraColumn6;
    data['StExtraColumn7'] = this.stExtraColumn7;
    data['StExtraColumn8'] = this.stExtraColumn8;
    data['StExtraColumn9'] = this.stExtraColumn9;
    data['StExtraColumn10'] = this.stExtraColumn10;
    data['InExtraColumn1'] = this.inExtraColumn1;
    data['InExtraColumn2'] = this.inExtraColumn2;
    data['InExtraColumn3'] = this.inExtraColumn3;
    data['InExtraColumn4'] = this.inExtraColumn4;
    data['InExtraColumn5'] = this.inExtraColumn5;
    data['FlExtraColumn1'] = this.flExtraColumn1;
    data['FlExtraColumn2'] = this.flExtraColumn2;
    data['FlExtraColumn3'] = this.flExtraColumn3;
    data['FlExtraColumn4'] = this.flExtraColumn4;
    data['FlExtraColumn5'] = this.flExtraColumn5;
    data['BoExtraColumn1'] = this.boExtraColumn1;
    data['BoExtraColumn2'] = this.boExtraColumn2;
    data['BoExtraColumn3'] = this.boExtraColumn3;
    data['BoExtraColumn4'] = this.boExtraColumn4;
    data['BoExtraColumn5'] = this.boExtraColumn5;
    data['InRecorderId'] = this.inRecorderId;
    data['FlMoneyRate2'] = this.flMoneyRate2;
    data['FlMoneyRate3'] = this.flMoneyRate3;
    data['FlMoneyRate4'] = this.flMoneyRate4;
    data['FlMoneyRate5'] = this.flMoneyRate5;
    data['FlServiceTotalTax'] = this.flServiceTotalTax;
    data['FlServiceTotalWithoutTax'] = this.flServiceTotalWithoutTax;
    data['FlDiscountPrice'] = this.flDiscountPrice;
    data['FlServiceTotalTaxMoney1'] = this.flServiceTotalTaxMoney1;
    data['FlServiceTotalWithoutTaxMoney1'] =
        this.flServiceTotalWithoutTaxMoney1;
    data['FlServiceTotalTaxMoney2'] = this.flServiceTotalTaxMoney2;
    data['FlServiceTotalWithoutTaxMoney2'] =
        this.flServiceTotalWithoutTaxMoney2;
    data['FlServiceTotalTaxMoney3'] = this.flServiceTotalTaxMoney3;
    data['FlServiceTotalWithoutTaxMoney3'] =
        this.flServiceTotalWithoutTaxMoney3;
    data['FlServiceTotalTaxMoney4'] = this.flServiceTotalTaxMoney4;
    data['FlServiceTotalWithoutTaxMoney4'] =
        this.flServiceTotalWithoutTaxMoney4;
    data['FlServiceTotalTaxMoney5'] = this.flServiceTotalTaxMoney5;
    data['FlServiceTotalWithoutTaxMoney5'] =
        this.flServiceTotalWithoutTaxMoney5;
    data['FlGlobalDiscountRate1'] = this.flGlobalDiscountRate1;
    data['InGlobalDiscountType1'] = this.inGlobalDiscountType1;
    data['FlGlobalDiscountRate2'] = this.flGlobalDiscountRate2;
    data['InGlobalDiscountType2'] = this.inGlobalDiscountType2;
    data['StColumnVisible'] = this.stColumnVisible;
    data['InServiceCurrencyOrderNo'] = this.inServiceCurrencyOrderNo;
    data['DtStartDate'] = this.dtStartDate;
    data['DtEndDate'] = this.dtEndDate;
    data['InApproverPersonalId'] = this.inApproverPersonalId;
    data['StAccessory'] = this.stAccessory;
    data['StReceivingState'] = this.stReceivingState;
    data['InServiceYear'] = this.inServiceYear;
    data['InServiceNoYear'] = this.inServiceNoYear;
    data['InServiceNoCustomer'] = this.inServiceNoCustomer;
    data['InServiceNoCustomerYear'] = this.inServiceNoCustomerYear;
    data['InServiceNoRelevant'] = this.inServiceNoRelevant;
    data['InServiceNoRelevantYear'] = this.inServiceNoRelevantYear;
    data['InServiceNoRelevantCustomer'] = this.inServiceNoRelevantCustomer;
    data['InServiceNoRelevantCustomerYear'] =
        this.inServiceNoRelevantCustomerYear;
    data['StTechnicianName'] = this.stTechnicianName;
    data['StApproverPersonalName'] = this.stApproverPersonalName;
    data['DtRecord'] = this.dtRecord;
    data['InUpdaterId'] = this.inUpdaterId;
    data['DtUpdate'] = this.dtUpdate;
    data['InUserGroupId'] = this.inUserGroupId;
    data['BoHasTask'] = this.boHasTask;
    data['FlBuyPriceTotal'] = this.flBuyPriceTotal;
    data['FlProfitTotal'] = this.flProfitTotal;
    data['FlEstimatedTime'] = this.flEstimatedTime;
    data['FlBuyPriceTotalMoney1'] = this.flBuyPriceTotalMoney1;
    data['FlBuyPriceTotalMoney2'] = this.flBuyPriceTotalMoney2;
    data['FlBuyPriceTotalMoney3'] = this.flBuyPriceTotalMoney3;
    data['FlBuyPriceTotalMoney4'] = this.flBuyPriceTotalMoney4;
    data['FlBuyPriceTotalMoney5'] = this.flBuyPriceTotalMoney5;
    data['FlProfitTotalMoney1'] = this.flProfitTotalMoney1;
    data['FlProfitTotalMoney2'] = this.flProfitTotalMoney2;
    data['FlProfitTotalMoney3'] = this.flProfitTotalMoney3;
    data['FlProfitTotalMoney4'] = this.flProfitTotalMoney4;
    data['FlProfitTotalMoney5'] = this.flProfitTotalMoney5;
    data['InSeconds'] = this.inSeconds;
    data['DtReadingDate'] = this.dtReadingDate;
    data['InServiceProcessingTime'] = this.inServiceProcessingTime;
    data['InServiceDurationOfIntervention'] =
        this.inServiceDurationOfIntervention;
    data['InRevisionNo'] = this.inRevisionNo;
    return data;
  }
}
