///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelanggaran/Page/Admin/DataPelanggaranSiswa/DetailDataPelanggaranSiswa.dart';
import 'package:pelanggaran/Page/Admin/DataPrestasiSiswa/dataprestasisiswa.dart';
import 'package:pelanggaran/Page/Admin/DataPrestasiSiswa/detaildataprestasisiswa.dart';
import 'package:pelanggaran/Page/Admin/Kelas/ListKelas.dart';
import 'package:pelanggaran/Page/Admin/PelanggaranSiswa/PelanggaranSiswa.dart';
import 'package:pelanggaran/Page/Admin/PelanggaranSiswa/inputpelanggaransiswa.dart';
import 'package:pelanggaran/Page/Admin/PrestasiSiswa/PrestasiSiswa.dart';
import 'package:pelanggaran/Page/Admin/Siswa/ListSiswa.dart';
import 'package:pelanggaran/Page/Admin/profil.dart';
import 'package:pelanggaran/Page/Admin/scan.dart';
import 'package:pelanggaran/Widget/admin_drawer.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigasi sesuai dengan index yang dipilih
    switch (index) {
      case 0:
        // Navigasi ke halaman pertama
        break;
      case 1:
        // Navigasi ke halaman kedua
        break;
      // Tambahkan case lain sesuai dengan kebutuhan Anda
    }
  }

  @override
  Widget build(BuildContext context) {
    void openDialogProfile() {
      Get.dialog(
        AlertDialog(
          title: const Text('Informasi Pengguna'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text('Nama : '),
                  Expanded(
                    child: Text(
                      'Admin',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Roles : '),
                  Expanded(
                    child: Text(
                      'Admin',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
          actions: [
            TextButton(
              child: const Text("close"),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffebebeb),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: const Color(0xff3f5198),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
        ),
        title: const Text(
          "Admin",
          style: TextStyle(
            fontFamily: 'poppins',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffffff),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: GestureDetector(
              onTap: () {
                openDialogProfile();
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/pp.png'),
                radius: 20,
              ),
            ),
          )
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const Drawer(
        width: 278,
        child: AdminDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 20, right: 20, bottom: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 135,
                                  height: 135,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3f5198),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.to(const ListSiswa());
                                      },
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 5, 0, 0),
                                        child: Column(
                                          children: [
                                            Text(
                                              '5',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 50,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'Siswa',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ))),
                              Container(
                                  width: 135,
                                  height: 135,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff87c31e),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(const ListKelas());
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Column(
                                        children: [
                                          Text(
                                            '5',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 50,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Kelas',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(const PrestasiSiswa());
                              },
                              child: Container(
                                  width: 135,
                                  height: 135,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffcf00),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Prestasi',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            Container(
                                width: 135,
                                height: 135,
                                decoration: BoxDecoration(
                                  color: const Color(0xffc00c0c),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(const PelanggaranSiswa());
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Pelanggaran',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Pelanggaran",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            color: Color(0xff345fa9),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const InputPelanggaranSiswa());
                          },
                          child: const Text(
                            "Semua",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xff3560ab),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(const DetailDataPelanggaranSiswa());
                            },
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: ListView.builder(
                                  itemCount: 5, // Mengatur itemCount ke 5
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 10),
                                      padding: const EdgeInsets.all(0),
                                      width: 200,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff3f5198),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 10, 0, 0),
                                                      child: Text(
                                                        "M Dwi Kurniawan",
                                                        textAlign:
                                                            TextAlign.start,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 16,
                                                          color:
                                                              Color(0xffffffff),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 5, 0, 0),
                                                  child: Text("XII RPL",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xfff3dfcf),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 22,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )),
                          ))
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Prestasiv",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            color: Color(0xff345fa9),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const DataPrestasi());
                          },
                          child: const Text(
                            "Semua",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xff3560ab),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(const DetailDataPrestasiSiswa());
                            },
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: ListView.builder(
                                  itemCount: 5, // Mengatur itemCount ke 5
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 10),
                                      padding: const EdgeInsets.all(0),
                                      width: 200,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff3f5198),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 10, 0, 0),
                                                      child: Text(
                                                        "Daka Wicaksana",
                                                        textAlign:
                                                            TextAlign.start,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 16,
                                                          color:
                                                              Color(0xffffffff),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 5, 0, 0),
                                                  child: Text("XII TKJ",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xfff3dfcf),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 22,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )),
                          ))
                    ],
                  ),
                ],
              ),
            ]),
      ),
      // floatingActionButton: SizedBox(
      //   width: 72,
      //   height: 72,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Get.to(const Scan1());
      //     },
      //     hoverElevation: 40,
      //     hoverColor: const Color(0xfff9f871),
      //     backgroundColor: const Color(0xffffc253),
      //     child: Icon(
      //       Icons.qr_code_scanner,
      //       size: 40,
      //       color: Colors.black,
      //     ),
      //     elevation: 6, // Sesuaikan dengan kebutuhan Anda
      //     shape: RoundedRectangleBorder(
      //       borderRadius:
      //           BorderRadius.circular(16), // Setengah dari lebar/tinggi
      //     ),
      //   ),

      bottomNavigationBar: SizedBox(
        height: 70, // Sesuaikan tinggi dengan kebutuhan Anda
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Cari',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner),
                  label: 'Scan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              backgroundColor: const Color(0xff3f5198),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              iconSize: 25,
              onTap: (index) {
                _onItemTapped(index);
                if (index == 0) {
                  Get.to(const InputPelanggaranSiswa());
                }
                if (index == 1) {
                  Get.to(Scan1());
                }
                if (index == 2) {
                  Get.to(ProfileA());
                }
              }),
        ),
      ),
    );
  }
}
