import 'package:intl/intl.dart';

class MyDateUtils{
  static String formatNewsDate(String inputDateString){
    var inputDateFormatter=DateFormat('yyy-MM-ddThh:mm:ssZ');
    var outputDateFormatter=DateFormat('yyy/MMM/dd hh:mm a');
    var inputDate=inputDateFormatter.parse(inputDateString);
    var outputDateString=outputDateFormatter.format(inputDate);
    return outputDateString;
  }
}