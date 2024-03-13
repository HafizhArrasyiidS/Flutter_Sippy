import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pelanggaran/Page/Admin/dashboardadmin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AkunLogin extends StatefulWidget {
  const AkunLogin({super.key});

  @override
  State<AkunLogin> createState() => _AkunLoginState();
}

class _AkunLoginState extends State<AkunLogin> {
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final String apiUrl =
        "https://pelanggaranprestasi.000webhostapp.com/indexapi/login";
    Map<String, String> postData = {
      "username": emailController.text,
      "password": passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: postData,
        headers: {
          'Content-Type':
              'application/x-www-form-urlencoded', //set content type
        },
      );
      if (response.statusCode == 302) {
        final String? cookies = response.headers['set-cookie'];
        final List<String> arrCookies = cookies!.split(';');

        // Find the PHPSESSID cookie
        String? phpSessionId;
        for (String cookie in arrCookies) {
          if (cookie.trim().startsWith('PHPSESSID=')) {
            phpSessionId = cookie.trim();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('tokenJwt', phpSessionId);
            break;
          }
        }
        Get.snackbar(
          'Sukses',
          "Proses login telah berhasil",
          colorText: Colors.white,
          backgroundColor: Colors.green[400],
          icon: const Icon(Icons.add_alert),
        );
        Get.to(DashboardAdmin());
        isLoading.value = false;
      } else {
        Get.snackbar(
          'Login error',
          "Error: ${response.reasonPhrase}",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),
        );
        isLoading.value = false;
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      isLoading.value = false;
      Get.snackbar(
        'Login error',
        "Error: $error",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add_alert),
      );
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final passwordVisibilty = true.obs;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3f5198),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(40, 150, 35, 20),
            padding: const EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width * 0.83,
            height: MediaQuery.of(context).size.height * 0.51,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ///***If you have exported images you must have to copy those images in assets/images directory.
                      Image(
                        // ignore: prefer_const_constructors
                        image: AssetImage("assets/images/logoteks.png"),
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.60,
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                        child: TextFormField(
                          controller: emailController,
                          obscureText: false,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "email tidak boleh kosong";
                            }
                            return null;
                          },
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Color(0xff939393), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Color(0xff939393), width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Color(0xff939393), width: 1),
                            ),
                            labelText: "Email",
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            hintText: "Enter Email",
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color.fromARGB(255, 126, 126, 126),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            isDense: false,
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                        child: Obx(
                          () => TextFormField(
                            controller: passwordController,
                            obscureText: passwordVisibilty.value,
                            textAlign: TextAlign.left,
                            autofillHints: const [AutofillHints.password],
                            maxLines: 1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "password tidak boleh kosong";
                              }
                              return null;
                            },
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                    color: Color(0xff939393), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                    color: Color(0xff939393), width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                    color: Color(0xff939393), width: 1),
                              ),
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              hintText: "Enter Password",
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color.fromARGB(255, 126, 126, 126),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              isDense: false,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  passwordVisibilty.value =
                                      !passwordVisibilty.value;
                                },
                                child: Icon(
                                  passwordVisibilty.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: const Color(0xff212435),
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => MaterialButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   login();
                            // }
                            Get.to(DashboardAdmin());
                          },
                          color: Color(0xff3f5198),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(16),
                          textColor: const Color(0xffffffff),
                          height: 40,
                          minWidth: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              isLoading.value
                                  ? SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 4.0,
                                      ),
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: [
                      //       const Padding(
                      //         padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      //         child: const Text(
                      //           "Belum punya akun?",
                      //           textAlign: TextAlign.start,
                      //           overflow: TextOverflow.clip,
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w400,
                      //             fontStyle: FontStyle.normal,
                      //             fontSize: 14,
                      //             color: Color(0xff000000),
                      //           ),
                      //         ),
                      //       ),
                      //       GestureDetector(
                      //         onTap: () {
                      //           Get.to(AkunDaftar());
                      //         },
                      //         child: const Text(
                      //           "Daftar Disini!",
                      //           textAlign: TextAlign.start,
                      //           overflow: TextOverflow.clip,
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w700,
                      //             fontStyle: FontStyle.normal,
                      //             fontSize: 14,
                      //             color:Color(0xff004fff),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
