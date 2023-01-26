import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hospitaltoken/model/model.dart';

const tokendbname = 'token_database';

abstract class TokenDbFunctions {
  Future<List<AppointmentModel>> getAllTransactions();
  Future<void> addtoken(AppointmentModel obj);
  Future<void> deletetoken(String categoryID);
}

class TokenDB implements TokenDbFunctions {
  TokenDB._internal();
  static TokenDB instance = TokenDB._internal();
  factory TokenDB() {
    return instance;
  }
  @override
  Future<void> addtoken(AppointmentModel obj) async {
    final tokenDB = await Hive.openBox<AppointmentModel>(tokendbname);
    await tokenDB.put(obj.id, obj);
    refreshUI();
  }

  @override
  Future<List<AppointmentModel>> getAllTransactions() async {
    final tokenDB = await Hive.openBox<AppointmentModel>(tokendbname);

    return tokenDB.values.toList();
  }

  ValueNotifier<List<AppointmentModel>> tokenlist = ValueNotifier([]);
  Future<void> refreshUI() async {
    final alltokens = await getAllTransactions();
    tokenlist.value.clear();

    await Future.forEach(
      alltokens,
      (AppointmentModel category) {
        tokenlist.value.add(category);
      },
    );
    tokenlist.notifyListeners();
  }

  @override
  Future<void> deletetoken(String categoryID) async {
    final tokenDB = await Hive.openBox<AppointmentModel>(tokendbname);
    tokenDB.delete(categoryID);
    refreshUI();
    tokenlist.notifyListeners();
  }
}
