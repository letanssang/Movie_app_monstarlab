import 'package:flutter/material.dart';

class TextHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String text;

  TextHeaderDelegate(this.text);

  @override
  double get minExtent => 50;

  @override
  double get maxExtent => 50;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(TextHeaderDelegate oldDelegate) {
    return false;
  }
}
