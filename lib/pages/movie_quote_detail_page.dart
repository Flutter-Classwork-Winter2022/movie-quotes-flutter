import 'package:flutter/material.dart';

class MovieQuoteDetailPage extends StatefulWidget {
  const MovieQuoteDetailPage({Key? key}) : super(key: key);
  

  @override
  State<MovieQuoteDetailPage> createState() => _MovieQuoteDetailPageState();
}

class _MovieQuoteDetailPageState extends State<MovieQuoteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Movie Quotes")
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text("Detail page"),
      ),
    );
  }
}
