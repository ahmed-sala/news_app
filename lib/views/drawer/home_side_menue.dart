import 'package:flutter/material.dart';

class HomeSideMenu extends StatelessWidget {
  static const int settings=10;
  static const int category=20;
  Function onItemClickCalBack;
  HomeSideMenu(this.onItemClickCalBack);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(

          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 64 ),
          color: Theme.of(context).primaryColor,
          child: Text('News App',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),),
        ),
        InkWell(
          onTap: (){
            onItemClickCalBack(category);
          },
          child: Row(
            children: [
              ImageIcon(AssetImage('assets/images/ic_cat.png'),size: 48,),
              SizedBox(width: 20,),
              Text('Category',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF303030)
              ),),
            ],
          ),
        ),
        SizedBox(height: 20,),
        InkWell(
          onTap: (){
            onItemClickCalBack(settings);
          },
          child: Row(
            children: [
              ImageIcon(AssetImage('assets/images/ic_sett.png',),size: 48,),
              SizedBox(width: 20,),
              Text('Settings',style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF303030)
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
