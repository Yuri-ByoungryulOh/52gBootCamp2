import 'package:flutter/material.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ItemListPage')),
      body: const Center(
        child: Text(
          'ItemListPage',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
