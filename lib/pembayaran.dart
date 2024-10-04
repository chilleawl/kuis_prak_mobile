import 'package:flutter/material.dart';

class PembayaranPage extends StatelessWidget {
  final String hotelName;
  final int pricePerNight;
  final int totalKamar;
  final int totalMalam;
  final String customerName;
  final String customerEmail;

  const PembayaranPage({
    Key? key,
    required this.hotelName,
    required this.pricePerNight,
    required this.totalKamar,
    required this.totalMalam,
    required this.customerName,
    required this.customerEmail,
  }) : super(key: key);

  int getTotalPrice() {
    return pricePerNight * totalKamar * totalMalam;
  }

  void _showPaymentSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pembayaran berhasil!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran ${hotelName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Informasi hotel
            Text(
              hotelName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Harga per malam: Rp $pricePerNight'),
            SizedBox(height: 5),
            Text('Total Kamar: $totalKamar'),
            SizedBox(height: 5),
            Text('Total Malam: $totalMalam'),
            SizedBox(height: 20),

            // Informasi pemesan
            Text(
              'Informasi Pemesan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Nama: $customerName'),
            SizedBox(height: 5),
            Text('Email: $customerEmail'),
            SizedBox(height: 20),

            // Total harga
            Text(
              'Total yang harus dibayar: Rp ${getTotalPrice()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () => _showPaymentSuccess(context),
                child: Text('Bayar Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
