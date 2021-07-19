/*
* كلاس الصفحات
* الصفحة الرئيسية
*  الإعدادات
* */

import 'dart:io';

import 'package:birthday_calcullate/model/app_bar_model.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'sitting_calculate.dart';

class HomeTaps extends StatefulWidget {

  @override
  _HomeTapsState createState() => _HomeTapsState();
}

class _HomeTapsState extends State<HomeTaps> {


  bool shouldPop= false;

  @override
  Widget build(BuildContext context) {

    AppBarAll appBar = AppBarAll();

    return WillPopScope(
      onWillPop: () async => showDialog(context:context,builder: (context)=>AlertDialog(
        title: Text('الخروج من التطبيق ؟'),
        content: Text('هل انت متأكد للخروج ؟'),
        actions: [
          ElevatedButton(onPressed: ()=> exit(0),child: Text("خروج"),),
          ElevatedButton(onPressed: ()=> Navigator.of(context).pop(false),child: Text("إلغاء"),),
        ],
      ) ),

      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          //  _____appBar____
          appBar: appBar.appBar(context),
          // ________pages______
          body: TabBarView(
            children: [
              HomePage(),
              Sitting(),
            ],
          ),
        ),
      ),
    );
  }
}
