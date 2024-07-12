import 'package:flutter/material.dart';
import 'films.dart'; // Mengimpor daftar film
import 'booking_page.dart'; // Mengimpor halaman pemesanan

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Padding di sekitar GridView
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam GridView
            childAspectRatio: 0.7, // Rasio aspek item dalam GridView
            mainAxisSpacing: 10, // Spasi vertikal antara item
            crossAxisSpacing: 10, // Spasi horizontal antara item
          ),
          itemCount: films.length, // Jumlah item dalam GridView
          itemBuilder: (context, index) {
            final film = films[index]; // Mendapatkan film berdasarkan indeks
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(film: film), // Mengarahkan ke halaman pemesanan dengan data film yang dipilih
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bentuk kartu dengan sudut bulat
                ),
                elevation: 5, // Efek elevasi kartu
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)), // Sudut bulat pada gambar atas kartu
                      child: Image.asset(
                        film.imagePath, // Menampilkan gambar film
                        width: double.infinity, // Lebar gambar mengikuti lebar kartu
                        height: 180, // Tinggi gambar
                        fit: BoxFit.cover, // Menyesuaikan gambar agar pas di kontainer
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0), // Padding di dalam kartu
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            film.title, // Menampilkan judul film
                            style: TextStyle(
                              fontSize: 16, // Ukuran font judul
                              fontWeight: FontWeight.bold, // Font tebal
                            ),
                          ),
                          SizedBox(height: 5), // Spasi vertikal
                          Text(
                            'Rating: ${film.rating} ⭐', // Menampilkan rating film
                            style: TextStyle(
                              fontSize: 14, // Ukuran font rating
                              color: Colors.grey[600], // Warna teks abu-abu
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
