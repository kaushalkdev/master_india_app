import '../../../../../index.dart';

class DetailBloc {
  var _gstDetail = BehaviorSubject<GstModel>();

  //observable
  Observable<GstModel> get gstDetailStream => _gstDetail.stream;

  set setDeailStream(GstModel gstModel) => _gstDetail.sink.add(gstModel);

  void dispose() async {
    await _gstDetail.close();
  }
}

var detailBloc = DetailBloc();
