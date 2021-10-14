class Constants {
  static bool scheme = true;
  static String serverhost = "192.168.1.26:3004";
  static String loginPath = "/api/ServiceNew/Login";
  static String serviceListPath = "/api/ServiceNew/GetAllService";
  static String customerLocationUpdatepath =
      "/api/ServiceNew/UpdateCustomerLocation";
  static String formCustomerProduct =
      "/api/ServiceNew/FormCustomerProductLoader";
  static String updateservicepath = "/api/ServiceNew/UploadService";
  static String updateReadingPath = "/api/ServiceNew/SetServiceReadingDate";
  static String searchInServicePath = "/api/ServiceNew/GetAllSingleProductList";
  static String customerProductUpatePath =
      "/api/ServiceNew/SaveCustomerProduct";
  static String getServiceData = "/api/ServiceNew/GetAllService";

  static String getAllProductsList = "/api/ServiceNew/GetAllProductList";
  static String getProductListOnPersonnelWarehouse =
      "/api/ServiceNew/GetProductListOnPersonnelWarehouse";
  static String stockActivityList = "/api/Stock/GetStockAndStockActivitiyList";
  static String getAllUserStateList = "/api/ServiceNew/GetAllUserStateList";
  static String searchInCustomer = "/api/ServiceNew/GetCustomerList";
}
