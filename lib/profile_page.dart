import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import package shared_preferences
import 'login_page.dart'; // Import halaman LoginPage

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _username; // Variabel untuk menyimpan username

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Memuat data pengguna saat halaman dimuat
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username'); // Memuat username dari Shared Preferences
    });
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username'); // Menghapus username dari Shared Preferences
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Kembali ke halaman login setelah logout
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You have successfully logged out.'), // Menampilkan snackbar untuk konfirmasi logout
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'), // Judul dialog logout
          content: Text('Are you sure you want to log out?'), // Pertanyaan konfirmasi logout
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Batal logout
              },
            ),
            TextButton(
              child: Text('Log Out'),
              onPressed: () {
                Navigator.of(context).pop();
                _logout(); // Logout pengguna
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
        title: Text('Profile'), // Judul halaman
        backgroundColor: Colors.pinkAccent, // Ubah warna app bar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/img_1.png'), // Gambar profil placeholder
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(height: 20.0),
              Text(
                'User Profile',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
              ),
              SizedBox(height: 20.0),
              if (_username != null) ...[
                Text(
                  'Username:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  _username!,
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
                ),
              ] else ...[
                Text(
                  'Loading user data...',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: _showLogoutDialog,
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent, // Warna tombol
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
