import 'package:flutter/material.dart';
import 'package:news_app_v2/views/news/news_details/home_screen.dart';
import 'package:news_app_v2/views/news/news_details/news_details_screen.dart';

// import 'package:news_app/home/news_fregment.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        NewsDetailsScreen.routeName:(_)=>NewsDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
