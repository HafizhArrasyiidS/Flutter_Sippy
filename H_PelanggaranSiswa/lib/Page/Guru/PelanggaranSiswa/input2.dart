import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pelanggaran/Page/Admin/Qr/Print.dart';
import 'package:pelanggaran/Page/Admin/Qr/Prints.dart';
import 'package:pelanggaran/Page/Admin/scan.dart';
import 'package:pelanggaran/Page/Guru/scan.dart';
import 'package:pelanggaran/Widget/student_model.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Input2 extends StatefulWidget {
  final Student student;
  const Input2({Key? key, required this.student, String? data})
      : super(key: key);

  @override
  State<Input2> createState() => _Input2State();
}

List<String> dropdownItems = ['XI', 'XII'];

List<String> dropdownItemsP = [
  'Terlambat',
  'Berkata Kasar',
  'Merokok',
  'Tidak Mengerjakan PR',
  'Buang Sampah Sembarangan'
];

List<String> dropdownItemsN = [
  'Ardian Firmansyah',
  'Frendika Wildan',
  'Alfian Fahrul',
  'Lukman Hakim',
  'Arya Rizki'
];

class _Input2State extends State<Input2> {
  String selectedDropdownValue = dropdownItems[0];
  String selectedDropdownValue1 = dropdownItemsP[0];
  String selectedDropdownValue2 = dropdownItemsN[0];

  late String _currentDateTime = '';
  final TextEditingController catatanController = TextEditingController();

  late SharedPreferences prefs; // Tambahkan ini

  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevices;
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  @override
  void initState() {
    super.initState();
    _currentDateTime = _getFormattedDateTime(DateTime.now());
    _updateDateTime();
    _initSharedPreferences();
    getDevices();
  }

  void getDevices() async {
    devices = await printer.getBondedDevices();
    setState(() {});
  }

  void _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    _getLastSavedData();
  }

  void _updateDateTime() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _currentDateTime = _getFormattedDateTime(DateTime.now());
      });
    });
  }

  String _getFormattedDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }

  Future<void> _getLastSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      selectedDropdownValue = prefs.getString('kelas') ?? dropdownItems[0];
      selectedDropdownValue1 =
          prefs.getString('pelanggaran') ?? dropdownItemsP[0];
      selectedDropdownValue2 = prefs.getString('nama') ?? dropdownItemsN[0];
      // catatanController.text = prefs.getString('catatan') ?? '';
    });
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Menyimpan data terakhir ke SharedPreferences
    prefs.setString('kelas', selectedDropdownValue);
    prefs.setString('pelanggaran', selectedDropdownValue1);
    prefs.setString('nama', selectedDropdownValue2);
    prefs.setString('catatan', catatanController.text);
  }

  @override
  Widget build(BuildContext context) {
    // String dateTimeString =
    //     "${_selectedDate.toLocal()} ${_selectedTime}".split('.')[0];
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
          "Input Pelanggaran siswa",
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
            Get.to(Scan());
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
              _saveData();
              _showSuccessDialog();
            },
          ),
          // IconButton(
          //   icon: const Icon(
          //     Icons.print,
          //     color: Color(0xffffffff),
          //     size: 24,
          //   ),
          //   onPressed: () {
          //     // Tambahkan logika untuk mencetak data
          //     Get.to(Printss([
          //       {'name': 'John', 'phone': '1234567890'},
          //       {'name': 'Jane', 'phone': '0987654321'},
          //     ]));
          //   },
          // ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        shrinkWrap: false,
        physics: const ScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
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
                      ),
                      TextField(
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
                          hintText: widget.student.kelas,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          filled: true,
                          fillColor: const Color(0xfff2f2f3),
                          isDense: false,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                padding: const EdgeInsets.all(5),
                child: Row(
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
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
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
                          ),
                          TextField(
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
                              hintText: widget.student.name,
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              filled: true,
                              fillColor: const Color(0xffeeeef1),
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
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
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
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
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
                          ),
                          TextField(
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
                              hintText: widget.student.nis.toString(),
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              filled: true,
                              fillColor: const Color(0xfff2f2f3),
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
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
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
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
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
                          ),
                          TextField(
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
                              hintText: widget.student.notelp.toString(),
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              filled: true,
                              fillColor: const Color(0xfff2f2f3),
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
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
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
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
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
                            ),
                            TextField(
                              controller:
                                  TextEditingController(text: _currentDateTime),
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
                                suffixIcon: const Icon(Icons.calendar_today,
                                    color: Color(0xff999999), size: 24),
                              ),
                              onTap: () async {
                                // Ketika TextField di-tap, tampilkan date picker
                                final DateTime? pickedDate =
                                    await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now(),
                                );
                                if (pickedDate != null &&
                                    pickedDate != DateTime.now()) {
                                  setState(() {
                                    _currentDateTime = _getFormattedDateTime(
                                        pickedDate); // Update nilai _selectedDate jika pengguna memilih tanggal baru
                                  });
                                }
                              },
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Pelanggaran",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          DropdownButtonFormField<String>(
                            value: selectedDropdownValue1,
                            icon: const Icon(
                              Icons.expand_more,
                              color: Color(0xff212435),
                              size: 24,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Color(0xff000000)),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedDropdownValue1 = newValue!;
                              });
                            },
                            items: dropdownItemsP.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            decoration: InputDecoration(
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
                              hintText: ".....",
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              filled: true,
                              fillColor: const Color(0xfff2f2f3),
                              isDense: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
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
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Catatan Pelanggaran",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          TextField(
                            controller: catatanController,
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
                              hintText: "Masukkan Catatan",
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color.fromARGB(255, 143, 143, 143),
                              ),
                              filled: true,
                              fillColor: const Color(0xfff2f2f3),
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
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: MaterialButton(
                  onPressed: () {
                    _printData();
                    _saveData();
                    _showSuccessDialog();
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
              DropdownButton<BluetoothDevice>(
                  value: selectedDevices,
                  hint: const Text('select printer'),
                  onChanged: (device) {
                    setState(() {
                      selectedDevices = device;
                    });
                  },
                  items: devices
                      .map((e) => DropdownMenuItem(
                            child: Text(e.name!),
                            value: e,
                          ))
                      .toList()),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    printer.connect(selectedDevices!);
                  },
                  child: const Text('Connect')),
              ElevatedButton(
                  onPressed: () {
                    printer.disconnect();
                  },
                  child: const Text('Disconnect')),
              // ElevatedButton(
              //     onPressed: () async {
              //       if ((await printer.isConnected)!) {
              //         printer.printNewLine();
              //         printer.printCustom('tes', 0, 1);
              //         // printer.printQRcode('tes', 200, 200, 1);
              //         printer.printNewLine();
              //         printer.printNewLine();
              //       }
              //     },
              //     child: const Text('Print'))
            ],
          ),
        ],
      ),
    );
  }

  void _printData() async {
    String dataToPrint = buildPrintData();

    try {
      BlueThermalPrinter bluetoothPrinter = BlueThermalPrinter.instance;
      List<BluetoothDevice> devices = await bluetoothPrinter.getBondedDevices();

      // Ensure there is at least one bonded device
      if (devices.isNotEmpty) {
        // Pick the first bonded device (you may want to implement a selection logic)
        BluetoothDevice printer = devices.first;

        bool? isConnected = await bluetoothPrinter.isConnected;

        if (!isConnected!) {
          await bluetoothPrinter.connect(printer);
        }

        // Wait for the writeText method to complete
        await bluetoothPrinter.write(dataToPrint);

        // Close the connection
        await bluetoothPrinter.disconnect();

        _showSuccessDialog();
      } else {
        print("Tidak ditemukan perangkat Bluetooth terikat");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  String buildPrintData() {
    String printData =
        """
Pelanggaran siswa
        Kelas: ${widget.student.kelas ?? 'N/A'}
        Nama: ${widget.student.name ?? 'N/A'}
        NISN: ${widget.student.nis ?? 'N/A'}
        Nomor Ortu: ${widget.student.notelp ?? 'N/A'}
        Tanggal dan Jam: $_currentDateTime
        Pelanggaran: $selectedDropdownValue1
        Catatan: ${catatanController.text}
        """;

    () async {
      if ((await printer.isConnected)!) {
        printer.printNewLine();
        printer.printCustom(printData, 0, 1);
        // printer.printQRcode('tes', 200, 200, 1);
        printer.printNewLine();
        printer.printNewLine();
      }
    };

    print("Print Data: $printData"); // Tambahkan log statement di sini

    return printData;
  }

  void _showSuccessDialog() {
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

    // Delay for 2 seconds before navigating to the next page
    Future.delayed(Duration(seconds: 1), () {
      Get.to(Scan());
    });
  }
}
