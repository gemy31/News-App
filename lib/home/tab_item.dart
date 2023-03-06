import 'package:flutter/material.dart';
import 'package:news/model/SourseResponse.dart';

import '../myTheme_data.dart';

class TabItem extends StatelessWidget {
  Source source;

  bool isSelected;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Theme.of(context).primaryColor),
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color:
                isSelected ? MyThemeData.whiteColor : MyThemeData.primaryColor),
      ),
    );
  }
}
