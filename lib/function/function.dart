import 'dart:convert';
import 'dart:developer';

import 'package:absenku_pintar/function/loader.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:absenku_pintar/models/Hasil.dart';

// enum LoadingState { initial, loading, success, error }

class QRScannerProvider with ChangeNotifier {
  Barcode? _result;
  QRViewController? _controller;
  LoadingState _state = LoadingState.initial;
  LoadingState _stateFetch = LoadingState.initial;
  String? _errorMessage;
  DataModel? _dataModel;

  Barcode? get result => _result;
  QRViewController? get controller => _controller;
  LoadingState get state => _state;
  LoadingState get stateFetch => _stateFetch;
  String? get errorMessage => _errorMessage;
  DataModel? get dataModel => _dataModel;
  String? _nim;
  String? _nama;
  String? _status;

  String? get nama => _nama;
  String? get nim => _nim;
  String? get status => _status;

  bool _hasScanned = false;
  bool get hasScanned => _hasScanned;

  set result(Barcode? newResult) {
    _result = newResult;
    notifyListeners();
  }

  set controller(QRViewController? newController) {
    _controller = newController;
    notifyListeners();
  }

  void setScanned(bool scanned) {
    _hasScanned = scanned;
    notifyListeners();
  }

  void onQ(QRViewController controller) {
    controller.resumeCamera();
    dataModel?.data.clear();
    _state = LoadingState.initial;

    notifyListeners();
  }

  void onQRViewCreated(QRViewController controller) {
    _controller = controller;
    _state = LoadingState.loading;
    _hasScanned = false;

    notifyListeners();

    controller.scannedDataStream.listen((scanData) async {
      if (_hasScanned) return;

      result = scanData;

      final data = DataModel.fromJson(jsonDecode(result!.code!));
      _dataModel = data;

      // Check if data is successfully recorded in the model
      if (_dataModel != null || _dataModel!.data.isNotEmpty) {
        await getNIM();
        // controller.pauseCamera(); // Stop the camera
        // _hasScanned = true;
        var a = getStudent();
        log('Hallo ${a}');
        print('stu ${a}');
        if (a == null) {
          _status = "Data tidak ada";
          _state = LoadingState.error;
          controller.pauseCamera(); // Stop the camera

          notifyListeners();
        } else {
          _status = "ada";
          
          _stateFetch = LoadingState.success;

          controller.pauseCamera();
          notifyListeners();
        }
      }
      print(_status);
    });
  }

  Student? getStudent() {
    // _stateFetch = LoadingState.loading;

    var student = _dataModel?.data[_nim];
    if (student == null) {
      log("Student not found for NIM $_nim");
      _status = "Data tidak ada";
      // _stateFetch = LoadingState.error;
      // notifyListeners();
      return null;
    }

    // _nama = student.matkul; // Assuming you want to use matkul for the name
    // _stateFetch = LoadingState.success;
    // notifyListeners();

    return student;
  }

  Future<void> getNIM() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nim = prefs.getString('nim');
    log('NIM yang digunakan adalah $_nim');
    notifyListeners(); // Notify after updating _nim
  }

  Future<void> getNama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nama = prefs.getString('nama');
    log('Nama yang digunakan adalah $_nama');
    notifyListeners(); // Notify after updating _nama
  }
}
