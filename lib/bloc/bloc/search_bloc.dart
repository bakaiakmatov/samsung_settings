import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/model.dart';
import 'package:meta/meta.dart';

import 'package:collection/collection.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SettingListEvent>((event, emit) => emit.call(SearchListState(
        settingList().groupListsBy((setting) => setting.group))));
  }
}
