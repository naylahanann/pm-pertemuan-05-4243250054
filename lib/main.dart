// Tugas Rutin 5: Menu UMKM Kuliner
// Nama: Nayla Luthfiah Hanan  NIM: 4243250054
import 'package:flutter/material.dart';
import 'package:menu_umkm/kartu_menu.dart';

void main() {
  runApp(const MenuApp());
}

/// Widget akar: mengatur tema terang dan gelap dari satu warna seed.
class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  // Satu-satunya warna yang ditulis langsung; semua warna lain dibaca
  // dari Theme.of(context).colorScheme.
  static const _seed = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu UMKM Kuliner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed)),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system, // mengikuti pengaturan terang/gelap sistem
      home: const HalamanMenu(),
    );
  }
}

/// Halaman utama: Scaffold dengan ListView berisi header, kontak, dan menu.
class HalamanMenu extends StatelessWidget {
  const HalamanMenu({super.key});

  // Data fiktif, ganti dengan UMKM pilihan Anda.
  static const _menu = <ItemMenu>[
    ItemMenu(nama: 'Mie Gomak', harga: 25000, kategori: 'Makanan'),
    ItemMenu(nama: 'Soto Medan', harga: 22000, kategori: 'Makanan'),
    ItemMenu(nama: 'Kopi Sidikalang', harga: 15000, kategori: 'Minuman'),
    ItemMenu(nama: 'Bika Ambon', harga: 18000, kategori: 'Camilan'),
  ];

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu UMKM Kuliner'),
        backgroundColor: skema.primaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const HeaderUmkm(),
          const SizedBox(height: 16),
          const KartuKontak(),
          const SizedBox(height: 16),
          Text('Menu', style: teks.titleLarge),
          const SizedBox(height: 8),
          for (final item in _menu) KartuMenu(item: item),
        ],
      ),
    );
  }
}

/// Header: gambar dan nama usaha. Jika gambar gagal dimuat, tampil ikon.
class HeaderUmkm extends StatelessWidget {
  const HeaderUmkm({super.key});

  // Ganti dengan foto warung Anda (Image.asset + daftar di pubspec.yaml).
  static const _urlGambar = 'https://picsum.photos/800/400';

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            _urlGambar,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 180,
              width: double.infinity,
              color: skema.primaryContainer,
              child: Icon(
                Icons.restaurant,
                size: 64,
                color: skema.onPrimaryContainer,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text('Kedai Rasa Medan', style: teks.headlineSmall),
        Text('Masakan rumahan khas Medan', style: teks.bodyMedium),
      ],
    );
  }
}

/// Card kontak berisi tiga ListTile yang dipisah Divider.
class KartuKontak extends StatelessWidget {
  const KartuKontak({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('0812-3456-7890'),
            subtitle: Text('Telepon / WhatsApp'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Jl. Contoh No. 1, Medan'),
            subtitle: Text('Alamat'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('08.00 - 21.00 WIB'),
            subtitle: Text('Jam buka'),
          ),
        ],
      ),
    );
  }
}