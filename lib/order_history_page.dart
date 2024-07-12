import 'package:flutter/material.dart';
import 'films.dart'; // Mengimpor model Film

class OrderHistoryPage extends StatelessWidget {
  final Film film; // Film yang dipesan
  final String name; // Nama pemesan
  final String email; // Email pemesan
  final String seat; // Kursi yang dipesan
  final String paymentMethod; // Metode pembayaran

  OrderHistoryPage({
    required this.film,
    required this.name,
    required this.email,
    required this.seat,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name', // Tampilkan nama pemesan
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: $email', // Tampilkan email pemesan
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Seat: $seat', // Tampilkan kursi yang dipesan
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Payment Method: $paymentMethod', // Tampilkan metode pembayaran
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  film.imagePath, // Tampilkan gambar film yang dipesan
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              film.title, // Tampilkan judul film yang dipesan
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Rating: ${film.rating} ⭐', // Tampilkan rating film yang dipesan
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
