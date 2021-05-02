import '../../index.dart';

//functions for api operations
class ApiFunc {
  //post request
  static Future postApi() {}

  // get request
  static Future<String> getApi(String gstin) async {
    await Future.delayed(Duration(seconds: 3));
    return await rootBundle.loadString(Assests.gstJson);
  }
}
