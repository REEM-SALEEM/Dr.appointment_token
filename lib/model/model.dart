import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class AppointmentModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  final int token;

  @HiveField(2)
  final String? day;

  @HiveField(3)
  final String? date;

  @HiveField(4)
  final String? time;
  @HiveField(5)
  String? docname;

  AppointmentModel(
      {required this.day,
      required this.date,
      required this.time,
      required this.token,
      required this.id,
      required this.docname});
}
