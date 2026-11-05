import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu_umkm/tombol_favorit.dart';

void main() {
  testWidgets('Ikon favorit berganti saat diketuk dan SnackBar muncul', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: TombolFavorit(namaMenu: 'Mie Gomak')),
      ),
    );

    // Awal: belum favorit.
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);

    // Ketuk: menjadi favorit dan SnackBar tampil.
    await tester.tap(find.byType(IconButton));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 750));
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsNothing);
    expect(find.text('Mie Gomak ditambahkan ke favorit'), findsOneWidget);

    // Ketuk lagi: kembali ke awal.
    await tester.tap(find.byType(IconButton));
    await tester.pump();
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
  });
}