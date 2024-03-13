import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelanggaran/Page/Admin/Jurusan/listjurusan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DetailJurusan extends StatefulWidget {
  final String Id;
  final String Nama;
  const DetailJurusan({super.key, required this.Id, required this.Nama});

  @override
  State<DetailJurusan> createState() => _DetailJurusanState();
}

class _DetailJurusanState extends State<DetailJurusan> {
  final TextEditingController jurusanController = TextEditingController();
  var isLoading = false.obs;
  var isLoadingDelete = false.obs;

  Future<void> jurusanEdit() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenJwt') ?? '';

    var idJurusan = widget.Id;

    final url = Uri.parse(
        'https://pelanggaranprestasi.000webhostapp.com/jenisprestasiapi/edit/$idJurusan');

    final response = await http.post(
      url,
      body: {
        'nama': jurusanController.text,
      },
      headers: {
        'Cookie': token,
      },
    );
    if (response.statusCode == 200) {
      isLoading.value = false;
      Get.snackbar(
        'Sukses',
        "Jurusan ${widget.Nama} berhasil di update",
        colorText: Colors.white,
        backgroundColor: Colors.green[400],
        icon: const Icon(Icons.add_alert),
      );
      Get.to(ListJurusan());
    } else {
      isLoading.value = false;
      Get.snackbar(
        'Gagal mengupdate data',
        "Error ${response.reasonPhrase}",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
    }
  }

  Future<void> kotaDelete() async {
    isLoadingDelete.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('tokenJwt') ?? '';

    var idJurusan = widget.Id;

    final url = Uri.parse(
        'https://pelanggaranprestasi.000webhostapp.com/jenisprestasiapi/delete/$idJurusan');

    final response = await http.post(
      url,
      headers: {
        'Cookie': token,
      },
    );
    if (response.statusCode == 200) {
      isLoadingDelete.value = false;
      Get.snackbar(
        'Sukses',
        "Jurusan ${widget.Nama} berhasil di hapus",
        colorText: Colors.white,
        backgroundColor: Colors.green[400],
        icon: const Icon(Icons.add_alert),
      );
      Get.to(ListJurusan());
    } else {
      isLoadingDelete.value = false;
      Get.snackbar(
        'Gagal menghapus data',
        "Error ${response.reasonPhrase}",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
    }
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      onPressed: () {
        Get.back();
      },
      child: const Text("Batal"),
    );
    Widget continueButton = Obx(
      () => TextButton(
        onPressed: () {
          isLoadingDelete.value = true;
          kotaDelete();
        },
        child: Stack(
          children: [
            isLoadingDelete.value
                ? const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 4.0,
                    ),
                  )
                : const Text(
                    "Hapus",
                  ),
          ],
        ),
      ),
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Konfirmasi"),
      content: const Text("Apakah anda yakin ingin menghapus data ini?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        jurusanController.text = widget.Nama;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3f5198),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
        ),
        title: const Text(
          "Edit Jurusan",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: Color(0xffffffff),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.to(ListJurusan());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 24,
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  showAlertDialog(context);
                },
                color: const Color(0xffffffff),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
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
                      const Text(
                        "Nama Jurusan",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                      ),
                      TextField(
                        controller: jurusanController,
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
                                color: Color(0x00a03636), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: Color(0x00a03636), width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: Color(0x00a03636), width: 1),
                          ),
                          filled: true,
                          fillColor: const Color(0xffeff3f8),
                          isDense: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Obx(
                () => MaterialButton(
                  onPressed: () {
                    jurusanEdit();
                  },
                  color: Color(0xff3f5198),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      isLoading.value
                          ? const SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 4.0,
                              ),
                            )
                          : const Text(
                              "Simpan",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                    ],
                  ),
                  textColor: const Color(0xffffffff),
                  height: 40,
                  minWidth: 140,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
