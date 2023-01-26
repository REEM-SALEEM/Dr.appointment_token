import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospitaltoken/booked.dart';
import 'package:hospitaltoken/colors.dart';
import 'package:hospitaltoken/functions_db/db.dart';
import 'package:hospitaltoken/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocInfoPage extends StatefulWidget {
  const DocInfoPage({super.key});

  @override
  _DocInfoPageState createState() => _DocInfoPageState();
}

Map<int, bool> boollist1 = {
  0: false,
  1: false,
  2: false,
  3: false,
  4: false,
  5: false,
  6: false,
};
Map<int, bool> boollist = {
  0: false,
  1: false,
  2: false,
  3: false,
  4: false,
  5: false,
  6: false,
  7: false,
  8: false,
  9: false,
  10: false,
  11: false,
  12: false,
  13: false,
  14: false,
  15: false,
  16: false,
  17: false,
  18: false,
  19: false,
  20: false,
  21: false,
  22: false,
  23: false,
  24: false,
  25: false,
  26: false,
  27: false,
  28: false,
  29: false,
  30: false,
  31: false,
};
final timelist = [
  '09:00 AM',
  '10:00 AM',
  '11:00 AM',
  '12:30 am',
  '02:30 PM',
  '04:00 PM',
];
final datelist = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31
];
final daylist = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  "Sun",
  "Mon",
  "Tue"
];

class _DocInfoPageState extends State<DocInfoPage> {
  String _selectedIndex = "0";
  String _selectedday = "0";

  @override
  void initState() {
    super.initState();
    _loadSelectedIndex();
    _loadSelectedday();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    _saveSelectedIndex();
    _saveSelectedday();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [getStartedColorStart, getStartedColorEnd],
            begin: Alignment(0, -1.15),
            end: Alignment(0, 0.1),
          )),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.31,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('assets/images/docinfo/bg1.png'),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: bgColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                    'assets/images/docprofile/doc1.png'),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text(
                                    "Dr. Susan Thomas",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Heart Surgeon - CK Hospital",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "About the Doctor",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Please write the description of the doctor here. This will be a detailed information about the doctor and the roles and achievements that the doctor has had over the past years",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Available Time Slots",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 9),
                                  SizedBox(
                                    width: 800,
                                    height: 90,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () async {
                                              _selectedday = daylist[index];
                                              setState(() {
                                                boollist[index] = true;
                                              });
                                              boollist.forEach((k, v) {
                                                if (index != k) {
                                                  boollist[k] = false;
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: 75,
                                              height: 75,
                                              decoration: BoxDecoration(
                                                  color: boollist[index]!
                                                      ? Colors.black
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    daylist[index],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: boollist[index]!
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    datelist[index].toString(),
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: boollist[index]!
                                                            ? Colors.white
                                                            : Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(width: 20),
                                        itemCount: 31),
                                  ),
                                  const SizedBox(height: 10),
                                  const Divider(),
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 200,
                                    child: GridView.builder(
                                        padding: const EdgeInsets.all(0),
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 150,
                                                childAspectRatio: 6 / 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10),
                                        itemCount: 6,
                                        itemBuilder: (BuildContext ctx, index) {
                                          return InkWell(
                                            onTap: () async {
                                              //------------------------
                                              setState(() {
                                                boollist1[index] = true;
                                              });
                                              boollist1.forEach((k, v) {
                                                if (index != k) {
                                                  boollist1[k] = false;
                                                }
                                              });
                                              setState(() {
                                                _selectedIndex =
                                                    timelist[index];
                                              });
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: boollist1[index]!
                                                      ? Colors.black
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                timelist[index],
                                                style: TextStyle(
                                                    color: boollist1[index]!
                                                        ? Colors.white
                                                        : Colors.black),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ]),
                          )
                        ]),
                  ),
                ),
              ]),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  int i = 0;
                  setState(() {
                    i++;
                  });

                  _saveSelectedIndex();
                  _saveSelectedday();
                  final expensecategory = AppointmentModel(
                      id: DateTime.now().microsecondsSinceEpoch.toString(),
                      token: 3);
                  TokenDB.instance.addTransaction(expensecategory);

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScreenBooked(),
                  ));
                },
                child: const Text('Book Appointment')),
          ),
        ));
  }

  _saveSelectedIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("selectedIndex", _selectedIndex);
  }

  _loadSelectedIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedIndex = prefs.getString("selectedIndex") ?? "0";
    log(_selectedIndex.toString());
    setState(() {});
  }

  _saveSelectedday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("selectedday", _selectedday);
  }

  _loadSelectedday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedday = prefs.getString("selectedday") ?? "0";
    log(_selectedday.toString());
    setState(() {});
  }
}
