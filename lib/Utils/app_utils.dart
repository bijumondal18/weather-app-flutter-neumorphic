import 'package:intl/intl.dart';

class AppUtils {
  const AppUtils();

  static String getTimeFromDateString(String givenDate) {
    var inputDate = DateTime.parse(givenDate);
    var outputFormat = DateFormat("hh:mm a");
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String getDateFromDateString(String givenDate) {
    var inputDate = DateTime.parse(givenDate);
    var outputFormat = DateFormat("dd MMM, yyyy");
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String getWeekdayFromDate(int index, String givenDate) {
    String weekday = '';
    if (index == 0) {
      weekday = 'Today';
    }
    if (index == 1) {
      weekday = 'Tomorrow';
    }else{
      var inputDate = DateTime.parse(givenDate);
      var outputFormat = DateFormat("EEEE");
      weekday = outputFormat.format(inputDate);
    }
    return weekday;
  }

  static String getAirQualityStatus(double value) {
    var status = '';

    if (value <= 50.0) {
      status = 'Good';
    } else if (value > 50.0 && value <= 100.0) {
      status = 'Satisfactory';
    } else if (value > 100.0 && value <= 300.0) {
      status = 'Poor';
    } else if (value > 300.0 && value <= 400.0) {
      status = 'Very Poor';
    } else {
      status = 'Severe ';
    }
    return status;
  }
}
