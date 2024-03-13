import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pelanggaran/Page/Account/akunlogin.dart';
import 'package:pelanggaran/Page/Guru/DataPelanggaranSiswa/DataPelanggaranSiswa.dart';
import 'package:pelanggaran/Page/Guru/DataPrestasiSiswa/dataprestasisiswa.dart';
import 'package:pelanggaran/Page/Guru/Kelas/ListKelas.dart';
import 'package:pelanggaran/Page/Guru/PelanggaranSiswa/PelanggaranSiswa.dart';
import 'package:pelanggaran/Page/Guru/PrestasiSiswa/PrestasiSiswa.dart';
import 'package:pelanggaran/Page/Guru/Siswa/ListSiswa.dart';
import 'package:pelanggaran/Page/Guru/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuruDrawer extends StatelessWidget {
  const GuruDrawer({super.key});

  // @override
//   State<GuruDrawer> createState() => _GuruDrawerState();
// }

// class _GuruDrawerState extends State<GuruDrawer> {

  @override
  Widget build(BuildContext context) {
    void _logout() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('tokenJwt');
      Get.to(
        const AkunLogin(),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 15,
          right: 15,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset(
            //   'assets/images/lo.jpg',
            //   width: 138,
            //   height: 63,
            // ),
            Text(
              'Aplikasi Pelanggaran dan Prestasi Siswa',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
            ),
            const Divider(
              color: Color(0xFFC6C6C6),
              thickness: 2,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     bottom: 8,
            //   ),
            //   child: GestureDetector(
            //     onTap: () {
            //       Get.back();
            //     },
            //     child: const SizedBox(
            //       height: 40,
            //       width: double.infinity,
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           Icon(
            //             Icons.dashboard,
            //             color: Color.fromARGB(255, 74, 74, 74),
            //             size: 24,
            //           ),
            //           Padding(
            //             padding: EdgeInsets.only(
            //               left: 12,
            //             ),
            //             child: Text(
            //               'Dashboard',
            //               style: TextStyle(
            //                 fontFamily: 'Poppins',
            //                 color: Color.fromARGB(255, 74, 74, 74),
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                Get.to(ListSiswa2());
              },
              child: const SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 74, 74, 74),
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: Text(
                        'Siswa',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(ListKelas2());
              },
              child: const SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.groups,
                      color: Color.fromARGB(255, 74, 74, 74),
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: Text(
                        'Kelas',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 74, 74, 74),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 0,
                bottom: 5,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Pelanggaran',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.to(PelanggaranSiswa2());
              },
              child: const SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 74, 74, 74),
                      size: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: Text(
                        'Input Pelanggaran Siswa',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 74, 74, 74),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(DataPelanggaranSiswa2());
                },
                child: const SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.label,
                        color: Color.fromARGB(255, 74, 74, 74),
                        size: 22,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 12,
                        ),
                        child: Text(
                          'Data Pelanggaran Siswa',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              color: Color(0xFFC6C6C6),
              thickness: 2,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 0,
                bottom: 5,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Prestasi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.to(PrestasiSiswa2());
              },
              child: const SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 74, 74, 74),
                      size: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: Text(
                        'Input Prestasi Siswa',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 74, 74, 74),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(DataPrestasi2());
              },
              child: const SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.label,
                      color: Color.fromARGB(255, 74, 74, 74),
                      size: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: Text(
                        'Data Prestasi Siswa',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 74, 74, 74),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
                  color: Color(0xFFC6C6C6),
                  thickness: 2,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 0,
                    bottom: 5,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Pengaturan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SettingB());
                  },
                  child: const SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 74, 74, 74),
                          size: 22,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 12,
                          ),
                          child: Text(
                            'Pengaturan',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color.fromARGB(255, 74, 74, 74),
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            const Divider(
              color: Color(0xFFC6C6C6),
              thickness: 2,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Keluar'),
                        content: const Text('Yakin ingin keluar dari akun?'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Tidak'),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _logout();
                              },
                              child: const Text('Ya'))
                        ],
                      );
                    });
              },
              child: const SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Color.fromARGB(255, 74, 74, 74),
                      size: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: Text(
                        'Keluar',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 74, 74, 74),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
