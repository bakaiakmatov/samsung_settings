import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/settings_bloc.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/search_button.dart';
import 'package:flutter_application_1/widgets/settings_content.dart';
import 'package:flutter_application_1/widgets/sliver_bar_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              elevation: 0.0,
              expandedHeight: 300,
              backgroundColor: ColorsApp.backgroundColor,
              flexibleSpace: const FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                centerTitle: true,
                title: SliverBarComponent(),
              ),
              actions: [
             const   SearchButton(),
              ],
            ),
          ];
        },
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is SettingsListState) {
              return SingleChildScrollView(
                child: Column(
                  children: state.settingsList.entries
                      .map(
                        (e) => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: e.value
                                .map(
                                  (element) => GestureDetector(
                                    onTap: () {
                                      debugPrint(element.title);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SettingsContent(element: element),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            }

            return const CircularProgressIndicator.adaptive();
          },
        ),
      ),
    );
  }
}
