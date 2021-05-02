import '../../../../../index.dart';

class SearchBloc {
  //regexp
  String resExp = r'[a-z0-9]';

  //error text
  String errorText = '';

  //gst number
  var _gstin = BehaviorSubject<String>();

  //loading bool
  var _loadingBool = BehaviorSubject<bool>();

  //observable
  Observable<String> get gstinStream => _gstin.stream;

  //setter
  String get gstinString => _gstin.value;

  //setter
  set gstinStreamSet(String string) => _gstin.sink.add(string);

  //observable
  Observable<bool> get loadingBoolStream => _loadingBool.stream;

  //setter
  bool get loadingBoolValue => _loadingBool.value;

  //setter
  set loadingBool(bool data) => _loadingBool.sink.add(data);

  // serach Function
  Future<void> searchGstDetail({
    void Function() error,
    void Function() success,
  }) async {
    try {
      loadingBool = true;
      var res = await ApiFunc.getApi(gstinString);
      var gstModel = GstModel.fromJson(jsonDecode(res));

      print(gstModel.toJson());
      detailBloc.setDeailStream = gstModel;
      loadingBool = false;
      success();
    } on PlatformException catch (e) {
      loadingBool = false;
      errorText = e.message;
      error();
    } on HttpException catch (e) {
      loadingBool = false;
      errorText = e.message;
      error();
    } on TimeoutException catch (e) {
      loadingBool = false;
      errorText = e.message;
      error();
    } catch (e) {
      loadingBool = false;
      errorText = Strings.unknownException + e.toString();
      error();
    }
  }

//disposing the streams
  void dispose() async {
    await _gstin.drain();
    await _loadingBool.drain();
    await _gstin.close();
    await _loadingBool.close();
  }

  bool validateGstin() {
    if (searchBloc.gstinString == null) {
      errorText = Strings.pleaseEnterGstin;
      return false;
    } else if (searchBloc.gstinString.trim().isEmpty) {
      errorText = Strings.pleaseEnterGstin;
      return false;
    } else if (searchBloc.gstinString.length < 15) {
      errorText = Strings.invalidGstin;
      return false;
    } else {
      return true;
    }
  }
}

var searchBloc = SearchBloc();
