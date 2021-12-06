import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';

class SettingsContent extends StatelessWidget {
  final SettingItem element;
  const SettingsContent({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 30.00,
            height: 30.00,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(element.icon),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  element.title,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 3),
                Flexible(
                  child: Text(
                    element.subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
