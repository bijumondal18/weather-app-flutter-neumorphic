import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:starter_project/Commons/commons.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:geolocator_android/geolocator_android.dart';

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
    switch (index) {
      case 0:
        weekday = 'Today';
        break;
      case 1:
        weekday = 'Tomorrow';
        break;
      default:
        var inputDate = DateTime.parse(givenDate);
        var outputFormat = DateFormat("EEEE");
        weekday = outputFormat.format(inputDate);
    }
    return weekday;
  }

  static String getAirQualityStatus(dynamic value) {
    var status = '';

    if (value <= 35) {
      status = 'Low';
    } else if (value > 35 && value < 53) {
      status = 'Moderate';
    } else if (value > 53 && value <= 70) {
      status = 'High';
    } else {
      status = 'Very High';
    }
    return status;
  }

  static Color getAirQualityStatusColor(dynamic value) {
    late Color statusColor;

    if (value <= 35) {
      statusColor = AppColors.green;
    } else if (value > 35 && value < 53) {
      statusColor = AppColors.yellow;
    } else if (value > 53 && value <= 70) {
      statusColor = AppColors.orange;
    } else {
      statusColor = AppColors.red;
    }
    return statusColor;
  }

  static void registerPlatformInstance() {
    if (Platform.isAndroid) {
      GeolocatorAndroid.registerWith();
    } else if (Platform.isIOS) {
      GeolocatorApple.registerWith();
    }
  }

  static Future<String> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;
    late String latlng;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      latlng = 'Kolkata';
      return latlng;
      // return Future.error(
      //   'Location permissions are permanently denied, we cannot request permissions.');
    }

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    log('-------position : $position');
    latlng = '${position.latitude},${position.longitude}';
    log('-------latlng : $latlng');
    return latlng;
  }
}
