import 'package:flutter/material.dart';
import '../models/movie_quote.dart';

class MovieQuoteRow extends StatelessWidget {
  final MovieQuote movieQuote;
  final Function() onTap;
  const MovieQuoteRow({Key? key, required this.movieQuote, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
        child: ListTile(
          leading: const Icon(Icons.movie),
          title: Text(
            movieQuote.quote,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            movieQuote.movie,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
