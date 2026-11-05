import 'package:flutter/material.dart';

/// Tombol favorit. Stateful karena menyimpan data yang berubah (_favorit).
/// Dibuat sekecil mungkin supaya hanya bagian ini yang dibangun ulang.
class TombolFavorit extends StatefulWidget {
  const TombolFavorit({super.key, required this.namaMenu});

  final String namaMenu;

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool _favorit = false; // state: data yang dapat berubah

  void _ganti() {
    setState(() => _favorit = !_favorit); // beri tahu Flutter agar build ulang

    final pesan = _favorit
        ? '${widget.namaMenu} ditambahkan ke favorit'
        : '${widget.namaMenu} dihapus dari favorit';
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;

    return IconButton(
      tooltip: _favorit ? 'Hapus dari favorit' : 'Tambah ke favorit',
      onPressed: _ganti,
      icon: Icon(
        _favorit ? Icons.favorite : Icons.favorite_border,
        color: _favorit ? skema.error : null,
      ),
    );
  }
}