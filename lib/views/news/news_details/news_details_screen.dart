import 'package:flutter/material.dart';
import 'package:news_app_v2/Model/NewsResponse.dart';
import 'package:news_app_v2/views/Constants/My_Date_Utils.dart';

import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'new';
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            title: Text('News Details'),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                child: Image.network(news.urlToImage ?? ""),
                borderRadius: BorderRadius.circular(30),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                news.source?.name ?? "",
                style: TextStyle(color: Color(0xFF79828B), fontSize: 10),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                news.title ?? "",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                MyDateUtils.formatNewsDate(news.publishedAt ?? ""),
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF79828B),
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      news.description ?? "",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    InkWell(
                      onTap: (){
                        _launchInBrowser(Uri.parse(news.url??""));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'View Full Article',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          ImageIcon(AssetImage('assets/images/back.png')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
