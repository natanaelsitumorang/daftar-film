  import 'package:flutter/material.dart';
  import 'package:url_launcher/url_launcher.dart'; // Mengimpor package url_launcher untuk membuka URL

  class AboutUsPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('About Us'), // Judul halaman
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama: Natanael Situmorang', // Informasi nama
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Alamat: Bekasi', // Informasi alamat
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Umur: 21 Tahun', // Informasi umur
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Sosial Media:', // Judul informasi media sosial
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  launch('https://www.instagram.com/natan_q7/'); // Tombol untuk membuka Instagram
                },
                child: Text(
                  'Instagram: @natanael.situmorang', // Teks untuk tombol Instagram
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  launch('https://www.tiktok.com/@natanael.situmorang'); // Tombol untuk membuka TikTok
                },
                child: Text(
                  'TikTok: @natanael.situmorang', // Teks untuk tombol TikTok
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
