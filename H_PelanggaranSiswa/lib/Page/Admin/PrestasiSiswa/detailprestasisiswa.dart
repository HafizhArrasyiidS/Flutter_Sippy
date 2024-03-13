///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pelanggaran/Page/Admin/PrestasiSiswa/PrestasiSiswa.dart';
import 'package:pelanggaran/Page/Admin/PrestasiSiswa/PrintPrestasi.dart';
import 'dart:async';

import 'package:pelanggaran/Page/Admin/PrestasiSiswa/editprestasi.dart';

class DetailPrestasiSiswa extends StatefulWidget {
  const DetailPrestasiSiswa({super.key});

  @override
  State<DetailPrestasiSiswa> createState() => _DetailPrestasiSiswaState();
}

class _DetailPrestasiSiswaState extends State<DetailPrestasiSiswa> {
  late String _currentDateTime = '';

  @override
  void dispose() {
    // Batalkan timer ketika widget di-"dispose"
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _currentDateTime = _getFormattedDateTime(DateTime.now());
    _startTimer();
  }

  late Timer _timer;

  void _startTimer() {
    // Mulai timer dan panggil setState setiap menit
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentDateTime = _getFormattedDateTime(DateTime.now());
        });
      }
    });
  }

  void _updateDateTime() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _currentDateTime = _getFormattedDateTime(DateTime.now());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          elevation: 4,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff3f5198),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
          ),
          title: const Text(
            "Detail Prestasi Siswa",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 18,
              color: Color(0xffffffff),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.to(PrestasiSiswa());
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xffffffff),
              size: 24,
            ),
          ),
          actions: [
            // Icon(Icons.delete, color: Color(0xffffffff), size: 24),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const PrintPrestasi1());
                    },
                    child: const Icon(
                      Icons.print,
                      color: Color(0xffffffff),
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.delete,
                    color: Color(0xffffffff),
                    size: 24,
                  ),
                ])),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(26, 5, 26, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Kelas",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: DropdownButtonFormField<String>(
                    value: null, // variabel untuk menyimpan nilai yang dipilih
                    onChanged: (newValue) {
                      setState(() {});
                    },
                    items: <String>[
                      'XII RPL 2', // daftar pilihan yang tersedia
                      'XII TKJ 4',
                      'XII MM 1',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      hintText: 'Pilih Kelas',
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00750808), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00750808), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00750808), width: 1),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                const Text(
                  "Nama",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: DropdownButtonFormField<String>(
                    value: null, // variabel untuk menyimpan nilai yang dipilih
                    onChanged: (newValue) {
                      setState(() {});
                    },
                    items: <String>[
                      'Kemal Palevi', // daftar pilihan yang tersedia
                      'Raditya Dika',
                      'Pandu Prajiwaksono',
                      'Indra Jegel',
                      'Iqbaal Ramadhan',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      hintText: 'Pilih Siswa',
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00750808), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00750808), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00750808), width: 1),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                const Text(
                  "NISN",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    controller: TextEditingController(),
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xffffffff), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xffffffff), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xffffffff), width: 1),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                const Text(
                  "Nomor OrangTua",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    controller: TextEditingController(),
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xffffffff), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xffffffff), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xffffffff), width: 1),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                const Text(
                  "Tanggal dan Jam",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    controller: TextEditingController(text: _currentDateTime),
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00ffffff), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00ffffff), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00ffffff), width: 1),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      suffixIcon: const Icon(Icons.calendar_today,
                          color: Color(0xff999999), size: 24),
                    ),
                    onTap: () async {
                      // Ketika TextField di-tap, tampilkan date picker
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null && pickedDate != DateTime.now()) {
                        setState(() {
                          _currentDateTime = _getFormattedDateTime(
                              pickedDate); // Update nilai _selectedDate jika pengguna memilih tanggal baru
                        });
                      }
                    },
                  ),
                ),
                const Text(
                  "Prestasi",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: DropdownButtonFormField<String>(
                    value: null, // variabel untuk menyimpan nilai yang dipilih
                    onChanged: (newValue) {
                      setState(() {});
                    },
                    items: <String>[
                      'Jayandaru Cup', // daftar pilihan yang tersedia
                      'Lomba Kompetensi Siswa',
                      'Tahfidz',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      hintText: 'Pilih Prestasi',
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00750808), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00750808), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00750808), width: 1),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                const Text(
                  "Catatan Pretasi",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    controller: TextEditingController(),
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xffffffff), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xffffffff), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xffffffff), width: 1),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                const Text(
                  "Poin",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TextField(
                    controller: TextEditingController(),
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00000000), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00000000), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0x00000000), width: 1),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: MaterialButton(
                    onPressed: () {
                      Get.to(EditPrestasiSiswa());
                    },
                    color: const Color(0xff3f5198),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      "Edit Data",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    textColor: const Color(0xffffffff),
                    height: 40,
                    minWidth: 140,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  String _getFormattedDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }
}
