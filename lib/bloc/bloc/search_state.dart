part of 'search_bloc.dart';


@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchListState extends SearchState {
  final Map<String, List<SettingItem>>  settingsList;
  SearchListState(this.settingsList);
}
