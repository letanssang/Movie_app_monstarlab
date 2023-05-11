import 'package:flutter/material.dart';

class InformationHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget movieInformation;
  final double height;

  InformationHeaderDelegate(
      {required this.movieInformation, required this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return movieInformation;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(InformationHeaderDelegate oldDelegate) {
    return true;
  }
}
