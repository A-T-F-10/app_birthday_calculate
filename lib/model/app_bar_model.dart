
import 'package:birthday_calcullate/screens/user.dart';
import 'package:flutter/material.dart';
/* كلاس الاب بار  و اعطينه خاصية  Button  لعمل صفحتين */
class AppBarAll {
  double size16 =16;
  AppBar appBar(BuildContext context) {
    TextStyle _textStyle(double size)=>  TextStyle(fontWeight: FontWeight.bold,fontSize: size,);
    return AppBar(

      // مكان عمل الصفحتين
      elevation: 0,
      bottom: TabBar(indicatorWeight: 2,labelPadding: EdgeInsets.all(5)
        ,indicatorColor: Theme.of(context).primaryColor,
        tabs: [
          Text(" الرئيسية",style: _textStyle(size16),),
          Text("الإعدادت",style: _textStyle(size16)),


        ],),
      // جعل العنوان في المنتصف
      centerTitle: true,
      // العنوان
      title: Text("⚜️  حساب العمر ⚜️️ ",style: _textStyle(25),),
      actions: [
        Container(child: IconButton(icon:
         Icon(Icons.exit_to_app_outlined,color: Colors.white,),onPressed: (){
           
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => User())));
              UserState.controller.text='';
        }))

      ],

    );
  }


}


