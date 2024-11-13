import 'package:flutter/material.dart';

import 'widgets/dosen_widget.dart';
import 'widgets/extract_widget.dart';
import 'widgets/list_absen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: const Color(0xff8186b3),
                    borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [
                    Text(
                      "Petrus Sokibi",
                      style:
                          TextStyle(fontFamily: "CustomIcons",fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Pemrograman Python",
                      style: TextStyle(
                        fontFamily: "CustomIcons",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8186b3)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailDosen(
                      icon: Icons.email,
                      string: "petr@gmail.com",
                    ),
                    DetailDosen(
                      icon: Icons.calendar_month,
                      string: "20 Feb 2024",
                    ),
                    DetailDosen(
                      icon: Icons.info_outline,
                      string: "Reguler",
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(14, (index) {
                    return ListAbsen(
                      isTrue: false,
                      string:
                          "P${index + 1}", 
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Pertemuan 1",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: "CustomIcons"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Pertemuan kali ini membahas dasar-dasar Python, termasuk pengenalan sintaks, tipe data seperti string, integer, dan list, serta penggunaan struktur kontrol seperti loop dan conditional untuk memecahkan masalah sederhana dalam pemrograman.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "CustomIcons"),
              ),
              const SizedBox(height: 16),
              const Text(
                "Tugas Kuliah",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: "CustomIcons"),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection:
                      Axis.horizontal, 
                  children: [
                    ExtractWidget(
                        icon: Icons.file_copy, string: "File Pertemuan"),
                    ExtractWidget(
                        icon: Icons.upload_file_sharp, string: "Upload Tugas"),
                    ExtractWidget(icon: Icons.download, string: "On-going"),
                    // Tambahkan widget lain jika diperlukan
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
