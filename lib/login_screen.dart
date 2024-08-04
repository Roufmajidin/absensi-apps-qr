import 'package:absenku_pintar/widgets/LoginCard.dart';
import 'package:absenku_pintar/widgets/my_header.dart';
import 'package:flutter/material.dart';

import 'utils/constant.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final controller = ScrollController();
  double offset = 0;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHeader(
              image: "assets/icons/barbecue.svg",
              textTop: "Hallo UCIC-an",
              textBottom: "Simple your Absen with me",
              offset: offset,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LoginCard(),
                  SizedBox(height: MediaQuery.of(context).size.height),
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 12.0,
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Text("Remember me",
                          style: TextStyle(
                              fontSize: 12, fontFamily: "Poppins-Medium"))
                    ],
                  ),
                  InkWell(
                    child: Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                                color: kActiveShadowColor,
                                offset: const Offset(0.0, 8.0),
                                blurRadius: 8.0)
                          ]),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: const Center(
                            child: Text("SIGNIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 18,
                                    letterSpacing: 1.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                 
                 
                 
                   const SizedBox(
                    height: 30,
                  ),
                  ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  Widget horizontalLine() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: 120,
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  Widget radioButton(bool isSelected) => Container(
    width: 16.0,
    height: 16.0,
    padding: const EdgeInsets.all(2.0),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: Colors.black)),
    child: isSelected
        ? Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
      const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    )
        : Container(),
  );

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }
}
