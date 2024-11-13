import 'package:flutter/material.dart';

class MatkulPage extends StatefulWidget {
  const MatkulPage({super.key});

  @override
  State<MatkulPage> createState() => _MatkulPageState();
}

class _MatkulPageState extends State<MatkulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 238, 238),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.file_present_rounded,
                          color: Color(0xff8186b3), size: 60),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mata Kuliah",
                            style: TextStyle(
                                fontFamily: "CustomIcons",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff8186b3)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "10 MK",
                              style: TextStyle(
                                  fontFamily: "CustomIcons",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff8186b3)),
                            ),
                          ),
                        
                        ],
                      ),
                         Text(
                             "24 sks / 1 semester / TI 2020",
                             style: TextStyle(
                                 fontFamily: "CustomIcons",
                                 fontSize: 14,
                                 fontWeight: FontWeight.w500,
                                 color: Color(0xff8186b3)),
                           ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
