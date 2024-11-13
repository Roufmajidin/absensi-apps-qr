import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListMaktul extends StatelessWidget {
  String absensi;
  
  String name;
  
  String pertemuan;

   ListMaktul({
    super.key,
    required this.name,
    required this.pertemuan,
    required this.absensi,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.file_open_rounded,
                color: Color(0xff8186b3), size: 60),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pertemuan,
                    style: const TextStyle(
                        fontFamily: "CustomIcons",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                   Text(
                    absensi,
                    style: const TextStyle(
                        fontFamily: "CustomIcons",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      const Padding(
        padding: EdgeInsets.fromLTRB(10,10, 10, 0),
        child: Divider(indent: 2.0,color: Color.fromARGB(255, 216, 212, 212),),
      )
      ],
    );
  }
}
