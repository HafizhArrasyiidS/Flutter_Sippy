import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelanggaran/Page/Admin/PelanggaranSiswa/inpt.dart';
import 'package:pelanggaran/Page/Admin/dashboardadmin.dart';
import 'package:pelanggaran/Page/Guru/PelanggaranSiswa/input2.dart';
import 'package:pelanggaran/Page/Guru/dashboardguru.dart';
import 'package:pelanggaran/Widget/database.dart';
import 'package:pelanggaran/Widget/student_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() => runApp(const MaterialApp(home: Scan()));

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isScanned = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3f5198),
      appBar: AppBar(
        backgroundColor: Color(0xff3f5198),
        title: const Text(
          "Pendataan Pelanggaran",
          style: TextStyle(
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: Color(0xffffffff),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.to(DashboardGuru());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 24,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          // Expanded(
          //   flex: 1,
          //   child: FittedBox(
          //     fit: BoxFit.contain,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //         if (result != null)
          //           Text(
          //               'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //         else
          //           const Text(
          //             'Arahkan Kamera ke QrCode',
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontFamily: 'poppins',
          //             ),
          //           ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   style: ButtonStyle(
          //                     shape: MaterialStateProperty.all<
          //                         RoundedRectangleBorder>(
          //                       RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(8),
          //                       ),
          //                     ),
          //                   ),
          //                   onPressed: () async {
          //                     await controller?.toggleFlash();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getFlashStatus(),
          //                     builder: (context, snapshot) {
          //                       return Text(
          //                         'Flash: ${snapshot.data}',
          //                         style: TextStyle(
          //                           color: Color(0xff3f5198),
          //                         ),
          //                       );
          //                     },
          //                   )),
          //             ),
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   style: ButtonStyle(
          //                     shape: MaterialStateProperty.all<
          //                         RoundedRectangleBorder>(
          //                       RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(8),
          //                       ),
          //                     ),
          //                   ),
          //                   onPressed: () async {
          //                     await controller?.flipCamera();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getCameraInfo(),
          //                     builder: (context, snapshot) {
          //                       if (snapshot.data != null) {
          //                         return Text(
          //                           'Camera facing ${describeEnum(snapshot.data!)}',
          //                           style: TextStyle(
          //                             color: Color(0xff3f5198),
          //                           ),
          //                         );
          //                       } else {
          //                         return const Text('loading');
          //                       }
          //                     },
          //                   )),
          //             )
          //           ],
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                 style: ButtonStyle(
          //                   shape: MaterialStateProperty.all<
          //                       RoundedRectangleBorder>(
          //                     RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(8),
          //                     ),
          //                   ),
          //                 ),
          //                 onPressed: () async {
          //                   await controller?.pauseCamera();
          //                 },
          //                 child: const Text('pause',
          //                     style: TextStyle(
          //                       fontSize: 20,
          //                       color: Color(0xff3f5198),
          //                     )),
          //               ),
          //             ),
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                 style: ButtonStyle(
          //                   shape: MaterialStateProperty.all<
          //                       RoundedRectangleBorder>(
          //                     RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(8),
          //                     ),
          //                   ),
          //                 ),
          //                 onPressed: () async {
          //                   await controller?.resumeCamera();
          //                 },
          //                 child: const Text('resume',
          //                     style: TextStyle(
          //                       fontSize: 20,
          //                       color: Color(0xff3f5198),
          //                     )),
          //               ),
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: FutureBuilder(
                future: controller?.getFlashStatus(),
                builder: (context, snapshot) {
                  return Icon(
                    Icons.flash_on,
                    color: snapshot.data == true ? Colors.yellow : Colors.white,
                  );
                },
              ),
              onPressed: () async {
                await controller?.toggleFlash();
                setState(() {});
              },
            ),
            IconButton(
              icon: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (context, snapshot) {
                  IconData iconData = Icons.flip_camera_ios;
                  if (snapshot.data?.name == 'back') {
                    iconData = Icons.flip_camera_android;
                  }
                  return Icon(
                    iconData,
                    color: Colors.white, // Menambahkan warna putih pada ikon
                  );
                },
              ),
              onPressed: () async {
                await controller?.flipCamera();
                setState(() {});
              },
            ),
          ],
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              var scanArea = constraints.maxWidth * 0.8;
              if (constraints.maxWidth < constraints.maxHeight) {
                scanArea = constraints.maxHeight * 0.4;
              }
              // Decrease the scanArea to detect codes from a closer distance
              scanArea *= 0.8; // You can adjust this factor as needed

              return QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea,
                ),
                onPermissionSet: (ctrl, p) =>
                    _onPermissionSet(context, ctrl, p),
              );
            },
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (!isScanned) {
        setState(() {
          isScanned = true;
        });

        int scannedNIS = int.tryParse(scanData.code.toString()) ?? 0;

        try {
          var scannedStudent = students.firstWhere(
            (student) => student.nis == scannedNIS,
            orElse: () => Student(
              name: 'Unknown',
              nis: 0,
              kelas: 'Unknown',
              notelp: 0,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Input2(student: scannedStudent),
            ),
          );
        } catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error retrieving student data: $error'),
            ),
          );
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
