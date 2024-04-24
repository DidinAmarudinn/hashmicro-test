import 'package:intl/intl.dart';

extension NullableDateTimeToString on String? {
  String toTimeFormat() {
    if (this == null) {
      return ''; // or any default value you want to return for null
    } else {
      DateTime? dateTime = DateTime.tryParse(this!);
      if (dateTime != null) {
        return DateFormat('MMM d, yyyy hh:mm a').format(dateTime);  // Example format: 12:00 PM
      } else {
        return ''; // or any default value you want to return for invalid date string
      }
    }
  }
}