///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelanggaran/Page/Guru/dashboardguru.dart';

class SettingB extends StatefulWidget {
  const SettingB({super.key});

  @override
  State<SettingB> createState() => _SettingAState();
}

class _SettingAState extends State<SettingB> {
  String _selectedValue = '';
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
          "Pengaturan",
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
            Get.to(const DashboardGuru());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Color(0xffffffff),
              size: 24,
            ),
            onPressed: () {
              Get.defaultDialog(
                title: 'Sukses',
                middleText: 'Pengaturan berhasil di ubah',
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
                Get.to(DashboardGuru());
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Status Pendataan",
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: DropdownButtonFormField<String>(
                value: null, // variabel untuk menyimpan nilai yang dipilih
                onChanged: (newValue) {
                  setState(() {});
                },
                items: <String>[
                  'Langsung Cetak', // daftar pilihan yang tersedia
                  'Konfirmasi Cetak',
                  'Tidak Cetak',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  hintText: 'Pilih Status',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Kirim Pelanggaran Langsung Ke Nomor Orangtua",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Radio(
                            value: "1",
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                            activeColor: Color(0xff3f5198),
                            autofocus: false,
                            splashRadius: 20,
                            hoverColor: Color(0x42000000),
                          ),
                          Text(
                            "Ya",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: _selectedValue == "1"
                                  ? Color(0xff3f5198)
                                  : Color(0xff000000),
                            ),
                          ),
                          Radio(
                            value: "2",
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                            activeColor: Color(0xff3f5198),
                            autofocus: false,
                            splashRadius: 20,
                            hoverColor: Color(0x42000000),
                          ),
                          Text(
                            "Tidak",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: _selectedValue == "2"
                                  ? Color(0xff3f5198)
                                  : Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MaterialButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Sukses',
                    middleText: 'Pengaturan berhasil di ubah',
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
                    Get.to(DashboardGuru());
                  });
                },
                color: const Color(0xff3f5198),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save,
                      color: Colors.white,
                      size: 20, // Ubah ukuran ikon sesuai kebutuhan Anda
                    ),
                    SizedBox(width: 8), // Jarak antara ikon dan teks
                    Text(
                      "Simpan",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
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
