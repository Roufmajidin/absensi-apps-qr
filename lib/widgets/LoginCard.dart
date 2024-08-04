import 'package:absenku_pintar/absensi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool passwordInvisible = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nimController = TextEditingController();

  // Method to save data to shared preferences
  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', nameController.text);
    await prefs.setString('nim', nimController.text);
    print(
        'Data saved: Nama - ${nameController.text}, NIM - ${nimController.text}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: "",)),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    nimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 15.0),
            blurRadius: 15.0,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, -10.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Login",
              style: TextStyle(
                fontFamily: "Poppins-Bold",
                letterSpacing: .6,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Username",
              style: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "eg: Namamu",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "NIM",
              style: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            TextFormField(
              controller: nimController,
              obscureText: passwordInvisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordInvisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordInvisible = !passwordInvisible;
                    });
                  },
                ),
                hintText: "**********",
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _saveData,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(bottom: 1),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Simpan",
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: ElevatedButton(
            //     // style:  ButtonStyle(backgroundColor: MaterialStateColor),
            //     onPressed: _saveData,
            //     child: const Text('Simpan Data'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
