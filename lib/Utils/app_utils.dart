import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:starter_project/Commons/commons.dart';

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
    } else {
      var inputDate = DateTime.parse(givenDate);
      var outputFormat = DateFormat("EEEE");
      weekday = outputFormat.format(inputDate);
    }
    return weekday;
  }

  static String getAirQualityStatus(double value) {
    var status = '';

    if (value <= 19.0) {
      status = 'Excellent';
    } else if (value > 20.0 && value < 49.0) {
      status = 'Fair';
    } else if (value > 50.0 && value <= 99.0) {
      status = 'Poor';
    } else if (value > 100.0 && value <= 149.0) {
      status = 'Unhealthy';
    } else if (value > 150.0 && value <= 249.0) {
      status = 'Very Unhealthy';
    } else {
      status = 'Dangerous ';
    }
    return status;
  }

  static Color getAirQualityStatusColor(double value) {
    late Color statusColor;

    if (value <= 19.0) {
      statusColor = AppColors.green;
    } else if (value > 20.0 && value < 49.0) {
      statusColor = AppColors.yellow;
    } else if (value > 50.0 && value <= 99.0) {
      statusColor = AppColors.orange;
    } else if (value > 100.0 && value <= 149.0) {
      statusColor = AppColors.red;
    } else if (value > 150.0 && value <= 249.0) {
      statusColor = AppColors.pink;
    } else {
      statusColor = AppColors.purple;
    }
    return statusColor;
  }
}
