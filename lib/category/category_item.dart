import 'package:flutter/material.dart';
import 'package:news/model/category.dart';

import '../myTheme_data.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: Radius.circular((index % 2 == 0) ? 20 : 0),
          bottomRight: (Radius.circular((index % 2 != 0) ? 20 : 0)),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: 100,
            fit: BoxFit.fill,
          ),
          const Spacer(),
          Text(
            category.name,
            style: TextStyle(
                color: MyThemeData.whiteColor,
                fontSize: 19,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
