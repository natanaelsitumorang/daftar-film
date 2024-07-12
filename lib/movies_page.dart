import 'package:flutter/material.dart';
import 'detail_film_page.dart'; // Mengimpor halaman detail film
import 'films.dart'; // Mengimpor daftar film

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Membuat daftar film dengan ListView.builder
      itemCount: films.length, // Jumlah item sesuai dengan jumlah film
      itemBuilder: (context, index) {
        final film = films[index]; // Mendapatkan film berdasarkan indeks
        return GestureDetector(
          // Widget untuk mendeteksi gesture (ketukan)
          onTap: () {
            // Aksi yang dilakukan ketika film diketuk
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailFilmPage(
                  // Mengarahkan ke halaman detail film dengan data yang sesuai
                  title: film.title,
                  imagePath: film.imagePath,
                  sinopsis: film.sinopsis,
                  durasi: film.durasi,
                  rating: film.rating,
                ),
              ),
            );
          },
          child: Card(
            // Membungkus setiap film dalam Card
            margin: EdgeInsets.all(8.0), // Margin di sekitar card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  film.imagePath, // Menampilkan gambar film
                  width: double.infinity, // Lebar gambar disesuaikan
                  height: 250.0, // Tinggi gambar disesuaikan
                  fit: BoxFit.cover, // Menyesuaikan gambar agar pas di kontainer
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0), // Padding di dalam card
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        film.title, // Menampilkan judul film
                        style: TextStyle(
                          fontSize: 18.0, // Ukuran font judul
                          fontWeight: FontWeight.bold, // Font tebal
                        ),
                      ),
                      SizedBox(height: 4.0), // Spasi vertikal
                      Row(
                        // Baris untuk menampilkan rating dengan bintang
                        children: List.generate(5, (index) {
                          return Icon(
                            index < film.rating.round()
                                ? Icons.star // Bintang terisi
                                : Icons.star_border, // Bintang kosong
                            size: 16.0, // Ukuran ikon
                            color: Colors.amber, // Warna ikon
                          );
                        }),
                      ),
                      SizedBox(height: 4.0), // Spasi vertikal
                      Text(
                        'Rating: ${film.rating}', // Menampilkan rating film
                        style: TextStyle(fontSize: 14.0), // Ukuran font rating
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
