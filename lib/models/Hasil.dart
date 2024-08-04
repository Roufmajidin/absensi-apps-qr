import 'dart:convert';

// Class to represent individual student data
class Student {
  final String mahasiswa;
  final String matkul;
  final String kelas;
  final int kelasId;
  final String tanggal;
  final int semester;
  final String idAbsen;
  final String pertemuan;

  Student({
    required this.mahasiswa,
    required this.matkul,
    required this.kelas,
    required this.kelasId,
    required this.tanggal,
    required this.semester,
    required this.idAbsen,
    required this.pertemuan,
  });

  // Factory method to create a Student instance from JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      mahasiswa: json['mahasiswa'],
      matkul: json['matkul'],
      kelas: json['kelas'],
      kelasId: json['kelas_id'],
      tanggal: json['tanggal'],
      semester: json['semester'],
      idAbsen: json['id_absen'],
      pertemuan: json['pertemuan'],
    );
  }

  // Method to convert a Student instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'mahasiswa': mahasiswa,
      'matkul': matkul,
      'kelas': kelas,
      'kelas_id': kelasId,
      'tanggal': tanggal,
      'semester': semester,
      'id_absen': idAbsen,
      'pertemuan': pertemuan,
    };
  }
}

class DataModel {
  final Map<String, Student> data;

  DataModel({required this.data});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    final Map<String, Student> data = {};
    json['data'].forEach((key, value) {
      data[key] = Student.fromJson(value);
    });
    return DataModel(data: data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = {};
    data.forEach((key, value) {
      jsonData[key] = value.toJson();
    });
    return {'data': jsonData};
  }
}
