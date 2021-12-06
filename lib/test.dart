import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  TextEditingController textController = TextEditingController();
  var _settingsList = <SettingItem>[];
  late final SettingItem element;

  void _searchSettings() {
    final query = textController.text;
    if (query.isNotEmpty) {
    }
  }

  @override
  void initState() {
    textController.addListener(_searchSettings);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
      width: 410,
      color: Colors.grey,
      textController: textController,
      onSuffixTap: () {},
    );
  }
}
