import '../../../../../index.dart';

abstract class SearchGstRepository {
  Future<GstModel> searchGst(String gstNumber);
}

class FakeSearchGstReposiotory extends SearchGstRepository {
  @override
  Future<GstModel> searchGst(String gstNumber) async {
    var res = await ApiFunc.getApi(gstNumber);
    var gstModel = GstModel.fromJson(jsonDecode(res));
    return gstModel;
  }
}
