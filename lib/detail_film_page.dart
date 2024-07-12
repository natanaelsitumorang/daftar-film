import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk membuat UI

// Kelas DetailFilmPage yang merupakan StatelessWidget
class DetailFilmPage extends StatelessWidget {
  final String title; // Variabel untuk judul film
  final String imagePath; // Variabel untuk jalur gambar film
  final String sinopsis; // Variabel untuk sinopsis film
  final String durasi; // Variabel untuk durasi film
  final double rating; // Variabel untuk rating film

  // Konstruktor dengan parameter yang diharuskan untuk inisialisasi variabel
  DetailFilmPage({
    required this.title,
    required this.imagePath,
    required this.sinopsis,
    required this.durasi,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // Menampilkan judul film di AppBar
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0), // Padding untuk ListView
        children: <Widget>[
          SizedBox(height: 20.0), // Jarak antara AppBar dan gambar
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 300.0,
            fit: BoxFit.cover, // Menyesuaikan ukuran gambar
          ),
          SizedBox(height: 20.0), // Jarak antara gambar dan judul
          Text(
            'Movie Title: $title',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center, // Judul film ditampilkan di tengah
          ),
          SizedBox(height: 10.0), // Jarak antara judul dan rating
          Text(
            'Rating: $rating',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0), // Jarak antara rating dan durasi
          Text(
            'Durasi: $durasi',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0), // Jarak antara durasi dan sinopsis
          Text(
            'Sinopsis: $sinopsis',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 10.0), // Jarak antara sinopsis dan akhir halaman
        ],
      ),
    );
  }
}

// Kelas BookingPage yang merupakan StatelessWidget
class BookingPage extends StatelessWidget {
  final String title; // Variabel untuk judul film
  final String imagePath; // Variabel untuk jalur gambar film
  final double rating; // Variabel untuk rating film

  // Konstruktor dengan parameter yang diharuskan untuk inisialisasi variabel
  BookingPage({
    required this.title,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); // Kunci untuk form validasi
    final _nameController = TextEditingController(); // Kontroler untuk input nama
    final _emailController = TextEditingController(); // Kontroler untuk input email

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Ticket for $title'), // Menampilkan judul di AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding untuk seluruh halaman
        child: ListView(
          children: <Widget>[
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover, // Menyesuaikan ukuran gambar
            ),
            SizedBox(height: 20.0), // Jarak antara gambar dan judul
            Text(
              title,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Judul film ditampilkan di tengah
            ),
            SizedBox(height: 10.0), // Jarak antara judul dan rating
            Text(
              'Rating: $rating',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center, // Rating ditampilkan di tengah
            ),
            SizedBox(height: 20.0), // Jarak antara rating dan form
            Form(
              key: _formKey, // Mengatur kunci untuk form validasi
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController, // Kontroler untuk input nama
                    decoration: InputDecoration(labelText: 'Name'), // Label untuk input nama
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name'; // Validasi jika nama kosong
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController, // Kontroler untuk input email
                    decoration: InputDecoration(labelText: 'Email'), // Label untuk input email
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email'; // Validasi jika email kosong
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address'; // Validasi jika email tidak valid
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0), // Jarak antara input dan tombol
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Ticket booked for ${_nameController.text}')), // Menampilkan snackbar setelah booking sukses
                        );
                      }
                    },
                    child: Text('Confirm Booking'), // Teks pada tombol booking
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
