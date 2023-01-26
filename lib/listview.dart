
import 'package:flutter/material.dart';
import 'package:hospitaltoken/colors.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "dffgdgf",
                    style: TextStyle(
                        color: dateColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "dsfghjdgf",
                    style: TextStyle(
                        color: dateColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
        );
      },
      itemCount: 4,
      separatorBuilder: (context, index) => SizedBox(),
    );
  }
}
