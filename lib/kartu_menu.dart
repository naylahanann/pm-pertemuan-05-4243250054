import 'package:flutter/material.dart';
import 'package:menu_umkm/tombol_favorit.dart';

/// Data satu menu. Immutable, jadi boleh dibuat dengan const.
class ItemMenu {
  const ItemMenu({
    required this.nama,
    required this.harga,
    required this.kategori,
  });

  final String nama;
  final int harga;
  final String kategori;
}

/// Mengubah 25000 menjadi 'Rp25.000'.
String rupiah(int n) {
  final angka = n.toString().replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (m) => '.',
  );
  return 'Rp$angka';
}

/// Kartu satu menu. Stateless karena datanya tidak berubah;
/// bagian yang berubah (favorit) dipisah ke TombolFavorit.
class KartuMenu extends StatelessWidget {
  const KartuMenu({super.key, required this.item});

  final ItemMenu item;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.nama, style: teks.titleMedium),
                  const SizedBox(height: 4),
                  Text(rupiah(item.harga), style: teks.bodyLarge),
                  const SizedBox(height: 8),
                  Chip(label: Text(item.kategori)),
                ],
              ),
            ),
            TombolFavorit(namaMenu: item.nama),
          ],
        ),
      ),
    );
  }
}