import 'package:flutter/material.dart';
import 'package:news_app_v2/Model/SourcesResponse.dart';

class SourceTab extends StatelessWidget {
Source source;
bool selected;
SourceTab(this.source,this.selected);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
        color: selected? Theme.of(context).primaryColor:Colors.transparent,
        border: Border.all(color:Theme.of(context).primaryColor,width: 2 ),
        borderRadius: BorderRadius.circular(25),

      ),
      child: Text(source.name??"",
      style: TextStyle(
        color: selected?Colors.white:Theme.of(context).primaryColor
      ),),
    );
  }
}
