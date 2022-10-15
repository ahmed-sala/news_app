import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_v2/Model/NewsResponse.dart';
import 'package:news_app_v2/views/Constants/My_Date_Utils.dart';
import 'package:news_app_v2/views/news/news_details/news_details_screen.dart';


class NewsWidget extends StatelessWidget {
News news;
NewsWidget(this.news);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetailsScreen.routeName,arguments: news);
      },
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Image.network(news.urlToImage??"",height: 230,width: double.infinity,fit: BoxFit.cover,),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage??"",height: 320,width: double.infinity,fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(height: 10,),
            Text(news.author??"",style: TextStyle(
              color: Color(0xFF79828B),
              fontSize: 12
            ),),
            SizedBox(height: 10,),
            Text(news.title??"",style: TextStyle(
                color: Color(0xFF42505C),
                fontSize: 18,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 10,),
            Text(MyDateUtils.formatNewsDate(news.publishedAt??""),style: TextStyle(
                color: Color(0xFF79828B),
                fontSize: 12,
            ),textAlign: TextAlign.end,),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
