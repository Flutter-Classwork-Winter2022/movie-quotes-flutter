import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie_quote.dart';

class MovieQuotesCollectionManager {
  List<MovieQuote> latestMovieQuotes = [];
  final CollectionReference _ref;

  MovieQuotesCollectionManager._privateConstructor() : _ref = FirebaseFirestore.instance.collection(kMovieQuoteCollectionPath);

  static final MovieQuotesCollectionManager instance = MovieQuotesCollectionManager._privateConstructor();

  StreamSubscription startListening(Function() observer) {
    return _ref
        .orderBy(kMovieQuote_lastTouched, descending: true)
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
          print(querySnapshot.docs);
    });
  }

  // TODO: Make a stop listening function
}