import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelanggaran/Page/Admin/PelanggaranSiswa/inpt.dart';

class Printss extends StatefulWidget {
  final List<Map<String, dynamic>> printData;
  Printss(this.printData);
  @override
  State<Printss> createState() => _PrintssState();
}

class _PrintssState extends State<Printss> {
  // BluetoothPrint bluetoothPrint = BluetoothPrint.instanse;
  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevices;
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  @override
  void initState() {
    super.initState();
    getDevices();
  }

  void getDevices() async {
    devices = await printer.getBondedDevices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 24,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ElevatedButton(
                onPressed: () async {
                  if ((await printer.isConnected)!) {
                    printer.printNewLine();
                    printer.printCustom('tes', 0, 1);
                    // printer.printQRcode('tes', 200, 200, 1);
                    printer.printNewLine();
                    printer.printNewLine();
                  }
                },
                child: const Text('Print'))
          ],
        ),
      ),
    );
  }
}
