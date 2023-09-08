import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ItemDetailPage')),
      body: const Center(
        child: Text(
          'ItemDetailPage',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
