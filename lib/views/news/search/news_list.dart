import 'package:flutter/material.dart';
import 'package:news_app_v2/Model/NewsResponse.dart';
import 'package:news_app_v2/Model/SourcesResponse.dart';
import 'package:news_app_v2/repository/data_source/api_response.dart';
import 'package:news_app_v2/view_model/news_viewModel.dart';
import 'package:news_app_v2/views/news/search/News_Widget.dart';

class NewsList extends StatelessWidget {
  Source source;
  NewsList(this.source);
  @override
  Widget build(BuildContext context) {
    NewsViewModel newsViewModel=NewsViewModel(
      newsRepository: ApiResponse()
    );
    return FutureBuilder<NewsResponse>(
      future:newsViewModel.fetchAllNews(sourceId:source.id??"") ,
      // future:ApiManger.getNewsBySource(sourceId:source.id??"") ,
      builder:(_,snapshot){

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
        return Expanded(
          child: ListView.builder(itemBuilder: (_,index){
            return NewsWidget((data?.newsList?[index])!);
          },itemCount: data?.newsList?.length??0,),
        ) ;
      },
    );
  }
}
