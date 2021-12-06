import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/settings_bloc.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samsung Settings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => SettingsBloc()..add(FetchSettingList()),
        child: HomeScreen(),
      ),
    );
  }
}
