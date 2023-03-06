import 'package:flutter/material.dart';
import 'package:news/home/category_details.dart';
import 'package:news/model/category.dart';
import 'package:news/myTheme_data.dart';

import '../api_manager.dart';
import '../category/category_fragment.dart';
import '../category/category_item.dart';
import '../model/NewsResponse.dart';
import '../settings/settings.dart';
import 'home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'news/news_item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyThemeData.whiteColor,
          image: const DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
          )),
      child: Scaffold(
        drawer: HomeDrawer(onSideItemMenu: onSideItemMenu),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text(AppLocalizations.of(context)!.dailyNews),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: NewsSearch());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ],
        ),
        body: selectedItemMenu == HomeDrawer.SETTING
            ? Settings()
            : selectedCategory == null
                ? CategoryFragment(onCategoryItemClicked: onCategoryItemClicked)
                : CategoryDetails(category: selectedCategory!),
      ),
    );
  }

  Category? selectedCategory = null;

  void onCategoryItemClicked(Category category) {
    selectedCategory = category;
    setState(() {});
  }

  var selectedItemMenu = HomeDrawer.CATEGORIES;

  void onSideItemMenu(int selectedItem) {
    selectedItemMenu = selectedItem;
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {});
  }
}

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(
          Icons.search,
          size: 30,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.clear),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(searchKeyword: query),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapShot.hasError) {
          return Column(
            children: [
              Text('SomeThing went wrong'),
              TextButton(
                onPressed: () {},
                child: const Text('Try again'),
              ),
            ],
          );
        } else if (snapShot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapShot.error.toString()),
              TextButton(
                onPressed: () {},
                child: const Text('Try again'),
              ),
            ],
          );
        } else {
          var newsList = snapShot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(
                news: newsList[index],
              );
            },
            itemCount: newsList.length,
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
        child: Text(
      'Suggestions',
      style: TextStyle(fontSize: 22),
    ));
  }
}
