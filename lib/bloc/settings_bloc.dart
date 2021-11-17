import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model.dart';
import 'package:meta/meta.dart';

import 'package:collection/collection.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<FetchSettingList>((event, emit) => emit.call(SettingsListResponse(
        settingList().groupListsBy((setting) => setting.group))));
  }
}
