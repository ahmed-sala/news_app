import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_v2/views/categories/category_model.dart';




class CategoryWidget extends StatelessWidget {
  BuildCategory cat;
  int index;
  CategoryWidget(this.cat,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(index%2==0?24:0),
          bottomRight: Radius.circular(index%2==0?0:24)
        ),
        color: cat.color
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/${cat.imageUrl}.png',height: 120,fit: BoxFit.fitHeight,),
            Text(cat.title!,style: TextStyle(
              color: Colors.white,
              fontSize: 22
            ),),
          ],
        ),
    );
  }
}
