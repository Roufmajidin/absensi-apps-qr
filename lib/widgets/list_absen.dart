import 'package:flutter/material.dart';

class ListAbsen extends StatelessWidget {
  String string;
  bool isTrue;

  ListAbsen({
    super.key,
    required this.isTrue,
    required this.string,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: const Color(0xff8186b3),
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          string,
          style: const TextStyle(
            
            fontFamily: "CustomIcons",
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
    );
  }
}