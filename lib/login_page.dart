import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

// Mendeklarasikan LoginPage sebagai StatefulWidget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

// State dari LoginPage
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Kunci global untuk form
  String username = ''; // Variabel untuk menyimpan username
  String email = ''; // Variabel untuk menyimpan email
  String password = ''; // Variabel untuk menyimpan password

  // Fungsi login yang akan dijalankan ketika tombol login ditekan
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) { // Memvalidasi form
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username); // Menyimpan username ke SharedPreferences

      // Tampilkan Snackbar "Login successful"
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login successful'),
          duration: Duration(seconds: 2), // Durasi Snackbar muncul
        ),
      );

      // Navigasi ke HomePage setelah delay
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(username: username)),
        );
      });
    } else {
      _showAlert(context, 'Please fill all the fields'); // Menampilkan pesan kesalahan jika form tidak valid
    }
  }

  // Fungsi untuk menampilkan dialog alert
  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Validation Error'),
        content: Text(message), // Pesan yang akan ditampilkan
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Menutup dialog ketika tombol OK ditekan
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/img.png', // Menampilkan gambar latar
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5), // Warna hitam dengan 50% transparansi
                  borderRadius: BorderRadius.circular(16.0), // Radius sudut container
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey, // Menghubungkan form dengan _formKey
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24.0, // Ukuran font judul
                            fontWeight: FontWeight.bold, // Teks tebal
                          ),
                        ),
                        SizedBox(height: 20), // Jarak vertikal
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(), // Batas input field
                          ),
                          onChanged: (value) => username = value, // Menyimpan nilai input ke variabel username
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username cannot be empty'; // Validasi input username
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20), // Jarak vertikal
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(), // Batas input field
                          ),
                          onChanged: (value) => email = value, // Menyimpan nilai input ke variabel email
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email cannot be empty'; // Validasi input email
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Enter a valid email address'; // Validasi format email
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20), // Jarak vertikal
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(), // Batas input field
                          ),
                          obscureText: true, // Menyembunyikan teks input (untuk password)
                          onChanged: (value) => password = value, // Menyimpan nilai input ke variabel password
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password cannot be empty'; // Validasi input password
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20), // Jarak vertikal
                        ElevatedButton(
                          onPressed: _login, // Memanggil fungsi _login saat tombol ditekan
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Padding tombol
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Radius sudut tombol
                            ),
                          ),
                        ),
                      ],
                    ),
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
