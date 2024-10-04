import 'package:flutter/material.dart';
import 'package:kuis_prak_mobile/pembayaran.dart';

class PemesananPage extends StatefulWidget {
  final String hotelName;
  final String imageUrl;
  final int pricePerNight;

  const PemesananPage({
    Key? key,
    required this.hotelName,
    required this.imageUrl,
    required this.pricePerNight,
  }) : super(key: key);

  @override
  _PemesananPageState createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _totalKamarController = TextEditingController();
  final TextEditingController _totalMalamController = TextEditingController();

  void _navigateToPayment() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PembayaranPage(
            hotelName: widget.hotelName,
            pricePerNight: widget.pricePerNight,
            totalKamar: int.parse(_totalKamarController.text),
            totalMalam: int.parse(_totalMalamController.text),
            customerName: _nameController.text,
            customerEmail: _emailController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan ${widget.hotelName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.imageUrl, height: 200, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                widget.hotelName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('Harga per malam: Rp ${widget.pricePerNight}'),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Nama Lengkap'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama lengkap wajib diisi';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email wajib diisi';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _totalKamarController,
                      decoration: InputDecoration(labelText: 'Total Kamar'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Total kamar wajib diisi';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _totalMalamController,
                      decoration: InputDecoration(labelText: 'Total Malam'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Total malam wajib diisi';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _navigateToPayment,
                      child: Text('Pesan Sekarang'),
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
