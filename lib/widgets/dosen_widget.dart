// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DetailDosen extends StatelessWidget {
  String string;

  IconData icon;

  DetailDosen({
    required this.icon,
    required this.string,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right:4.0),
          child: Icon(
            icon,
            color: const Color(0xff8186b3),
          ),
        ),
        Text(
          string,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "CustomIcons"),
        ),
      ],
    );
  }
}