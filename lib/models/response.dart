class AbsensiData {
  final int id;
  final String matkulId;
  final String kelasId;
  final String semester;
  final String mahasiswaId;
  final String pertemuan;
  final int status;
  final String qr;
  final String createdAt;
  final String updatedAt;

  AbsensiData({
    required this.id,
    required this.matkulId,
    required this.kelasId,
    required this.semester,
    required this.mahasiswaId,
    required this.pertemuan,
    required this.status,
    required this.qr,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AbsensiData.fromJson(Map<String, dynamic> json) {
    return AbsensiData(
      id: json['id'],
      matkulId: json['matkul_id'],
      kelasId: json['kelas_id'],
      semester: json['semester'],
      mahasiswaId: json['mahasiswa_id'],
      pertemuan: json['pertemuan'],
      status: json['status'],
      qr: json['qr'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'matkul_id': matkulId,
      'kelas_id': kelasId,
      'semester': semester,
      'mahasiswa_id': mahasiswaId,
      'pertemuan': pertemuan,
      'status': status,
      'qr': qr,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
