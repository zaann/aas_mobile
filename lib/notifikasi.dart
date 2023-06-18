import 'package:flutter/material.dart';

enum NotifikasiType { banjir, gempaBumi, potensiBencana }

class Notifikasi {
  final NotifikasiType type;
  final String tempat;
  final String rumahTerdampak;
  final String kedalaman;
  final String kekuatan;

  Notifikasi({
    required this.type,
    required this.tempat,
    required this.rumahTerdampak,
    required this.kedalaman,
    required this.kekuatan,
  });
}

class NotifikasiPage extends StatefulWidget {
  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  List<Notifikasi> _notifikasiList = [
    Notifikasi(
      type: NotifikasiType.banjir,
      tempat: 'Jakarta',
      rumahTerdampak: '1000 rumah',
      kedalaman: '1.5 meter',
      kekuatan: '-',
    ),
    Notifikasi(
      type: NotifikasiType.gempaBumi,
      tempat: 'Bali',
      rumahTerdampak: '200 rumah',
      kedalaman: '-',
      kekuatan: '5.5 SR',
    ),
    Notifikasi(
      type: NotifikasiType.potensiBencana,
      tempat: 'Bandung',
      rumahTerdampak: '-',
      kedalaman: '-',
      kekuatan: '-',
    ),
    Notifikasi(
      type: NotifikasiType.banjir,
      tempat: 'Surabaya',
      rumahTerdampak: '800 rumah',
      kedalaman: '1 meter',
      kekuatan: '-',
    ),
    Notifikasi(
      type: NotifikasiType.gempaBumi,
      tempat: 'Yogyakarta',
      rumahTerdampak: '50 rumah',
      kedalaman: '-',
      kekuatan: '6.0 SR',
    ),
    Notifikasi(
      type: NotifikasiType.potensiBencana,
      tempat: 'Medan',
      rumahTerdampak: '-',
      kedalaman: '-',
      kekuatan: '-',
    ),
  ];

  NotifikasiType _selectedType = NotifikasiType.banjir;

  List<Notifikasi> get _filteredNotifikasiList => _notifikasiList
      .where((notifikasi) => notifikasi.type == _selectedType)
      .toList();

  IconData _getIconByNotifikasiType(NotifikasiType type) {
    switch (type) {
      case NotifikasiType.banjir:
        return Icons.warning;
      case NotifikasiType.gempaBumi:
        return Icons.whatshot;
      case NotifikasiType.potensiBencana:
        return Icons.dangerous;
      default:
        return Icons.warning;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 56.0,
              child: BottomNavigationBar(
                currentIndex: _selectedType.index,
                onTap: (index) {
                  setState(() {
                    _selectedType = NotifikasiType.values[index];
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    label: 'Banjir',
                    icon: Icon(Icons.warning),
                  ),
                  BottomNavigationBarItem(
                    label: 'Gempa Bumi',
                    icon: Icon(Icons.whatshot),
                  ),
                  BottomNavigationBarItem(
                    label: 'Potensi Bencana',
                    icon: Icon(Icons.dangerous),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredNotifikasiList.length,
                itemBuilder: (context, index) {
                  final notifikasi = _filteredNotifikasiList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(notifikasi.tempat),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.0),
                          if (notifikasi.rumahTerdampak != '-')
                            Text(notifikasi.rumahTerdampak),
                          if (notifikasi.kedalaman != '-')
                            Text(notifikasi.kedalaman),
                          if (notifikasi.kekuatan != '-')
                            Text(notifikasi.kekuatan),
                        ],
                      ),
                      leading: Icon(_getIconByNotifikasiType(notifikasi.type)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
