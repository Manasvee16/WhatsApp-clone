import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final int id;
  final String title;
  final String body;

  const NewsDetailScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$id',
              style: TextStyle(fontSize: 18, ),
            ),
            SizedBox(height: 10),
            Text(
              '$title',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '$body',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
