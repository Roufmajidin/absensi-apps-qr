import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExtractWidget extends StatelessWidget {
  String string;

  IconData icon;

  ExtractWidget({
    required this.icon,
    required this.string,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 120,
        width: 140,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff8186b3),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xff8186b3),
              size: 40,
            ),
            Text(
              string,
              style: const TextStyle(
                fontFamily: "CustomIcons",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8186b3)),
            ),
          ],
        ),
      ),
    );
  }
}
