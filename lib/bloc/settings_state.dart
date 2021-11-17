part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsListResponse extends SettingsState {
  final Map<String, List<SettingItem>>  settingsList;
  SettingsListResponse(this.settingsList);
}
