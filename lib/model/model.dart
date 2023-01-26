import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class AppointmentModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  final int token;

  AppointmentModel({
    required this.token,
    required this.id,
  });
}
