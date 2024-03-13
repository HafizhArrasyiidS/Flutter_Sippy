///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelanggaran/Page/Admin/Prestasi/prestasi.dart';

import '../Pelanggaran/pelanggaran.dart';

class AddPrestasi extends StatefulWidget {
  const AddPrestasi({super.key});

  @override
  State<AddPrestasi> createState() => _AddPrestasiState();
}

class _AddPrestasiState extends State<AddPrestasi> {
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
          "Tambah Prestasi",
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
            Get.to(const Prestasi());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
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
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
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
                    borderSide:
                        const BorderSide(color: Color(0x00a03636), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Color(0x00a03636), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Color(0x00a03636), width: 1),
                  ),
                  filled: true,
                  fillColor: const Color(0xfff2f2f3),
                  isDense: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
              ),
            ),
            const Text(
              "Jenis Prestasi",
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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: DropdownButtonFormField<String>(
                value: null, // variabel untuk menyimpan nilai yang dipilih
                onChanged: (newValue) {
                  setState(() {});
                },
                items: <String>[
                  'LOMBA TINGKAT NASIONAL', // daftar pilihan yang tersedia
                  'LOMBA TINGKAT KABUPATEN',
                  'LOMBA TINGKAT KECAMATAN',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  hintText: 'Pilih Jenis Prestasi',
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Color(0x00750808), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Color(0x00750808), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Color(0x00750808), width: 1),
                  ),
                  filled: true,
                  fillColor: const Color(0xfff2f2f3),
                  isDense: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
              ),
            ),
            // const Text(
            //   "Poin",
            //   textAlign: TextAlign.start,
            //   overflow: TextOverflow.clip,
            //   style: TextStyle(
            //     fontWeight: FontWeight.w400,
            //     fontStyle: FontStyle.normal,
            //     fontSize: 14,
            //     color: Color(0xff000000),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
            //   child: TextField(
            //     controller: TextEditingController(),
            //     obscureText: false,
            //     textAlign: TextAlign.start,
            //     maxLines: 1,
            //     style: const TextStyle(
            //       fontWeight: FontWeight.w400,
            //       fontStyle: FontStyle.normal,
            //       fontSize: 14,
            //       color: Color(0xff000000),
            //     ),
            //     decoration: InputDecoration(
            //       disabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //         borderSide:
            //             const BorderSide(color: Color(0x00ffffff), width: 1),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //         borderSide:
            //             const BorderSide(color: Color(0x00ffffff), width: 1),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //         borderSide:
            //             const BorderSide(color: Color(0x00ffffff), width: 1),
            //       ),
            //       filled: true,
            //       fillColor: const Color(0xfff2f2f3),
            //       isDense: false,
            //       contentPadding:
            //           const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: MaterialButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Sukses',
                    middleText: 'Data berhasil disimpan',
                    backgroundColor: Colors.green,
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    middleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    barrierDismissible: false,
                    radius: 15.0,
                    contentPadding: const EdgeInsets.all(20.0),
                  );
                  Future.delayed(const Duration(seconds: 1), () {
                    Get.to(Prestasi());
                  });
                },
                color: const Color(0xff3f5198),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "Simpan",
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
    );
  }
}
