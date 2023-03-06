import 'package:flutter/material.dart';
import 'package:news/myTheme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  static const int SETTING = 1;
  static const int CATEGORIES = 2;
  Function onSideItemMenu ;
  HomeDrawer({required this.onSideItemMenu});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .25,
            width: double.infinity,
            decoration: BoxDecoration(color: MyThemeData.primaryColor),
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.12),
              child: Text(
                AppLocalizations.of(context)!.newsApp,
                style: TextStyle(
                    color: MyThemeData.whiteColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
               onSideItemMenu(HomeDrawer.CATEGORIES);
              },
              child: Row(
                children: [
                  const Icon(Icons.list),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    AppLocalizations.of(context)!.categories,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyThemeData.blackColor),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
               onSideItemMenu(HomeDrawer.SETTING);
              },
              child: Row(
                children: [
                  const Icon(Icons.settings),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    AppLocalizations.of(context)!.settings,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyThemeData.blackColor),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
