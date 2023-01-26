import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hospitaltoken/database/db.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ScreenBooked extends StatefulWidget {
  const ScreenBooked({super.key});

  @override
  State<ScreenBooked> createState() => _ScreenBookedState();
}

class _ScreenBookedState extends State<ScreenBooked> {
  String? selectedIndex;
  String? selectedday;
  @override
  void initState() {
    TokenDB.instance.getAllTransactions();
    TokenDB.instance.refreshUI();
    log(TokenDB.instance.tokenlist.value.length.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: ValueListenableBuilder(
        valueListenable: TokenDB.instance.tokenlist,
        builder: (BuildContext context, value, Widget? child) {
          return value.isEmpty
              ? const Center(child: Text('No Booked Appointments'))
              : Center(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final category = value[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              trailing: IconButton(
                                  onPressed: () {
                                    //-------------------------------
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: const Text(
                                            'Cancel this Appointment?',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 78, 77, 77),
                                              letterSpacing: 0.1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          actions: [
                                            FittedBox(
                                              child: Row(
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      'No',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      TokenDB.instance
                                                          .deletetoken(
                                                              category.id);
                                                      Navigator.pop(context);

                                                      showTopSnackBar(
                                                        Overlay.of(context)!,
                                                        const CustomSnackBar
                                                            .error(
                                                          message:
                                                              'Appointment cancelled',
                                                        ),
                                                      );
                                                    },
                                                    child: const Text(
                                                      'Yes',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.close)),
                              leading: Container(
                                  height: 200,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 122, 205, 228),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.0,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      children: [
                                        const CircleAvatar(
                                          radius: 5,
                                          backgroundColor:
                                              Color.fromARGB(255, 58, 57, 57),
                                          child: CircleAvatar(
                                            radius: 4,
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          category.token.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )),
                              title: Row(
                                children: [
                                  Text(
                                    category.day.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    category.date.toString(),
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  category.docname != null
                                      ? Text(
                                          category.docname!,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 91, 89, 89),
                                              fontWeight: FontWeight.bold),
                                        )
                                      : const Text(''),
                                  Text(
                                    category.time.toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: value.length),
                );
        },
      ),
    );
  }
}
