part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsListState extends SettingsState {
  final Map<String, List<SettingItem>>  settingsList;
  SettingsListState(this.settingsList);
}
