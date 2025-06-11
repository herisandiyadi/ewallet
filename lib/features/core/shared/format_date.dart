import 'package:intl/intl.dart';

String formatUtcDate(String utcDateStr) {
  final dateTime = DateTime.parse(utcDateStr).toLocal();
  final formatter = DateFormat('yyyy-MM-dd HH:mm:ss'); // Atur sesuai kebutuhan
  return formatter.format(dateTime);
}
