import 'package:intl/intl.dart';

class Formatter {
  static String toTimeFormatter(DateTime dateTime) {
    var format = DateFormat("hh.mm");
    return format.format(dateTime);
  }

  static String toShortDate(DateTime dateTime) {
    var format = DateFormat("dd MMM yyy");
    return format.format(dateTime);
  }
}
