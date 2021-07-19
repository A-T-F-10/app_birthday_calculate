/*
* كلاس الإعدادات يحتوى على معلومات المستخدم و اللغة و النمط و حول التطبيق و التواصل
*
* */


import 'package:birthday_calcullate/model/themeModel.dart';
import 'package:birthday_calcullate/model/urlLaunchurl.dart';
import 'package:birthday_calcullate/content/factory_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';
import 'user.dart';

class Sitting extends StatefulWidget {

  @override
  _SittingState createState() => _SittingState();
}

class _SittingState extends State<Sitting> {


  double size20 =20;
  var theme ;
  bool chak=false;


// اوبجيك لجلب مثود الوصول للكل من جهة الاتصال و الإميال و الرسائل

  var launcher = Launch();
var switchBool = Factory();
  // متغير لجلب اسم المستخدم
  var userName = UserState.controller.text;
  TextStyle style =TextStyle(fontWeight: FontWeight.bold,fontSize: 18);

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeChanger>(context);
    this.theme=theme;
// مجموعة  متغيرات من المثودات
    var userHeader = _buildHeaderUser();
    var buttonLanguage =
    _buildListSettingsLang("اللغة", Icon(Icons.language));
    var line = _buildUnderline();
    var buttonTheme = _buildListSettings( "وضع الليلي", Icon(Icons.color_lens_outlined));
    var aboutApp = buildAboutApp();
    var rowIcons =_buildRowIcons();



    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              userHeader,
              buttonLanguage,
              line,
              buttonTheme,
              line,
             aboutApp,
              rowIcons,
            ],
          ),
        ),
      ),
    );
  }



  // -----------_buildHeaderUser-----------------
  Widget _buildHeaderUser() {
    return DrawerHeader(
      decoration: BoxDecoration(color:Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(size20),
              bottomLeft:  Radius.circular(size20))),

          child: Container(child:Column(
             children: [
             Container(height: 70,width: 80,child: CircleAvatar(child: Icon(Icons.person),)),
               SizedBox(height: 5,),
               Text(userName,style: style,),
              Text( "العمر الحالي : ${HomePageState.theAge.ages}",style: style,)
             ],
          ),),

      // accountName:,
      // currentAccountPicture: CircleAvatar(
      //   child: Icon(Icons.person),)

    );
  }


// -----------_buildListSettings--------------------
  Widget _buildListSettings(String text, Icon icon) {
   if(theme.getTheme()==Factory.darkTheme()){
       setState(() {
         chak = true;
      });

    }
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),),
          leading: icon,
          trailing: Switch(
            value: chak,
            onChanged: (h){
              // print(h);
              setState(() {
                if(chak==true){
                  theme.setTheme(Factory.lightTheme());
                }
                if(chak==false){
                  theme.setTheme(Factory.darkTheme());
                }
                 chak = h;
                // chak=!chak;
              });
          },
          ),
        ),
      ],
    );
  }

// -------------------_buildListSettingsLang---------------------
  Widget _buildListSettingsLang(String text, Icon icon) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: icon,
        ),
      ],
    );
  }

  //------------_buildUnderline--------------------
  Widget _buildUnderline() {
    return Divider(
      color: Colors.grey,
      indent: 50,
    );
  }

//---------------_buildRowIcons------------------
  Widget _buildRowIcons() {
    return Container(
      height:100 ,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconCall(),
          _buildIconSms(),
          _buildIconEmail(),
        ],
      ),
    );
  }

//----------------_buildIconCall-------------------
  Widget _buildIconCall() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.phone),
        onPressed: () {
          launcher.launchURL('tel: 054347665');
        },
      ),
    );
  }

  //---------_buildIconSms-----------------
  Widget _buildIconSms() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.sms_outlined),
        onPressed: () {
          launcher.launchURL('sms: 054347665');
        },
      ),
    );
  }

  //------------_buildIconEmail------------------
  Widget _buildIconEmail() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.email),
        onPressed: () {
          launcher.launchURL(
              'mailto:Rrooro@gmail.comorg?subject=News&body=New%20plugin');
        },
      ),
    );
  }


  //------------buildAboutApp------------------
  Widget buildAboutApp() {
    return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 210,
    child: ExpansionTile(
      title: Text(
        'حول',
        style: style,
      ),
      leading: Icon(Icons.info_outline),
      children: [
        Container(
    child: Text(
      'معلونات حول  التطبيق ',
      style: style,
    ),
        ),
        SingleChildScrollView(
          child: Text(
        'تستخدم في علم اللغويات للإشارة إلى أي فقرة مكتوبة أو منطوقة مع الرغم ذلك أنها طويلة أو قصيرة والشرط في هذا الصدد أنها تكون وحدة متكاملة.ونحو النص: هو مصطلح من المصطلحات التي قررت لنفسها هدفاً واحداً وهو الوصف والدراسة اللغوية للأبنية النصية، وكذلك هو تحليل المظاهر المتنوعة لجميع أشكال التواصل'),
        )
      ],
    ),
        );
  }

}
