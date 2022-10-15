
import 'package:news_app_v2/Model/NewsResponse.dart';
import 'package:news_app_v2/Model/SourcesResponse.dart';

abstract class NewsRepository{
  Future<SourcesResponse>getNewsSource(String catId);
  Future<NewsResponse> getNewsBySource({String? sourceId,String? query,int page=1});
}