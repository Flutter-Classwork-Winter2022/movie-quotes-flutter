import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_quotes_flutter/managers/movie_quote_document_manager.dart';

import '../models/movie_quote.dart';

class MovieQuoteDetailPage extends StatefulWidget {
  final String documentId;

  const MovieQuoteDetailPage({Key? key, required this.documentId}) : super(key: key);

  @override
  State<MovieQuoteDetailPage> createState() => _MovieQuoteDetailPageState();
}

class _MovieQuoteDetailPageState extends State<MovieQuoteDetailPage> {
  final editMovieTextController = TextEditingController();
  final editQuoteTextController = TextEditingController();

  late StreamSubscription movieQuoteSubscription;

  @override
  void initState() {
    super.initState();
    movieQuoteSubscription = MovieQuotesDocumentManager.instance.startListening(
      widget.documentId,
        () {
          setState(() {
            print("");
          });
        }
    );
  }

  @override
  void dispose() {
    editMovieTextController.dispose();
    editQuoteTextController.dispose();
    MovieQuotesDocumentManager.instance.stopListening(movieQuoteSubscription);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Quotes"),
        actions: [
          IconButton(
              onPressed: () {
                print("You clicked Edit!");
                _editDialogBuilder(context);
              },
              icon: const Icon(Icons.edit)
          ),
          IconButton(
              onPressed: () {
                print("You clicked Delete!");
                // HW - make a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Deleted quote"),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          print("Figure out how to UNDO");
                        },
                      ),
                    )
                );
                MovieQuotesDocumentManager.instance.deleteLatestMovieQuote();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete)
          ),
          const SizedBox(
            width: 40.0,
          )
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            LabelledTextDisplay(
                title: "Quote:",
                content:  MovieQuotesDocumentManager.instance.latestMovieQuote?.quote ?? "",
                iconData: Icons.format_quote_outlined,
            ),
            LabelledTextDisplay(
              title: "Movie:",
              content:  MovieQuotesDocumentManager.instance.latestMovieQuote?.movie ?? "",
              iconData: Icons.movie_filter_outlined,
            ),
          ],
        ),
      )
    );
  }

  Future<void> _editDialogBuilder(BuildContext context) {
    editMovieTextController.text = MovieQuotesDocumentManager.instance.latestMovieQuote?.movie ?? "";
    editQuoteTextController.text = MovieQuotesDocumentManager.instance.latestMovieQuote?.quote ?? "";

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit your Movie Quote'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: editQuoteTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Edit your quote',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: editMovieTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Edit your movie',
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
              child: const Text('Save Changes'),
              onPressed: () {
                setState(() {
                  MovieQuotesDocumentManager.instance.updateLatestMovieQuote(
                      quote: editQuoteTextController.text,
                      movie: editMovieTextController.text
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LabelledTextDisplay extends StatelessWidget {
  final String title;
  final String content;
  final IconData iconData;

  const LabelledTextDisplay({Key? key, required this.title, required this.content, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w800,
              // fontFamily: "Caveat",
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(iconData),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Flexible(
                      child: Text(
                        content,
                        style: const TextStyle(
                          fontSize: 18.0,
                          // fontWeight: FontWeight.w600,
                        ),
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

