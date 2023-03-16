import 'package:flutter/material.dart';
import 'package:sqrreader/src/pages/direcciones_page.dart';
import 'package:sqrreader/src/pages/mapas_pages.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _crearFloatingActionButton(),
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return const MapasPages();
      case 1:
        return const DireccionesPage();
      default:
        return const MapasPages();
    }
  }

  Widget _crearBottonNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: ('Mapas')),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), label: ('Direcciones')),
      ],
    );
  }

  Widget _crearFloatingActionButton() {
    return FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor);
  }

  _scanQR() async {
    String futureString = '';
    try {
      futureString = await QRCodeReader().scan();
    } catch (e) {
      futureString = e.toString();
    }
    print('futureString: $futureString');
    if (futureString != null) {
      print('Tenemos informacion');
    }
  }
}
