import 'package:flutter/material.dart';
import 'widgets/list_maktul.dart';
class MatkulPage extends StatefulWidget {
  const MatkulPage({super.key});

  @override
  State<MatkulPage> createState() => _MatkulPageState();
}

class _MatkulPageState extends State<MatkulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f6f9),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
                      Icon(Icons.file_open_rounded,
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
                        "24 sks / semester 7 / TI 2020",
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
            Container(
              // height: MediaQuery.of(context).size.height * 0.9 ,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontFamily: "CustomIcons",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.align_horizontal_right,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    // height: MediaQuery.of(context).size.height,
            
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 20),
                      shrinkWrap: true,
                      scrollDirection:
                          Axis.vertical, // ListView menjadi horizontal
                      children: [
                        ListMaktul(
                            absensi: "12 Pertemuan",
                            name: "Pemrograman Dasar",
                            pertemuan: "Pemrograman Dasar"),
                        ListMaktul(
                            absensi: "12 Pertemuan",
                            name: "Pemrograman Desktop",
                            pertemuan: "Pemrograman Dasar"),
                        ListMaktul(
                            absensi: "12 Pertemuan",
                            name: "Pemrograman Desktop",
                            pertemuan: "Pemrograman Dasar"),
                      
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
