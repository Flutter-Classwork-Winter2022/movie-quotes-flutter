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
          latestMovieQuotes = querySnapshot.docs.map((doc) => MovieQuote.from(doc)).toList();
          observer();
          print(latestMovieQuotes);
    });
  }

  // TODO: Make a stop listening function
  void stopListening(StreamSubscription subscription) {
    subscription?.cancel();
  }


  Future<void> add({required String quote, required String movie}) {
    return _ref.add({
      kMovieQuote_quote: quote,
      kMovieQuote_movie: movie,
      kMovieQuote_lastTouched: Timestamp.now(),
    })
        .then((DocumentReference docRef) => print("MovieQuote added with id ${docRef.id}"))
        .catchError((error) => print("Failed to add movie quote, error: $error"));
  }

}