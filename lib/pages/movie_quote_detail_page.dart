import 'package:flutter/material.dart';

import '../models/movie_quote.dart';

class MovieQuoteDetailPage extends StatefulWidget {
  final MovieQuote mq;

  const MovieQuoteDetailPage({Key? key, required this.mq}) : super(key: key);

  @override
  State<MovieQuoteDetailPage> createState() => _MovieQuoteDetailPageState();
}

class _MovieQuoteDetailPageState extends State<MovieQuoteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Quotes"),
        actions: [
          IconButton(
              onPressed: () {
                print("You clicked Edit!");
              },
              icon: const Icon(Icons.edit)
          ),
          IconButton(
              onPressed: () {
                print("You clicked Delete!");
                // HW - make a snackbar
                const snackBar = SnackBar(content: Text("Yay! A snackbar~"),);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                title: "Quote",
                content:  widget.mq.quote,
                iconData: Icons.format_quote_outlined,
            ),
            LabelledTextDisplay(
              title: "Movie",
              content:  widget.mq.movie,
              iconData: Icons.movie_filter_outlined,
            ),
          ],
        ),
      )
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

