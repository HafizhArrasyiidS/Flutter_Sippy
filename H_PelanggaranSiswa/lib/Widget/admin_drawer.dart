import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pelanggaran/Page/Account/akunlogin.dart';
import 'package:pelanggaran/Page/Admin/DataPelanggaranSiswa/DataPelanggaranSiswa.dart';
import 'package:pelanggaran/Page/Admin/DataPrestasiSiswa/dataprestasisiswa.dart';
import 'package:pelanggaran/Page/Admin/Guru/listguru.dart';
import 'package:pelanggaran/Page/Admin/JenisPelanggaran/jenispelanggaran.dart';
import 'package:pelanggaran/Page/Admin/JenisPrestasi/jenisprestasi.dart';
import 'package:pelanggaran/Page/Admin/Jurusan/listjurusan.dart';
import 'package:pelanggaran/Page/Admin/Kelas/ListKelas.dart';
import 'package:pelanggaran/Page/Admin/Ortu/ListOrtu.dart';
import 'package:pelanggaran/Page/Admin/Pelanggaran/pelanggaran.dart';
import 'package:pelanggaran/Page/Admin/PelanggaranSiswa/PelanggaranSiswa.dart';
import 'package:pelanggaran/Page/Admin/Prestasi/prestasi.dart';
import 'package:pelanggaran/Page/Admin/PrestasiSiswa/PrestasiSiswa.dart';

import 'package:pelanggaran/Page/Admin/Siswa/ListSiswa.dart';
import 'package:pelanggaran/Page/Admin/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  // @override
//   State<AdminDrawer> createState() => _AdminDrawerState();
// }

// class _AdminDrawerState extends State<AdminDrawer> {

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
            left: 20,
            right: 20,
            bottom: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logoteks.png',
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.60,
                  fit: BoxFit.fitWidth,
                ),
                // Text(
                //   'Aplikasi Pelanggaran dan Prestasi Siswa',
                //   style: TextStyle(
                //     fontFamily: 'Poppins',
                //     fontSize: 20,
                //   ),
                // ),
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
                const Padding(
                  padding: EdgeInsets.only(
                    top: 0,
                    bottom: 5,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Master Data',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: ('Poppins'),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(ListGuru());
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
                            'Guru',
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
                    Get.to(ListSiswa());
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
                    Get.to(ListOrtu());
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
                            'Wali Murid',
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
                    Get.to(ListJurusan());
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
                            'Jurusan',
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
                    Get.to(ListKelas());
                  },
                  child: const SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.people,
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
                      'Pelanggaran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: ('Poppins'),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(JenisPelanggaran());
                  },
                  child: const SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.type_specimen,
                          color: Color.fromARGB(255, 74, 74, 74),
                          size: 24,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 12,
                          ),
                          child: Text(
                            'Jenis Pelanggaran',
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

                // GestureDetector(
                //   onTap: () {
                //     Get.to(Pelanggaran());
                //   },
                //   child: const SizedBox(
                //     height: 40,
                //     width: double.infinity,
                //     child: Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(
                //           Icons.info_outline,
                //           color: Color.fromARGB(255, 74, 74, 74),
                //           size: 24,
                //         ),
                //         Padding(
                //           padding: EdgeInsets.only(
                //             left: 12,
                //           ),
                //           child: Text(
                //             'Pelanggaran',
                //             style: TextStyle(
                //               fontFamily: 'Poppins',
                //               color: Color.fromARGB(255, 74, 74, 74),
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                GestureDetector(
                  onTap: () {
                    Get.to(PelanggaranSiswa());
                  },
                  child: const SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          color: Color.fromARGB(255, 74, 74, 74),
                          size: 22,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 12,
                          ),
                          child: Text(
                            'Pelanggaran Siswa',
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
                // GestureDetector(
                //   onTap: () {
                //     Get.to(DataPelanggaranSiswa());
                //   },
                //   child: const SizedBox(
                //     height: 40,
                //     width: double.infinity,
                //     child: Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(
                //           Icons.label,
                //           color: Color.fromARGB(255, 74, 74, 74),
                //           size: 22,
                //         ),
                //         Padding(
                //           padding: EdgeInsets.only(
                //             left: 12,
                //           ),
                //           child: Text(
                //             'Data Pelanggaran Siswa',
                //             style: TextStyle(
                //                 fontFamily: 'Poppins',
                //                 color: Color.fromARGB(255, 74, 74, 74),
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

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
                    Get.to(JenisPrestasi());
                  },
                  child: const SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.type_specimen_outlined,
                          color: Color.fromARGB(255, 74, 74, 74),
                          size: 22,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 12,
                          ),
                          child: Text(
                            'Jenis Prestasi',
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
                // GestureDetector(
                //   onTap: () {
                //     Get.to(Prestasi());
                //   },
                //   child: const SizedBox(
                //     height: 40,
                //     width: double.infinity,
                //     child: Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(
                //           Icons.star_rounded,
                //           color: Color.fromARGB(255, 74, 74, 74),
                //           size: 22,
                //         ),
                //         Padding(
                //           padding: EdgeInsets.only(
                //             left: 12,
                //           ),
                //           child: Text(
                //             'Prestasi',
                //             style: TextStyle(
                //                 fontFamily: 'Poppins',
                //                 color: Color.fromARGB(255, 74, 74, 74),
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                GestureDetector(
                  onTap: () {
                    Get.to(PrestasiSiswa());
                  },
                  child: const SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 74, 74, 74),
                          size: 22,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 12,
                          ),
                          child: Text(
                            'Prestasi Siswa',
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
                // GestureDetector(
                //   onTap: () {
                //     Get.to(DataPrestasi());
                //   },
                //   child: const SizedBox(
                //     height: 40,
                //     width: double.infinity,
                //     child: Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Icon(
                //           Icons.label,
                //           color: Color.fromARGB(255, 74, 74, 74),
                //           size: 22,
                //         ),
                //         Padding(
                //           padding: EdgeInsets.only(
                //             left: 12,
                //           ),
                //           child: Text(
                //             'Data Prestasi Siswa',
                //             style: TextStyle(
                //                 fontFamily: 'Poppins',
                //                 color: Color.fromARGB(255, 74, 74, 74),
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 14),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
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
                    Get.to(SettingA());
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
                            content:
                                const Text('Yakin ingin keluar dari akun?'),
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
        ));
  }
}
