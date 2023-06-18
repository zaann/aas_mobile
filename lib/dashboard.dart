import 'package:flutter/material.dart';
import 'package:aas_mobile/pencarian.dart';
import 'package:aas_mobile/notifikasi.dart';
import 'package:aas_mobile/lihatbencana.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 40.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PencarianPage()),
                    );
                  },
                  icon: Icon(Icons.search),
                  label: Text('Cari'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 40.0,
                height: 40.0,
                child: FloatingActionButton(
                  heroTag: 'notifications',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotifikasiPage()),
                    );
                  },
                  child: Icon(Icons.notifications),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text('Isi halaman dashboard di sini'),
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100.0,
            height: 40.0,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LihatBencanaPage()),
                );
              },
              icon: Icon(Icons.warning),
              label: Text('Lihat Bencana'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
