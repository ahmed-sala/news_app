
import 'package:news_app_v2/Model/NewsResponse.dart';
import 'package:news_app_v2/Model/SourcesResponse.dart';
import 'package:news_app_v2/repository/news_repository.dart';

class LocalData implements NewsRepository{
  @override
  Future<NewsResponse> getNewsBySource({String? sourceId, String? query,int page=1}) {
    // TODO: implement getNewsBySource
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getNewsSource(String catId) {
    // TODO: implement getNewsSource
    throw UnimplementedError();
  }
  
}