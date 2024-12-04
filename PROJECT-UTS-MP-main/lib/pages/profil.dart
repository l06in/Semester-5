import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto Profil
              Center(
                child: CircleAvatar(
                  radius: 50, // Ukuran foto profil
                  backgroundImage: AssetImage('assets/image/profil1.jpg'), // Ganti dengan URL foto profil
                ),
              ),
              SizedBox(height: 20),

              // Deskripsi Nama Nasabah
              Text(
                'Nama Nasabah',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              _buildProfileField('Mochamad Imamudin'),

              SizedBox(height: 20),

              // Deskripsi Jenis Kelamin
              Text(
                'Jenis Kelamin',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              _buildProfileField('Laki-laki'),

              SizedBox(height: 20),

              // Deskripsi Alamat
              Text(
                'Alamat',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              _buildProfileField('Jln. Asyari Rt/Rw 001/005, Diwek, jombang'),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk membangun kolom profil
  Widget _buildProfileField(String value) {
    return Container(
      padding: EdgeInsets.all(15), // Menambah padding untuk kolom
      width: double.infinity, // Memperpanjang kolom agar memenuhi lebar
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
      ),
    );
  }
}