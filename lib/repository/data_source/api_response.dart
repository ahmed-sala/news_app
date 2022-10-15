import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_v2/Model/NewsResponse.dart';
import 'package:news_app_v2/Model/SourcesResponse.dart';
import 'package:news_app_v2/repository/news_repository.dart';
import 'package:news_app_v2/views/Constants/constants.dart';


class ApiResponse implements NewsRepository{
  @override
  Future<NewsResponse> getNewsBySource({String? sourceId, String? query,int page=1})async {
    var uri=Uri.https(BASE_URL, 'v2/everything',{
      'apiKey':API_KEY,
      'sources':sourceId,
      'q':query,
      'page':page.toString()
    });
    var response= await http.get(uri);
    var json=jsonDecode(response.body);
    var newsResponce=NewsResponse.fromJson(json);
    return newsResponce;
  }

  @override
  Future<SourcesResponse> getNewsSource(String catId)async {
    var uri=Uri.https(BASE_URL, '/v2/top-headlines/sources',{
      'apiKey':API_KEY,
      'category':catId
    });
    var response= await http.get(uri);
    var responseBody =response.body;
    var json=jsonDecode(responseBody);
    var sourcesResponce=SourcesResponse.fromJson(json);
    if(response.statusCode==200){
      return sourcesResponce;
    }
    else{
      throw Exception(sourcesResponce.message);
    }
  }
  
}