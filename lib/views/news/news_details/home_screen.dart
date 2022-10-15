import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_v2/repository/data_source/api_response.dart';
import 'package:news_app_v2/view_model/news_viewModel.dart';
import 'package:news_app_v2/views/categories/category.dart';
import 'package:news_app_v2/views/categories/category_model.dart';
import 'package:news_app_v2/views/drawer/home_side_menue.dart';
import 'package:news_app_v2/views/news/news_details/news_fregment.dart';
import 'package:news_app_v2/views/news/search/search.dart';
import 'package:news_app_v2/views/settings/settings.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    NewsViewModel newsViewModel=NewsViewModel(
        newsRepository: ApiResponse()
    );
    return Container(
      decoration: BoxDecoration(
          color: Colors.white ,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/background.png',),
        )
      ),
      child: Scaffold(
        drawer: Drawer(
          child: HomeSideMenu(onSideMenuItemClick),
        ),
        backgroundColor: Colors.transparent,
        appBar:
        PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            title: Text('news app'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30)
              )
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    openPageSearch();
                    // showSearch(context: context, delegate: NewsSearchDelegate());
                  },
                  icon: Icon(Icons.search,size: 36,)),
              SizedBox(width: 15,),
            ],
          ),
        ),
        body: curentWidget==null?CategoryFragment(onCategoryClick):curentWidget,
      ),
    );
  }
  void initState(){
    super.initState();
    // curentWidget=CategoryFragment(onCategoryClick);
    curentWidget=null;
  }
   Widget? curentWidget;

  void onCategoryClick(BuildCategory category){
    curentWidget=NewsFragment(category);
    setState((){});
  }

  void onSideMenuItemClick(int type){
    if(type==HomeSideMenu.category){
      curentWidget=CategoryFragment(onCategoryClick);
    }
    else if (type==HomeSideMenu.settings){
      curentWidget=SettingsFragment();
    }
    curentWidget=null;
    setState((){});
    Navigator.pop(context);
  }
  void openPageSearch(){
    showSearch(context: context, delegate: NewsSearch());
  }
}
