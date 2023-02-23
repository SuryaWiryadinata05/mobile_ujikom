import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // Memberikan warna latar belakang pada halaman dengan kode warna hexadecimal
    backgroundColor: HexColor('#feeee8'),
    // Menambahkan SingleChildScrollView untuk membuat tampilan dapat di-scroll
    body: SingleChildScrollView(
      // Membungkus widget dengan Column agar dapat menampilkan widget secara vertikal
      child: Column(
        children: [
          // Menambahkan animasi Lottie dengan mengambil file dari URL
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Lottie.network(
              'https://gist.githubusercontent.com/olipiskandar/2095343e6b34255dcfb042166c4a3283/raw/d76e1121a2124640481edcf6e7712130304d6236/praujikom_kucing.json',
              fit: BoxFit.cover,
            ),
          ),
          // Menambahkan TextField untuk mengambil input email
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                // Memberikan border pada TextField
                border: OutlineInputBorder(),
                // Memberikan label pada TextField
                labelText: 'Email',
                // Memberikan hint text pada TextField
                hintText: 'Masukan Email',
              ),
            ),
          ),
          // Menambahkan TextField untuk mengambil input password
          const Padding(
            padding: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 15,
              bottom: 0,
            ),
            child: TextField(
              // Mengubah text input menjadi password
              obscureText: true,
              decoration: InputDecoration(
                // Memberikan border pada TextField
                border: OutlineInputBorder(),
                // Memberikan label pada TextField
                labelText: 'Password',
                // Memberikan hint text pada TextField
                hintText: 'Masukan Password',
              ),
            ),
          ),
          // Menambahkan tombol Login
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              // Memberikan warna pada background container
              color: Colors.blue,
              // Memberikan radius border pada container
              borderRadius: BorderRadius.circular(20),
            ),
            // Memberikan aksi ketika tombol Login ditekan
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Login',
                style: TextStyle(
                  // Memberikan warna pada teks tombol
                  color: Colors.white,
                  // Mengatur ukuran font pada teks tombol
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
