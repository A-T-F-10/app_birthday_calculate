import 'dart:ui';
import 'package:birthday_calcullate/content/reformat.dart';
import 'package:birthday_calcullate/model/app_bar_model.dart';
import 'package:birthday_calcullate/model/calculateModel.dart';
import 'package:birthday_calcullate/model/nextDayBirthdayModel.dart';
import 'package:birthday_calcullate/model/theAgeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  Calculate _calculate = Calculate();

  TextEditingController _controllerBirth = TextEditingController();
  TextEditingController _controllerToday = TextEditingController(text: ReFormatDate.reFormat(timeNowDate()));

  NextBirthdayModel _nextDayBirthdayModel = NextBirthdayModel();
  NextBirthdayModel _nextDayBirthdayModelClean = NextBirthdayModel();

  static TheAge theAge = TheAge();
  TheAge _theAgeClean = TheAge();

  AppBarAll appBar = AppBarAll();

  DateTime birthDayValue;
  DateTime toDayValue = timeNowDate();

  var widthSize = 120.0;
  var heightSize = 50.0;

  double size25 =25;
  String nothing = '';
  TextStyle textStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {

    Widget space = _buildSpace();
    Widget dateOfBirth = _buildSubTitle("تاريخ الميلاد");
    Widget textFiled1 = _buildTextFiled1();
    Widget deyOfBirth = _buildSubTitle("تاريخ اليوم");
    Widget textFiled2 = _buildTextFiled2();
    Widget rowButtons = _buildRowButtons();
    Widget ageBirth = _buildSubTitle("عمرك هو");
    Widget rowContainerDataFirst = _buildRowContainerData1();
    Widget nextAgeBirth = _buildSubTitle("متبقي يوم ميلادك القادم");
    Widget rowContainerDataSecond = _buildRowContainerData2();

    // ________homePageScaffold__________
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              space,
              dateOfBirth,
              textFiled1,
              space,
              deyOfBirth,
              textFiled2,
              space,
              rowButtons,
              ageBirth,
              rowContainerDataFirst,
              nextAgeBirth,
              rowContainerDataSecond,
            ],
          ),
        ),
      ),
    );
  }
// ___________buildSubTitle_________
  Widget _buildSubTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: size25, fontWeight: FontWeight.w900),
    );
  }
//___________space____________
  Widget _buildSpace() {

    return SizedBox(
      height: size25,
    );
  }

  // ________buildTextFiledBirthday________________
  Widget _buildTextFiled1() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _controllerBirth,
        textDirection: TextDirection.rtl,
        decoration: _buildInputDecoration(),
        onTap: () {
          showDatePicker(
                  context: context,
                  initialDate: timeNowDate(),
                  firstDate: DateTime(1940),
                  lastDate: timeNowDate())
              .then((value) {
            birthDayValue = value;
            setState(() {
              _controllerBirth.text = ReFormatDate.reFormat(value);
            });
          });
        },
        readOnly: true,
      ),
    );
  }

  // ________buildTextFiledToday________________
  Widget _buildTextFiled2() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _controllerToday,
        textDirection: TextDirection.rtl,
        decoration: _buildInputDecoration(),
        onTap: () {

          showDatePicker(
                  context: context,
                  initialDate: timeNowDate(),
                  firstDate: DateTime(1999),
                  lastDate: timeNowDate())
              .then((value) {
                if(value==null){
                  value=DateTime.now();
                }
            toDayValue = value;
            setState(() {
              _controllerToday.text = ReFormatDate.reFormat(value);
            });
          });
        },
        readOnly: true,
      ),
    );
  }

// ___________buildInputDecoration___________
  InputDecoration _buildInputDecoration() {
    return InputDecoration(focusColor: Theme.of(context).accentColor,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)),
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
      prefixIcon: Icon(Icons.date_range),
    );
  }

// _________buildRowButtons___________
  Widget _buildRowButtons() {
    var buttonStyle=ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            width: widthSize,
            height: heightSize,
            child: ElevatedButton(
              style:buttonStyle,
                onPressed: () {
                  try {
                    setState(() {
                      theAge =
                          _calculate.ageCalculate(birthDayValue, toDayValue);
                      _nextDayBirthdayModel = _calculate.calculateNextBirthday(
                          birthDayValue, toDayValue);
                    });
                  } catch (e) {
                    if (_controllerBirth.text == nothing )
                      _controllerBirth.text = "ادخل القيمة المطلوبة";
                  }
                },
                child: Text(
                  'احسب  ',
                  style: textStyle,
                ))),
        Container(
            height: heightSize,
            width: widthSize,
            child: ElevatedButton(
              style: buttonStyle,
                onPressed: () {
                  setState(() {
                    _nextDayBirthdayModel = _nextDayBirthdayModelClean;
                    theAge = _theAgeClean;
                    _controllerBirth.text = nothing;
                    birthDayValue=DateTime.now();
                    _controllerBirth.text = "ادخل القيمة المطلوبة";

                  });
                },
                child: Text(' مسح ', style: textStyle))),
      ],
    );
  }

  // ____________buildRowContainerDataTexts___________
  Widget _buildContainerData(String text1, String text2) {
    return Container(
        child: Column(
      children: [
        Container(
          child: Card(
            child: Center(
                child: Text(
              text1,
              style: textStyle,
            )),
            color: Theme.of(context).primaryColor,
          ),
          width: widthSize,
          height: heightSize,
        ),
        Container(
          child: Card(
            child: Center(child: Text(text2)),
          ),
          width: widthSize,
          height: heightSize,
        ),
      ],
    ));
  }

  // ____________buildRowContainerDataFirst___________
  Widget _buildRowContainerData1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildContainerData('العمر ', theAge.ages.toString()),
        _buildContainerData('الشهر ', theAge.months.toString()),
        _buildContainerData('اليوم ', theAge.days.toString()),
      ],
    );
  }

  // ____________buildRowContainerDataSecond___________
  Widget _buildRowContainerData2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildContainerData( _nextDayBirthdayModel.months.toString(),'عدد الأشهر  '),
        _buildContainerData( _nextDayBirthdayModel.days.toString(),'عدد الأيام '),
      ],
    );
  }

  // __________timeNowDate______________
  static DateTime timeNowDate() {
    var time = DateTime.now();
    return time;
  }

}
