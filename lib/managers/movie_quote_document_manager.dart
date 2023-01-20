import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/movie_quote.dart';

class MovieQuotesDocumentManager {
  MovieQuote? latestMovieQuote;
  final CollectionReference _ref;

  MovieQuotesDocumentManager._privateConstructor() : _ref = FirebaseFirestore.instance.collection(kMovieQuoteCollectionPath);

  static final MovieQuotesDocumentManager instance = MovieQuotesDocumentManager._privateConstructor();

  StreamSubscription startListening(String documentId, Function() observer) {
    return _ref.doc(documentId)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
          latestMovieQuote = MovieQuote.from(documentSnapshot);
          observer();
          print(latestMovieQuote);
    });
  }

  // TODO: Make a stop listening function
  void stopListening(StreamSubscription subscription) {
    subscription?.cancel();
  }


  void updateLatestMovieQuote({required String quote, required String movie}) {
    if (latestMovieQuote == null) {
      return;
    }
    _ref.doc(latestMovieQuote!.documentId!)
        .update({
          kMovieQuote_quote: quote,
          kMovieQuote_movie: movie,
          kMovieQuote_lastTouched: Timestamp.now(),
        })
        .catchError((error) => print("Failed to update movie quote, error: $error"));
  }

  void deleteLatestMovieQuote() {
    if (latestMovieQuote == null) {
      return;
    }

    _ref.doc(latestMovieQuote!.documentId!).delete();
  }

}