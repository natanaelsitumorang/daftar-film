import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk membuat UI
import 'package:shared_preferences/shared_preferences.dart'; // Mengimpor paket SharedPreferences untuk penyimpanan data lokal
import 'login_page.dart'; // Mengimpor halaman login
import 'detail_film_page.dart'; // Mengimpor halaman detail film
import 'films.dart'; // Mengimpor data film
import 'movies_page.dart'; // Mengimpor halaman daftar film
import 'store_page.dart'; // Mengimpor halaman toko
import 'booking_page.dart'; // Mengimpor halaman pemesanan tiket
import 'order_history_page.dart'; // Mengimpor halaman riwayat pesanan
import 'profile_page.dart'; // Mengimpor halaman profil
import 'favorite_page.dart'; // Mengimpor halaman favorit
import 'package:carousel_slider/carousel_slider.dart'; // Mengimpor paket CarouselSlider untuk membuat slider gambar
import 'about_us_page.dart'; // Mengimpor halaman tentang kami
import 'package:url_launcher/url_launcher.dart'; // Mengimpor paket untuk membuka URL

// Mendeklarasikan HomePage sebagai StatefulWidget
class HomePage extends StatefulWidget {
  final String username; // Deklarasi variabel untuk menyimpan username

  HomePage({required this.username}); // Konstruktor untuk inisialisasi username

  @override
  _HomePageState createState() => _HomePageState(); // Membuat state untuk HomePage
}

// State dari HomePage
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Indeks tab yang dipilih
  List<Film> favoriteFilms = []; // Daftar film favorit

  // Fungsi logout yang akan dijalankan ketika tombol logout ditekan
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username'); // Menghapus username dari SharedPreferences
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Navigasi ke LoginPage setelah logout
    );
  }

  // Fungsi untuk menambah atau menghapus film dari daftar favorit
  void _toggleFavorite(Film film) {
    setState(() {
      if (favoriteFilms.contains(film)) {
        favoriteFilms.remove(film); // Menghapus film dari daftar favorit
      } else {
        favoriteFilms.add(film); // Menambahkan film ke daftar favorit
      }
    });
  }

  // Fungsi untuk membangun tampilan gambar utama (carousel slider)
  Widget _buildMainImage(BuildContext context) {
    if (films.isEmpty) return Container(); // Menghindari error jika daftar film kosong
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0, // Tinggi slider
        autoPlay: true, // Slider berjalan otomatis
        autoPlayAnimationDuration: Duration(milliseconds: 900), // Durasi animasi
        enlargeCenterPage: true, // Memperbesar halaman tengah
      ),
      items: films.map((film) { // Membuat item slider dari daftar film
        return GestureDetector(
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
            ); // Navigasi ke halaman detail film saat gambar diklik
          },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Image.asset(
                film.imagePath,
                width: double.infinity,
                height: 250.0,
                fit: BoxFit.cover, // Menyesuaikan ukuran gambar
              ),
              Container(
                color: Colors.black54, // Latar belakang hitam dengan transparansi
                width: double.infinity,
                padding: EdgeInsets.all(12.0),
                child: Text(
                  film.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks putih
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Fungsi untuk membangun kartu film
  Widget _buildMovieCard(Film film, BuildContext context) {
    return GestureDetector(
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
        ); // Navigasi ke halaman detail film saat kartu diklik
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Radius sudut kartu
        ),
        elevation: 5, // Bayangan pada kartu
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ), // Radius sudut gambar di atas kartu
              child: Image.asset(
                film.imagePath,
                width: 120.0,
                height: 180.0,
                fit: BoxFit.cover, // Menyesuaikan ukuran gambar
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        film.title,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        icon: Icon(
                          favoriteFilms.contains(film)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoriteFilms.contains(film)
                              ? Colors.pinkAccent
                              : null,
                        ),
                        onPressed: () {
                          _toggleFavorite(film); // Menambah atau menghapus dari favorit saat tombol ditekan
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Rating: ${film.rating}', // Menampilkan rating film
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun baris film (daftar horizontal)
  Widget _buildMovieRow(List<Film> films, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: films.map((film) => _buildMovieCard(film, context)).toList(), // Membuat kartu film dalam baris
      ),
    );
  }

  // Fungsi untuk mengembalikan daftar widget sesuai tab yang dipilih
  List<Widget> _widgetOptions(BuildContext context) {
    return [
      ListView(
        children: <Widget>[
          _buildMainImage(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Popular Movies',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          _buildMovieRow(films.length > 6 ? films.sublist(1, 6) : films, context), // Menampilkan 5 film pertama
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'New Releases',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          _buildMovieRow(films.length > 11 ? films.sublist(6, 11) : films, context), // Menampilkan 5 film berikutnya
        ],
      ),
      MoviesPage(),
      StorePage(),
      FavoritesPage(favoriteFilms: favoriteFilms),
      AboutUsPage(),
      ProfilePage(),
    ];
  }

  // Fungsi yang dijalankan saat tab dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Mengubah indeks tab yang dipilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to my Movies App, ${widget.username}'), // Menampilkan judul dengan username
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout, // Menjalankan fungsi logout saat tombol ditekan
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions(context).elementAt(_selectedIndex), // Menampilkan widget sesuai tab yang dipilih
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // Label untuk tab Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies', // Label untuk tab Movies
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store', // Label untuk tab Store
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites', // Label untuk tab Favorites
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us', // Label untuk tab About Us
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile', // Label untuk tab Profile
          ),
        ],
        currentIndex: _selectedIndex, // Menandai tab yang aktif
        selectedItemColor: Colors.amber[800], // Warna item yang dipilih
        onTap: _onItemTapped, // Menjalankan fungsi saat tab dipilih
      ),
    );
  }
}
