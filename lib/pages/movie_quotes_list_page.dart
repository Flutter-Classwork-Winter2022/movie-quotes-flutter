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
    // final List<MovieQuoteRow> movieRows = [];
    // for (final moviequote in quotes) {
    //   movieRows.add(MovieQuoteRow(mq: moviequote));
    // }

    final List<MovieQuoteRow> movieRows = quotes.map((e) => MovieQuoteRow(mq: e)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Quotes")
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: movieRows,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("You pressed the FAB!");
          _dialogBuilder(context);
        },
        tooltip: 'Create',
        child: const Icon(Icons.add),
      ),
    );
  }


  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create a Movie Quote'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your quote',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your movie',
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Create'),
              onPressed: () {
                // TODO: Actually create the quote!

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}