import 'package:flutter/material.dart';
import 'profil.dart';
import 'transaksi.dart';

void main() {
  runApp(BankSendiriApp());
}

class BankSendiriApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Sendiri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: SingleChildScrollView( // Menambahkan kemampuan scroll
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Profil
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/image/profil1.jpg'), // Ganti dengan URL foto profil
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat datang',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Mochamad Imamudin',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Kolom Saldo
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.wallet, size: 50, color: Colors.blue), // Ikon dompet di pojok kiri
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saldo',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rp 150.000', // Ganti dengan saldo aktual
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Nomor Rekening',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '07892xxxx', // Ganti dengan nomor rekening aktual
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Akses Cepat
            Text(
              'Akses Cepat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Kolom Transfer
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TransaksiPage()), // Navigasi ke halaman Transaksi
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      color: Colors.grey[300],
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Icon(Icons.send, size: 40, color: Colors.blue),
                          SizedBox(height: 5),
                          Text('Transfer', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
                // Kolom Aktivitas
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10), // Jarak antar kolom
                    color: Colors.grey[300], // Warna abu-abu
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Icon(Icons.history, size: 40, color: Colors.blue),
                        SizedBox(height: 5),
                        Text('Aktivitas', style: TextStyle(fontSize : 16)),
                      ],
                    ),
                  ),
                ),
                // Kolom Akun Bank
                Expanded(
                  child: Container(
                    color: Colors.grey[300], // Warna abu-abu
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Icon(Icons.account_balance, size: 40, color: Colors.blue),
                        SizedBox(height: 5),
                        Text('Akun Bank', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Bagian Transaksi
            Text(
              'Transaksi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                TransactionItem(name: 'Agung Adi', amount: 50000, type: 'Uang Masuk'),
                TransactionItem(name: 'Zainal Arifin', amount: 100000, type: 'Uang Masuk'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String name;
  final double amount;
  final String type;

  TransactionItem({required this.name, required this.amount, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.attach_money, size: 40, color: Colors.blue), // Ikon uang masuk
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Nama penerima tebal
                Text(type, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          SizedBox(width: 10),
          Text('Rp ${amount.toString()}', style: TextStyle(fontSize: 16)), // Nominal transfer
        ],
      ),
    );
  }
}