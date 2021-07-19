/*
* هذا الكلاس تقوم بي فورمات
* لي DateTime الخاصة بنا و يحملها الي String
* */
class ReFormatDate{
 static String reFormat(DateTime dateTime){
    return "${dateTime.day } / ${dateTime.month} / ${dateTime.year}";
  }
}