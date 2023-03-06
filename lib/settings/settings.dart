import 'package:flutter/material.dart';
import 'package:news/myTheme_data.dart';
import 'package:news/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'language_bottom_sheet.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(
                color: MyThemeData.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
          onTap: (){
            showBottom();
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: MyThemeData.primaryColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(provider.lang=='en'?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyThemeData.primaryColor
                ),),
                Icon(Icons.arrow_drop_down,size: 35,color: MyThemeData.primaryColor,)
              ],
            ),
          ),
        )
      ],
    );
  }

  void showBottom() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft:Radius.circular(12) )
      ),
        context: context,
        builder: (context){
          return LanguageBottomSheet();
        }
    );
  }
}
