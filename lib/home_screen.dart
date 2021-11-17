import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/settings_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final Color _backgroundColor = const Color(0xfff2f2f2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              elevation: 0.0,
              expandedHeight: 300,
              backgroundColor: _backgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                centerTitle: true,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Container(),
                    ),
                    const Flexible(
                      flex: 2,
                      child: Text(
                        'Настройки Samsung',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 26),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.search_outlined,
                        color: Colors.black87,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            )
          ];
        },
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is SettingsListResponse) {
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
                                .map((element) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 30.00,
                                              height: 30.00,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                      AssetImage(element.icon),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    element.title,
                                                    style: const TextStyle(
                                                        fontSize: 18),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Flexible(
                                                    child: Text(
                                                      element.subtitle,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
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
