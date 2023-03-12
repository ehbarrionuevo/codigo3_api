import 'package:flutter/material.dart';

class ItemHomeWidget extends StatelessWidget {
  String title;
  String subtitle;
  Widget toPage;
  ItemHomeWidget({
    required this.title,
    required this.subtitle,
    required this.toPage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => toPage));
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
