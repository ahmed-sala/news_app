import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_v2/views/categories/category_model.dart';
import 'package:news_app_v2/views/categories/category_widget.dart';


class CategoryFragment extends StatelessWidget {
Function onCategoryClickCallBack;
CategoryFragment(this.onCategoryClickCallBack);
var categories=BuildCategory.getAllCategoreies();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
          itemBuilder: (_,index){
            return InkWell(
              onTap: (){
                onCategoryClickCallBack(categories[index]);
              },
                child: CategoryWidget(categories[index], index));
          },itemCount: categories.length,),
    );
  }
}


