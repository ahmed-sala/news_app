

import 'package:flutter/material.dart';
import 'package:news_app_v2/Model/NewsResponse.dart';
import 'package:news_app_v2/repository/data_source/api_response.dart';
import 'package:news_app_v2/view_model/news_viewModel.dart';
import 'package:news_app_v2/views/news/search/News_Widget.dart';


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
          )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.clear,
          size: 30,
        ));
  }

  NewsViewModel newsViewModel = NewsViewModel(
     newsRepository: ApiResponse()
  );

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        builder: (buildContext, snapShot) {
          if (snapShot.hasError) {
            return Center(child: Text('${snapShot.error.toString()}'));
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapShot.data;
          if (data?.status == 'error') {
            return Center(child: Text('${data?.message}'));
          }
          var sources = data?.newsList;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return NewsWidget(sources![index]);
              },
              itemCount: data?.newsList?.length,
            ),
          );
        },
        future: newsViewModel.fetchAllNews(query: query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        'Suggestions',
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: const Color(0xFF303030)),
      ),
    );
  }
}