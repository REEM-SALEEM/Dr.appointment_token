import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hospitaltoken/model/model.dart';

const tokendbname = 'token_database';

abstract class TokenDbFunctions {
  Future<List<AppointmentModel>> getAllTransactions();
  Future<void> addTransaction(AppointmentModel obj);
  Future<void> deletetoken(String categoryID);

  // Future<void> transactionClear();
}

class TokenDB implements TokenDbFunctions {
  TokenDB._internal(); //singleton obj(_internal)
  static TokenDB instance = TokenDB._internal();
  factory TokenDB() {
    //factory: returns the existing object, if none is present will create one. (& to ensure)
    return instance;
  }
  @override
  Future<void> addTransaction(AppointmentModel obj) async {
    final transactionDB = await Hive.openBox<AppointmentModel>(tokendbname);
    await transactionDB.put(obj.id, obj);
    refreshUI();
  }

  @override
  Future<List<AppointmentModel>> getAllTransactions() async {
    final transactionDB = await Hive.openBox<AppointmentModel>(tokendbname);

    return transactionDB.values.toList();
  }

  ValueNotifier<List<AppointmentModel>> incomeCategoryList = ValueNotifier([]);
  Future<void> refreshUI() async {
    final allcategories = await getAllTransactions();
    incomeCategoryList.value.clear();

    await Future.forEach(
      allcategories,
      (AppointmentModel category) {
        incomeCategoryList.value.add(category);
      },
    );
    incomeCategoryList.notifyListeners();
  }

  @override
  Future<void> deletetoken(String categoryID) async {
    final categoryDB = await Hive.openBox<AppointmentModel>(tokendbname);
    categoryDB.delete(categoryID);
    refreshUI();
    incomeCategoryList.notifyListeners();
  }
}
