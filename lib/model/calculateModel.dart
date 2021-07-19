import 'package:age/age.dart';
import 'nextDayBirthdayModel.dart';
import 'theAgeModel.dart';
// كلاس يقوم بحساب العمر و متبقى العمر
class Calculate{
  TheAge _theAge  =TheAge();
  NextBirthdayModel _nextDayBirthdayModel= NextBirthdayModel();
// مثيد تقوم بحساب العمر و تسند القيم الي متغرات و تقوم بإرجع نوعها

  TheAge ageCalculate(DateTime birthDay , DateTime today){
    AgeDuration age;
    age = Age.dateDifference(
        fromDate:birthDay, toDate: today, includeToDate: false);
    _theAge.ages = age.years;
    _theAge.months = age.months;
    _theAge.days = age.days;
    return _theAge;
  }

// مثيد تقوم بحساب تبقى عمرك وبعد بحساب العمر و تسند القيم الي متغرات و تقوم بإرجع نوعها
  NextBirthdayModel calculateNextBirthday(DateTime birthDay , DateTime today){
// تاخذ برميتيات من نوع DateTime بعد ادخل المستخدم لها
    DateTime tempDate = DateTime(today.year, birthDay.month, birthDay.day);
    DateTime nextBirthdayDate = tempDate.isBefore(today)
        ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
        : tempDate;
    AgeDuration nextBirthdayDuration =
    Age.dateDifference(fromDate: today, toDate: nextBirthdayDate);
    // مكان الاسناد القيم
    _nextDayBirthdayModel.months = nextBirthdayDuration.months;
    _nextDayBirthdayModel.days = nextBirthdayDuration.days;

    return _nextDayBirthdayModel ;
  }
}