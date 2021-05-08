import '../../../../../index.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchGstRepository _repository;
  SearchCubit(this._repository) : super(SearchInitial());

  Future<void> onSearchData(String gstNumber) async {
    emit(SearchLoading());
    try {
      final gstModel = await _repository.searchGst(gstNumber);
      emit(SearchLoaded(gstModel));
    } on SocketException {
      emit(SearchError(Strings.noInternet, 101));
    } on HttpException {
      emit(SearchError(Strings.badRequest, 102));
    } catch (e) {
      emit(SearchError(Strings.unknownException, 103));
    }
  }

  void validateGstin(SearchAdding state) {
    if (state.gstin == null) {
      emit(SearchError(Strings.pleaseEnterGstin, 104));
      emit(SearchAdding(state.gstin));
    } else if (state.gstin.trim().isEmpty) {
      emit(SearchError(Strings.pleaseEnterGstin, 105));
      emit(SearchAdding(state.gstin));
    } else if (state.gstin.length < 15) {
      emit(SearchError(Strings.invalidGstin, 106));
      emit(SearchAdding(state.gstin));
    } else {
      onSearchData(state.gstin);
    }
  }

  void setGstin(String gstin) {
    emit(SearchAdding(gstin));
  }
}
