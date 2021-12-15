import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/bloc/search_bloc.dart';
import 'package:flutter_application_1/bloc/settings_bloc/settings_bloc.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          
          create: (context) => SettingsBloc()
            ..add(
              FetchSettingList(),
            ),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc()
            ..add(
              SettingListEvent(),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Samsung Settings',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
