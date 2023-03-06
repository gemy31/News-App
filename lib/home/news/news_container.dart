import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourseResponse.dart';

import 'news_item.dart';

class NewsContainer extends StatefulWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  int pageNumber = 1;

  var scrollController = ScrollController();
  bool shouldLoadNextPage = false;

  List<News> news = [];

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = (scrollController.position.pixels == 0);
        if (!isTop) {
          shouldLoadNextPage = true;
          setState(() {});
          super.initState();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Current news >>${news.length}');
    print('Current pagenumber >>$pageNumber');
    if (shouldLoadNextPage) {
      ApiManager.getNews(
              sourceId: widget.source.id ?? '', pageNumber: ++pageNumber)
          .then((newsResponse) {
        news.addAll(newsResponse.articles ?? []);
        shouldLoadNextPage = false;
        setState(() {});
      });
    }
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(sourceId: widget.source.id ?? ''),
      builder: (context, snapShot) {
        if (snapShot.hasError) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('SomeThing went wrong'),
              TextButton(
                onPressed: () {},
                child: const Text('Try again'),
              ),
            ],
          );
        } else if (snapShot.data?.status == 'error') {
          return Column(
            children: [
              Text(snapShot.error.toString()),
              TextButton(
                onPressed: () {},
                child: const Text('Try again'),
              ),
            ],
          );
        } else if (snapShot.hasData) {
          if (news.isEmpty) {
            news = snapShot.data?.articles ?? [];
          }
          if (snapShot.data?.articles![0].title != news[0].title) {
            scrollController.jumpTo(0);
            news = snapShot.data?.articles ?? [];
          }
          return ListView.builder(
            controller: scrollController,
            itemBuilder: (context, index) {
              print('$index');
              return NewsItem(
                news: news[index],
              );
            },
            itemCount: news.length,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
