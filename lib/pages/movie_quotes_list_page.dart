import 'package:flutter/material.dart';
import 'package:movie_quotes_flutter/components/movie_quote_row_component.dart';

import '../models/movie_quote.dart';

class MovieQuotesListPage extends StatefulWidget {
  const MovieQuotesListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MovieQuotesListPageState();
  }

}

class _MovieQuotesListPageState extends State<MovieQuotesListPage> {
  final quotes = <MovieQuote>[]; // Later, we will remove this and use the firestore

  @override
  void initState() {
    super.initState();
    quotes.add(
        MovieQuote(
            quote: "I'll be back",
            movie: "The Terminator"
        ));
    quotes.add(
        MovieQuote(
            quote: "You killed my father, prepare to die.",
            movie: "The Princess Bride"
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Quotes")
      ),
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          MovieQuoteRow(mq: quotes[0]),
          MovieQuoteRow(mq: quotes[1])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("You pressed the FAB!");
        },
        tooltip: 'Create',
        child: const Icon(Icons.add),
      ),
    );
  }}