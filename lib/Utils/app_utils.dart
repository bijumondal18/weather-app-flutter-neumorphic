import 'package:intl/intl.dart';

class AppUtils {
  const AppUtils();

  static String getDayByDate(String givenDate) {
    var inputDate = DateTime.parse(givenDate);
    var outputFormat = DateFormat("yyyy-mm-dd");
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
