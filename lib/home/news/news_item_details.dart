import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/NewsResponse.dart';
import '../../myTheme_data.dart';

class NewsItemDetails extends StatelessWidget {
  static const String routeName = 'newsDetails';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        title: Text(AppLocalizations.of(context)!.dailyNews),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    news.urlToImage ??
                        'data:image/jpeg;base64,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',
                    height: MediaQuery.of(context).size.height * .25,
                    fit: BoxFit.fill)),
            const SizedBox(
              height: 8,
            ),
            Text(
              news.author ?? '',
              style: TextStyle(color: MyThemeData.greyColor, fontSize: 14),
            ),
            Text(news.title ?? '',
                style: TextStyle(
                    color: MyThemeData.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text(
              news.publishedAt ?? '',
              style: TextStyle(color: MyThemeData.greyColor, fontSize: 14),
              textAlign: TextAlign.end,
            ),
            SizedBox(
              height: screenHeight * .05,
            ),
            Text(news.content ?? '',
                maxLines: 10,
                style: TextStyle(
                  color: MyThemeData.greyColor,
                  fontSize: 16,
                )),
            SizedBox(
              height: screenHeight * .05,
            ),
            TextButton(
                onPressed: () {
                  openUrl(news.url);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Full Article',
                      style: TextStyle(
                          color: MyThemeData.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: MyThemeData.blackColor,
                      size: 18,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void openUrl(String? url) async {
    if (url == null) {
      return;
    }
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
