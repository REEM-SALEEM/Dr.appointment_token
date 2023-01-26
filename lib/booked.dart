import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospitaltoken/functions_db/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenBooked extends StatefulWidget {
  const ScreenBooked({super.key});

  @override
  State<ScreenBooked> createState() => _ScreenBookedState();
}

class _ScreenBookedState extends State<ScreenBooked> {
  String? selectedIndex;
  String? selectedday;

  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    getSavedData2(context);
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: TokenDB().incomeCategoryList,
        builder: (BuildContext context, value, Widget? child) {
          return Center(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final category = value[0];
                  // log(TokenDB().incomeCategoryList.l);
                  log(value.length.toString());
                  return Container(
                      height: 400,
                      width: 400,
                      color: Colors.cyan,
                      child: Center(child: Text(category.token.toString())));
                },
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: value.length),
          );
        },
      ),
    );
  }

  //*get the saved name
  Future<void> getSavedData(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    //getter method - get the saved name by key
    selectedIndex = sharedprefs.getString('selectedIndex');
    setState(() {});
  }

  //*get the saved name
  Future<void> getSavedData2(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    //getter method - get the saved name by key
    selectedday = sharedprefs.getString('selectedday');
    setState(() {});
  }
}
