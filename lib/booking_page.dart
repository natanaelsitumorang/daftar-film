import 'package:flutter/material.dart';
import 'films.dart'; // Mengimpor model Film
import 'order_history_page.dart'; // Mengimpor halaman riwayat pesanan

class BookingPage extends StatefulWidget {
  final Film film; // Film yang akan dipesan

  BookingPage({required this.film}); // Konstruktor dengan parameter wajib film

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>(); // Kunci untuk validasi form
  final _nameController = TextEditingController(); // Controller untuk input nama
  final _emailController = TextEditingController(); // Controller untuk input email
  String? _selectedSeat; // Pilihan kursi yang dipilih
  String? _selectedPaymentMethod; // Metode pembayaran yang dipilih

  void _bookTicket() {
    if (_formKey.currentState!.validate() && _selectedSeat != null && _selectedPaymentMethod != null) {
      // Validasi form dan pastikan semua input terisi
      _showSuccessDialog(); // Tampilkan dialog sukses jika berhasil
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Successful'), // Judul dialog sukses
          content: Text('You have successfully booked a ticket for ${widget.film.title}.'),
          // Pesan sukses dengan judul film yang berhasil dipesan
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderHistoryPage(
                      film: widget.film, // Kirim data film ke halaman riwayat pesanan
                      name: _nameController.text,
                      email: _emailController.text,
                      seat: _selectedSeat!,
                      paymentMethod: _selectedPaymentMethod!,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Ticket for ${widget.film.title}'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.film.imagePath, // Tampilkan gambar film
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.film.title, // Judul film
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Rating: ${widget.film.rating} ⭐', // Rating film
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'), // Label input nama
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name'; // Validasi nama tidak boleh kosong
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'), // Label input email
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email'; // Validasi email tidak boleh kosong
                        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email address'; // Validasi email harus sesuai format
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Select Seat'), // Label dropdown kursi
                      items: ['A1', 'A2', 'B1', 'B2', 'C1', 'C2'].map((String seat) {
                        return DropdownMenuItem<String>(
                          value: seat,
                          child: Text(seat),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedSeat = value; // Simpan pilihan kursi yang dipilih
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a seat'; // Validasi kursi harus dipilih
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Select Payment Method'), // Label dropdown metode pembayaran
                      items: ['Credit Card', 'Debit Card', 'PayPal', 'Dana', 'OVO'].map((String method) {
                        return DropdownMenuItem<String>(
                          value: method,
                          child: Text(method),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value; // Simpan pilihan metode pembayaran yang dipilih
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a payment method'; // Validasi metode pembayaran harus dipilih
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _bookTicket, // Panggil fungsi untuk memesan tiket
                      child: Text('Book Ticket'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
