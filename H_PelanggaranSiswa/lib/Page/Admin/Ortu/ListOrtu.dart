import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelanggaran/Page/Admin/Ortu/addortu.dart';
import 'package:pelanggaran/Page/Admin/Ortu/detailortu.dart';
import 'package:pelanggaran/Page/Admin/dashboardadmin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ListOrtu extends StatefulWidget {
  const ListOrtu({super.key});

  @override
  State<ListOrtu> createState() => _ListOrtuState();
}

class OrtuData {
  final String id;
  final String nama;
  final String kelas;
  final String status;
  final String siswa;
  final String nomor_hp;

  OrtuData(
      {required this.id,
      required this.kelas,
      required this.siswa,
      required this.nama,
      required this.nomor_hp,
      required this.status});

  factory OrtuData.fromJson(Map<String, dynamic> json) {
    return OrtuData(
      id: json['id'] ?? '',
      nama: json['nama'] ?? '',
      kelas: json['kelas'] ?? '',
      status: json['status'] ?? '',
      siswa: json['siswa'] ?? '',
      nomor_hp: json['nomor_hp'] ?? '',
    );
  }
}

class _ListOrtuState extends State<ListOrtu> {
  final TextEditingController searchController = TextEditingController();
  List<OrtuData> searchData = [];
  Widget loadingListView = const Center(
    child: CircularProgressIndicator(),
  );

  void fetchDataOrtu(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenJwt') ?? '';

    setState(() {
      loadingListView = const Center(
        child: CircularProgressIndicator(),
      );
    });

    try {
      final response = await http.get(
          Uri.parse(
              "https://pelanggaranprestasi.000webhostapp.com/walimuridapi"),
          headers: {
            'Cookie': token,
          });

      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);

        if (decodeData is List) {
          List<OrtuData> newDataList =
              decodeData.map((item) => OrtuData.fromJson(item)).toList();
          if (mounted) {
            setState(() {
              searchData = newDataList;
              if (newDataList.length == 0) {
                Get.snackbar(
                  'Kosong',
                  "Data tersebut tidak ada",
                  colorText: Colors.white,
                  backgroundColor: Colors.orange,
                  icon: const Icon(Icons.add_alert),
                );
                loadingListView = ListView(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: [
                    Card(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      color: Color(0xff3f5198),
                      shadowColor: const Color(0x4d939393),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                            color: Color(0x4d9e9e9e), width: 1),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Wali Murid tidak ditemukan",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xffffffff),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xffffffff),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                loadingListView = ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    searchData.sort((a, b) => a.nama.compareTo(b.nama));

                    return GestureDetector(
                      onTap: () {
                        Get.to(DetailOrtu(
                            // Id: searchData[index].id,
                            // Nama: searchData[index].nama,
                            ));
                      },
                      child: Card(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                        color: Color(0xff3f5198),
                        shadowColor: const Color(0x4d939393),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(
                              color: Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        searchData[index].nama,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                      Text(
                                        searchData[index].nomor_hp,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xffffffff),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: searchData.length,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                );
              }
            });
          }
        } else {
          Get.snackbar(
            'Gagal mencari data',
            "Invalid data format",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.add_alert),
          );
        }
      } else {
        Get.snackbar(
          'Gagal mencari',
          "Error ${response.reasonPhrase}",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),
        );
      }
    } catch (e) {
      if (e
          .toString()
          .contains("Connection closed before full header was received")) {
        //handle the specific error condition here
        //you can add custom headling logic for this case
        Get.snackbar(
          'Gagal meload data',
          "Error:{$e} Connection closed before full header was received",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),
        );
      }
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataOrtu("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3f5198),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
        ),
        title: const Text(
          "Wali Murid",
          style: TextStyle(
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffffff),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.to(DashboardAdmin());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
                onTap: () {
                  Get.to(AddOrtu());
                },
                child: const Icon(Icons.add_circle,
                    color: Color(0xffffffff), size: 24)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: TextField(
                  controller: searchController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  onSubmitted: (value) {
                    var query = searchController.text;
                    fetchDataOrtu(query);
                  },
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide:
                          const BorderSide(color: Color(0xff888888), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 0),
                    ),
                    hintText: "Pencarian...",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff787878),
                    ),
                    filled: true,
                    fillColor: const Color(0xffd9d9d9),
                    isDense: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 24,
                      ),
                      onPressed: () {
                        var query = searchController.text;
                        fetchDataOrtu(query);
                      },
                      color: const Color(0xffafb4c9),
                    ),
                  ),
                ),
              ),
              loadingListView,
              // ListView(
              //   scrollDirection: Axis.vertical,
              //   padding: const EdgeInsets.all(0),
              //   shrinkWrap: true,
              //   physics: const ScrollPhysics(),
              //   children: [
              //     Card(
              //       margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              //       color: const Color(0xff56afd9),
              //       shadowColor: const Color(0x4d939393),
              //       elevation: 1,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //         side:
              //             const BorderSide(color: Color(0x4d9e9e9e), width: 1),
              //       ),
              //       child: const Padding(
              //         padding: EdgeInsets.all(7),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisSize: MainAxisSize.max,
              //           children: [
              //             Text(
              //               "Pasuruan",
              //               textAlign: TextAlign.start,
              //               overflow: TextOverflow.clip,
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w500,
              //                 fontStyle: FontStyle.normal,
              //                 fontSize: 16,
              //                 color: Color(0xffffffff),
              //               ),
              //             ),
              //             Icon(
              //               Icons.arrow_forward_ios,
              //               color: Color(0xffffffff),
              //               size: 24,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Card(
              //       margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              //       color: const Color(0xff58b1db),
              //       shadowColor: const Color(0xff000000),
              //       elevation: 1,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //         side:
              //             const BorderSide(color: Color(0x4d9e9e9e), width: 1),
              //       ),
              //       child: const Padding(
              //         padding: EdgeInsets.all(7),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisSize: MainAxisSize.max,
              //           children: [
              //             Text(
              //               "Malang",
              //               textAlign: TextAlign.start,
              //               overflow: TextOverflow.clip,
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w500,
              //                 fontStyle: FontStyle.normal,
              //                 fontSize: 16,
              //                 color: Color(0xffffffff),
              //               ),
              //             ),
              //             Icon(
              //               Icons.arrow_forward_ios,
              //               color: Color(0xffffffff),
              //               size: 24,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.to(KelasTambah());
      //   },
      //   hoverElevation: 40,
      //   hoverColor: const Color(0xfff9f871),
      //   backgroundColor: const Color(0xffffc253),
      //   child: const Icon(
      //     Icons.add,
      //     size: 24,
      //     color: Colors.black,
      //   ),
      // ),
    );
  }
}
