import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/home/category_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:news/providers/language_provider.dart';
import 'package:provider/provider.dart';


import 'home/home_screen.dart';
import 'home/news/news_item_details.dart';
import 'myTheme_data.dart';

void main(){
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppConfigProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget{
  late AppConfigProvider provider ;
  @override
  Widget build(BuildContext context) {
    provider= Provider.of<AppConfigProvider>(context);
   return MaterialApp(
     localizationsDelegates: AppLocalizations.localizationsDelegates,
     supportedLocales: AppLocalizations.supportedLocales,
     debugShowCheckedModeBanner: false,
     routes: {
       HomeScreen.routeName : (_) => HomeScreen(),
       NewsItemDetails.routeName :(_) => NewsItemDetails(),

     },
     initialRoute:HomeScreen.routeName ,

     theme: ThemeData(
       primaryColor: MyThemeData.primaryColor,
       appBarTheme: AppBarTheme(
         backgroundColor: MyThemeData.primaryColor,
       ),
       scaffoldBackgroundColor: Colors.white,

     ),
     locale: Locale(provider.lang),
   );
  }
}