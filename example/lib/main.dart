import 'package:flutter/material.dart';
import 'package:theone_book_designer/theone_book_designer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The One Book Designer Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Book Page Animation Example'),
        ),
        body: const TheOneBookDesigner(
          imageUrls: [
            'https://picsum.photos/160/180?random=1',
            'https://picsum.photos/160/180?random=2',
            'https://picsum.photos/160/180?random=3'
          ],
        ),
      ),
    );
  }
}
