/*
*  كلاس يحمل مثود تحوليك الي الجهات التالية
*  الإتصال باستخدام (tel: رقم الجوال)
 الإميل *  mailto: إيميل
* الارسائل   باستخدام (sms: رقم الجوال)
* */
import 'package:url_launcher/url_launcher.dart';
class Launch{
   launchURL(String url) async =>
      await canLaunch('$url') ? await launch('$url') : throw 'Could not launch $url';
}

