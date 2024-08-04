import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:absenku_pintar/function/function.dart';
import 'package:absenku_pintar/function/loader.dart';
import 'package:absenku_pintar/models/Hasil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  final _formKey = GlobalKey<FormState>();

  // Define controllers to capture user input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _timer = "00:00:00";
  String _dateString = "YYYY-MM-DD";

  @override
  void initState() {
    super.initState();
    _updateTime();
    final qrScannerProvider =
        Provider.of<QRScannerProvider>(context, listen: false);
    qrScannerProvider.getNIM();
    qrScannerProvider.getNama();
  }

  void _updateTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      final now = DateTime.now();
      setState(() {
        _timer =
            "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
        _dateString =
            "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
      });
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  Future<void> _refresh() async {
    // Simulate a delay for the refresh process
    await Future.delayed(const Duration(seconds: 1));

    // Trigger any data refresh logic here
    _updateTime(); // Update the time to simulate refresh
    final qrScannerProvider =
        Provider.of<QRScannerProvider>(context, listen: false);
    QRViewController? controller = qrScannerProvider.controller;

    if (controller != null) {
      qrScannerProvider.onQ(controller);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    final qrScannerProvider = Provider.of<QRScannerProvider>(context);
    final student = qrScannerProvider.getStudent(); // Fetch student data

    // Display SnackBar only once when the stateFetch changes to success
   
    log('statet adalah ${qrScannerProvider.state}');
    // if(qrScannerProvider.state loading lebih dari 5 detik, maka)
    //  if (qrScannerProvider.state == LoadingState.success)
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Hy, ')),
    //   );
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        _timer,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontFamily:
                              'Digital-7', // Custom font can be used here
                        ),
                      ),
                      Text(
                        _dateString,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily:
                              'Digital-7', // Custom font can be used here
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 238, 238),
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
                    height: 350,
                    width: 300,
                    child: student != null
                        ? QrImageView(
                            data: qrScannerProvider.dataModel!.data.toString(),
                            version: QrVersions.auto,
                            size: 300,
                            gapless: false,
                            // embeddedImage:
                            //     AssetImage('assets/images/my_embedded_image.png'),
                            // embeddedImageStyle: QrEmbeddedImageStyle(
                            //   size: Size(80, 80),
                            // ),
                          )
                        : QRView(
                            key: qrKey,
                            onQRViewCreated: qrScannerProvider.onQRViewCreated,
                          ),
                  ),
                ),
                // Center(
                //   child: _buildResult(qrScannerProvider),
                // )

                // Center(
                //   child: _buildResult(qrScannerProvider),
                // ))

                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(bottom: 100),
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
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // const Center(
                        //   child: Text(
                        //     "Absensi",
                        //     style: TextStyle(
                        //       fontSize: 30,
                        //       fontFamily: "Poppins-Bold",
                        //       letterSpacing: .10,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                        if (qrScannerProvider.state == LoadingState.error)
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Data tidak ditemukan',
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ),
                        if (student != null)
                          Column(
                            children: [
                              builRowWidget(
                                  'Mata Kuliah', student.matkul.toString()),
                              builRowWidget('Kelas', student.kelas.toString()),
                              builRowWidget(
                                  'Pertemuan', student.pertemuan.toString()),
                              builRowWidget(
                                  'Tanggal', student.tanggal.toString()),
                              builRowWidget(
                                  'Mahasiswa', student.mahasiswa.toString()),
                              builRowWidget(
                                  'Semester', student.semester.toString()),
                            ],
                          ),
                        if (student != null)
                          GestureDetector(
                            // onTap: _saveData,
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.only(bottom: 1),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Text(
                                "Absen Sekarang",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        if (qrScannerProvider.state == LoadingState.error)
                          if (qrScannerProvider.status == "Data tidak ada")
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.only(bottom: 1),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Text(
                              "Data Absen mu tidak tersedia pada QR",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            ),
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding builRowWidget(String key, String student) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              key,
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              student.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Poppins",
              ),
            ),
          ),
          // const SizedBox(width: 50),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, display a snackbar and save the input data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      // Save the form data (for example, send it to the server or store it locally)
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        // print(result);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
