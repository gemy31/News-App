import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../myTheme_data.dart';

class Category {
  String id;

  Color backgroundColor;

  String imagePath;

  String name;

  BuildContext context;

  Category(
      {required this.id,
      required this.name,
      required this.backgroundColor,
      required this.imagePath,
      required this.context});

//business  entertainment  general  health  science   sports   technology
  static List<Category> getCategory(BuildContext context) {
    return [
      Category(
          id: 'sports',
          name: AppLocalizations.of(context)!.sports,
          backgroundColor: MyThemeData.yellowColor,
          imagePath: 'assets/images/ball.png',
          context: context),
      Category(
          id: 'business',
          name: AppLocalizations.of(context)!.business,
          backgroundColor: MyThemeData.blueColor,
          imagePath: 'assets/images/bussines.png',
          context: context),
      Category(
          id: 'health',
          name: AppLocalizations.of(context)!.health,
          backgroundColor: MyThemeData.pinkColor,
          imagePath: 'assets/images/health.png',
          context: context),
      Category(
          id: 'technology',
          name: AppLocalizations.of(context)!.technology,
          backgroundColor: MyThemeData.redColor,
          imagePath: 'assets/images/Politics.png',
          context: context),
      Category(
          id: 'entertainment',
          name: AppLocalizations.of(context)!.entertainment,
          backgroundColor: MyThemeData.greyColor,
          imagePath: 'assets/images/environment.png',
          context: context),
      Category(
          id: 'science',
          name: AppLocalizations.of(context)!.science,
          backgroundColor: MyThemeData.blackColor,
          imagePath: 'assets/images/science.png',
          context: context),
      Category(
          id: 'general',
          name: AppLocalizations.of(context)!.general,
          backgroundColor: MyThemeData.darkBlueColor,
          imagePath: 'assets/images/bussines.png',
          context: context),
    ];
  }
}
