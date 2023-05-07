import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'movie_rating.dart';
class TrendingItem extends StatefulWidget {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final int voteCount;
  final double voteAverage;

  const TrendingItem(
      {required this.id,
      this.title = 'Default Title',
      this.posterPath = '',
      this.overview = '',
      this.voteCount = 0,
      this.voteAverage = 0.0,
      Key? key})
      : super(key: key);

  @override
  State<TrendingItem> createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  bool isFavorite = false;
  double ratingPoint() {
    if(widget.voteAverage <= 1){
      return 0;
    }else if(widget.voteAverage <= 3) {
      return 1;
    }else if(widget.voteAverage <= 5) {
      return 2;
    }else if(widget.voteAverage <= 7) {
      return 3;
    }else if(widget.voteAverage <= 9) {
      return 4;
  }else {
      return 5;
    }
  }
  String formatString(int num) {
    String str = num.toString();
    if (str.length < 4) {
      return str.padLeft(4);
    }
    return str;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/detail',
          arguments: widget.id,
        );
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          margin: const EdgeInsets.only(left: 18, right: 10, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 0.7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${widget.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      MovieRating(voteAverage: widget.voteAverage),
                      SizedBox(height: 10,),
                      Expanded(
                        child: Text(
                          widget.overview,
                          maxLines: MediaQuery.of(context).size.height < 600 ? 2 : 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  }, icon: Icon(Icons.favorite,size: 16, color: isFavorite ? Color(0xFFBB7152) : Color(0xFFC1AEA6),)),
                  Text(
                    isFavorite ? formatString(widget.voteCount + 1) : formatString(widget.voteCount),
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
