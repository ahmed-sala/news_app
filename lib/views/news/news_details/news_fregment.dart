import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_v2/Model/SourcesResponse.dart';
import 'package:news_app_v2/repository/data_source/api_response.dart';
import 'package:news_app_v2/view_model/news_viewModel.dart';
import 'package:news_app_v2/views/categories/category_model.dart';
import 'package:news_app_v2/views/news/source/sources_tabs.dart';

// import 'package:news_app/home/sources_tabs.dart';

class NewsFragment extends StatelessWidget {

BuildCategory category;
NewsFragment(this.category);
NewsViewModel newsViewModel=NewsViewModel(newsRepository: ApiResponse());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<SourcesResponse>(
          future: newsViewModel.fetchNewSources(category.id!),
          // future: ApiManger.getNewsSource(category.id),
          builder: (buildContext, snapshot) {
            if (snapshot.hasError) {
              Center(child: Text('${snapshot.error.toString()}'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            var data = snapshot.data;
            if ('error' == data?.status) {
              return Center(child: Text('${data?.message}'));
            }
            var sources = data?.sources;
            return SourcesTab(sources!);
          },
        ),
      ],
    );
  }
}
