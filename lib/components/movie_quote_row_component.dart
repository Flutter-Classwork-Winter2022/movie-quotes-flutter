import 'package:flutter/material.dart';
import '../models/movie_quote.dart';

class MovieQuoteRow extends StatelessWidget {
  final MovieQuote mq;
  const MovieQuoteRow({Key? key, required this.mq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      child: ListTile(
        leading: const Icon(Icons.movie),
        title: Text(
          mq.quote,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          mq.movie,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
