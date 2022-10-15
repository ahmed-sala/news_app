

import 'package:news_app_v2/Model/NewsResponse.dart';
import 'package:news_app_v2/Model/SourcesResponse.dart';
import 'package:news_app_v2/repository/news_repository.dart';

class NewsViewModel{
  NewsRepository? newsRepository;
  NewsViewModel({this.newsRepository});
  Future<SourcesResponse> fetchNewSources(String catId)async{
    var source =    await newsRepository!.getNewsSource(catId);
    return source;
  }
  Future<NewsResponse> fetchAllNews({String? sourceId,String? query,int page =1})async{
    var news =await newsRepository!.getNewsBySource(sourceId:sourceId,query: query,page: page );
    return news;
}
}