import 'package:flutter/material.dart';

class GenreGridView extends StatelessWidget {
  final List<String> strings;

  const GenreGridView({super.key, required this.strings});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 3.0,
      ),
      itemCount: strings.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 5.0),
          decoration: BoxDecoration(
            color: const Color(0xFFC4C4C4),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              strings[index],
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
