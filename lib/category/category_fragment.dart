import 'package:flutter/material.dart';

import '../model/category.dart';
import '../myTheme_data.dart';
import 'category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryFragment extends StatelessWidget {
  Function onCategoryItemClicked;

  CategoryFragment({required this.onCategoryItemClicked});

  @override
  Widget build(BuildContext context) {
    List<Category> categoryList = Category.getCategory(context);
    return Container(
      margin: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                AppLocalizations.of(context)!.pickYourCategoryOfInterest,
                style: TextStyle(
                  color: MyThemeData.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 9,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        onCategoryItemClicked(categoryList[index]);
                      },
                      child: CategoryItem(
                        category: categoryList[index],
                        index: index,
                      ));
                },
                itemCount: categoryList.length,
              )),
        ],
      ),
    );
  }
}
