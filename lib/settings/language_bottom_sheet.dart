import 'package:flutter/material.dart';
import 'package:news/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../myTheme_data.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.lang == 'en'
                ? selectedItem(AppLocalizations.of(context)!.english)
                : unSelectedItem(AppLocalizations.of(context)!.english),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.lang == 'ar'
                ? selectedItem(AppLocalizations.of(context)!.arabic)
                : unSelectedItem(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  selectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyThemeData.primaryColor),
        ),
        Icon(
          Icons.check,
          size: 30,
          color: MyThemeData.primaryColor,
        )
      ],
    );
  }

  unSelectedItem(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyThemeData.blackColor),
        ),
      ],
    );
  }
}
