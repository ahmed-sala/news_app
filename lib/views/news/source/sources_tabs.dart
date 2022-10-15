import 'package:flutter/material.dart';
import 'package:news_app_v2/Model/SourcesResponse.dart';
import 'package:news_app_v2/views/news/search/news_list.dart';
import 'package:news_app_v2/views/news/source/source_tab.dart';

// import 'package:news_app/home/news_list.dart';
// import 'package:news_app/home/source_tab.dart';

class SourcesTab extends StatefulWidget {
  List<Source>sources;
  SourcesTab(this.sources);

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedTab=0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
          length: widget.sources.length,
          child: Expanded(
            child: Column(
              children: [
                TabBar(
                  onTap: (index){
                    setState((){
                      selectedTab=index;

                    });
                  },
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    tabs: widget.sources.map((source) {
                      var isSelected =widget.sources.indexOf(source)==selectedTab;
                  return SourceTab(source,isSelected);
                }).toList()),
                NewsList(widget.sources[selectedTab]),
              ],
            ),
          ),),
    );
  }
}
