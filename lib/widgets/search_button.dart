import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.search_outlined,
        color: Colors.black87,
      ),
      onPressed: () => showSearch(context: context, delegate: Search()),
    );
  }
}

////
///
//
class Search extends SearchDelegate<String> {
    

  @override
  String get searchFieldLabel => 'Поиск';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    final result =
  SettingsList.elements.where((s) => s['title'].toString().toLowerCase().contains(query.toLowerCase())).toList();

   

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, i) => ListTile(
        leading: SizedBox(
          height: 30,
          width: 30,
          child: Image.asset(
            result[i]['icon'].toString(),
          ),
        ),
        title: Text(result[i]['title'].toString()),
        subtitle: Text(result[i]['subtitle'].toString()),
        onTap: () {
          print(i);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: SettingsList.elements.length,
      itemBuilder: (context, i) => ListTile(
        leading: SizedBox(
          height: 30,
          width: 30,
          child: Image.asset(
            SettingsList.elements[i]['icon'].toString(),
          ),
        ),
        title: Text(SettingsList.elements[i]['title'].toString()),
        subtitle: Text(SettingsList.elements[i]['subtitle'].toString()),
        onTap: () {
          print(i);
        },
      ),
    );
  }
}
