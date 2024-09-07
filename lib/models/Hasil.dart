class DataModel {
  final Map<String, Student> data;

  DataModel({required this.data});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    final data = <String, Student>{};
    json.forEach((key, value) {
      data[key] = Student.fromJson(value);
    });
    return DataModel(data: data);
  }

  Map<String, dynamic> toJson() {
    final jsonData = <String, dynamic>{};
    data.forEach((key, value) {
      jsonData[key] = value.toJson();
    });
    return jsonData;
  }
}

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
