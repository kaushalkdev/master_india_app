part of 'search_cubit.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchAdding extends SearchState {
  final String gstin;
  const SearchAdding(this.gstin);
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchLoaded extends SearchState {
  final GstModel gstModel;
  const SearchLoaded(this.gstModel);
}

class SearchError extends SearchState {
  final String message;
  final int code;
  SearchError(this.message, this.code);
}
