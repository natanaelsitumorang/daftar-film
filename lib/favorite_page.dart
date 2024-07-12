import 'package:flutter/material.dart';
import 'films.dart'; // Mengimpor model Film
import 'detail_film_page.dart'; // Mengimpor halaman DetailFilmPage

class FavoritesPage extends StatelessWidget {
  final List<Film> favoriteFilms; // Daftar film favorit

  FavoritesPage({required this.favoriteFilms}); // Konstruktor dengan parameter daftar film favorit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Films'), // Judul halaman
      ),
      body: ListView.builder(
        itemCount: favoriteFilms.length, // Jumlah item pada ListView sesuai dengan jumlah film favorit
        itemBuilder: (context, index) {
          final film = favoriteFilms[index]; // Film pada indeks tertentu dalam daftar film favorit
          return ListTile(
            leading: Image.asset(film.imagePath), // Gambar film sebagai leading widget
            title: Text(film.title), // Judul film
            subtitle: Text('Rating: ${film.rating}'), // Rating film
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailFilmPage(
                    title: film.title,
                    imagePath: film.imagePath,
                    sinopsis: film.sinopsis,
                    durasi: film.durasi,
                    rating: film.rating,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
