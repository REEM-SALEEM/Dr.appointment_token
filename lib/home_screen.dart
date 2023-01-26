import 'package:flutter/material.dart';
import 'package:hospitaltoken/const/colors.dart';
import 'package:hospitaltoken/docinfo_screen.dart';

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({super.key});

  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

final drnamelist = [
  "Dr. Susan Thomas",
  "Dr. Paul Barbara",
  "Dr. Nancy Williams",
  "Dr. Susan Thomas",
  "Dr. Paul Barbara",
  "Dr. Nancy Williams"
];
const imglist = [
  AssetImage('assets/images/docprofile/doc1.png'),
  AssetImage('assets/images/docprofile/doc2.png'),
  AssetImage('assets/images/docprofile/doc3.png'),
  AssetImage('assets/images/docprofile/doc1.png'),
  AssetImage('assets/images/docprofile/doc2.png'),
  AssetImage('assets/images/docprofile/doc3.png'),
];

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CustomPaint(
              painter: pathPainter(),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 30,
                ),
                actions: <Widget>[
                  Container(
                    height: 75,
                    width: 75,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [getStartedColorStart, getStartedColorEnd],
                            stops: [0, 1])),
                    child: const Center(
                      child: Text(
                        "C",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 10, top: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Select a Doctor or Category",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        margin: const EdgeInsets.only(top: 10),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            categoryContainer("category7.png", "CT-Scan"),
                            categoryContainer("category1.png", "Ortho"),
                            categoryContainer("category2.png", "Dietician"),
                            categoryContainer("category3.png", "Physician"),
                            categoryContainer("category4.png", "Paralysis"),
                            categoryContainer("category5.png", "Cardiology"),
                            categoryContainer("category6.png", "MRI - Scan"),
                            categoryContainer("category8.png", "Gynaecology"),
                          ],
                        ),
                      ),
                      const Text(
                        "Chief Doctors",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 350,
                        width: 700,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            child: ListView.separated(
                                physics: const ScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => DocInfoPage(
                                          name: drnamelist[index],
                                        ),
                                      ));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        color: docContentBgColor,
                                      ),
                                      margin: const EdgeInsets.only(bottom: 15),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(children: [
                                          Container(
                                            width: 70,
                                            height: 90,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: imglist[index],
                                                    fit: BoxFit.cover)),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                drnamelist[index],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Container(
                                                width: 200,
                                                height: 50,
                                                child: const Text(
                                                  "A brief about the doctor to be added here. This is more like an introduction about the doctor",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              )
                                            ],
                                          )
                                        ]),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(),
                                itemCount: imglist.length)
                            //  Column(children: <Widget>[
                            //   createDocWidget("doc1.png", "Susan Thomas"),
                            //   createDocWidget("doc2.png", "Paul Barbara"),
                            //   createDocWidget("doc3.png", "Nancy Williams"),
                            //   createDocWidget("doc1.png", "Susan Thomas"),
                            //   createDocWidget("doc2.png", "Paul Barbara"),
                            //   createDocWidget("doc3.png", "Nancy Williams"),
                            // ]),
                            ),
                      )
                    ]),
              )
            ]),
          )
        ],
      ),
    );
  }

  Container categoryContainer(String imgName, String title) {
    return Container(
      width: 130,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/category/$imgName'),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
          )
        ],
      ),
    );
  }

  // Container createDocWidget(String imgName, String docName) {
  //   return Container(
  //     child: InkWell(
  //       onTap: () {
  //         Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => DocInfoPage(
  //             name: docName,
  //           ),
  //         ));
  //       },
  //       child: Container(
  //         margin: const EdgeInsets.only(bottom: 15),
  //         decoration: const BoxDecoration(
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(12),
  //           ),
  //           color: docContentBgColor,
  //         ),
  //         child: Container(
  //           padding: const EdgeInsets.all(7),
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: <Widget>[
  //               Container(
  //                 width: 70,
  //                 height: 90,
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image:
  //                             AssetImage('assets/images/docprofile/$imgName'),
  //                         fit: BoxFit.cover)),
  //               ),
  //               const SizedBox(width: 10),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     "Dr. $docName",
  //                     style: const TextStyle(
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 5),
  //                   Container(
  //                     width: 200,
  //                     height: 50,
  //                     child: const Text(
  //                       "A brief about the doctor to be added here. This is more like an introduction about the doctor",
  //                       style: TextStyle(
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.w400,
  //                       ),
  //                       overflow: TextOverflow.clip,
  //                     ),
  //                   )
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class pathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint();
    paint.color = path2Color;

    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.03,
        size.width * 0.42, size.height * 0.17);
    path.quadraticBezierTo(
        size.width * 0.35, size.height * 0.32, 0, size.height * 0.29);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
