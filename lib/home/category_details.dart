import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/home/tab_container.dart';
import 'package:news/model/SourseResponse.dart';

import '../model/category.dart';

class CategoryDetails extends StatelessWidget {
static String routeName ='category';
Category category ;
CategoryDetails({required this.category});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourseResponse>(
        future: ApiManager.getSource(categoryId:category.id ),
        builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else if (snapshot.hasError){
            return Column(
              children: [
                const Text("Something went wrong"),
                TextButton(onPressed: (){}, child: const Text("Try again"),),
              ],
            );
          }else if (snapshot.data?.status != 'ok'){
            return Column(
              children: [
                const Text("Something went wrong"),
                TextButton(onPressed: (){}, child: const Text("Try again"),),
              ],
            );
          }else {
          var sourceList = snapshot.data?.sources ?? [];
          return TabContainer(sources: sourceList ?? []);
          }
        },
    );
  }
}
