import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/bloc/search_bloc.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_application_1/widgets/settings_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.search_outlined,
        color: Colors.black87,
      ),
      onPressed: () => showSearch(
          context: context,
          delegate: Search(searchBloc: BlocProvider.of(context))),
    );
  }
}

////
//////
//////
////
class Search extends SearchDelegate<List> {
  late SearchBloc searchBloc;
  Search({required this.searchBloc});

  ///
  

  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchListState) {
          final result = state.settingsList.entries
              .where((s) => s.value.any((element) =>
                  element.title.toLowerCase().contains(query.toLowerCase()) ||
                  element.subtitle.toLowerCase().contains(query.toLowerCase())))
              .toList();

          return Container(
              child: ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, int i) =>
                ListTile(title: Text(result[i].value.first.title)),
          ));
        }
        return CircularProgressIndicator();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchListState) {
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
                                    onTap: () {},
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SettingsContent(
                                          element: element,
                                        )),
                                  ),
                                )
                                .toList()),
                      ),
                    )
                    .toList()),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
