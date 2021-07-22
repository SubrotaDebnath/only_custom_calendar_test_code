import 'package:date_util/date_util.dart';

import 'calendar.dart';

enum StartWeekDay {sunday, monday}

class CustomCalendar{
  var dateUtility = new DateUtil();
// number of days in month
  //[JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC]
  final List<int> _monthDays =
  [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
// check for leap year
//   bool _isLeapYear(int year){
//     if(year % 4 == 0){
//       if(year % 100 == 0){
//         if(year % 400 == 0) return true;
//         return false;
//       }
//       return true;
//     }
//     return false;
//   }

  bool _isLeapYear(int year){
    return dateUtility.leapYear(year);
  }

  /// get the month calendar
  /// month is between from 1-12 (1 for January and 12 for December)
  List<Calendar> getMonthCalendar(int month, int year,
      {StartWeekDay startWeekDay = StartWeekDay.sunday}){
    // validate
    if(year == null || month == null || month < 1 || month > 12)
      throw ArgumentError('Invalid year or month');
    List<Calendar> calendar = [];
    // get no. of days in the month
    // month-1 because _monthDays starts from index 0
    // and month starts from 1
    int totalDays = _monthDays[month - 1];
    // if this is a leap year and the month is february,
    // increment the total days by 1
    if(_isLeapYear(year) && month == DateTime.february) totalDays++;
    // get days for this month
    for(int i=0; i<totalDays; i++){
      calendar.add(
        Calendar(
          // i+1 because day starts from 1 in DateTime class
          date: DateTime(year, month, i+1),
          thisMonth: true,
        ),
      );
    }
    return calendar;
  }

}