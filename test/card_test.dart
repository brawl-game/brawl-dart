library brawl.test;

import 'package:brawl/brawl.dart';
import 'package:test/test.dart';

import 'dart:io';
import 'dart:convert';
import 'dart:async';

void main() {
  group('Card', () {
    /// load some cards
    var some_cards;

    setUp(() {
      var cardres = new Resource("package:brawl/res/some_cards.json");
      var cardfuture = cardres.readAsString();
      return cardfuture.then((carddata) =>
          some_cards = new JsonDecoder().convert(carddata));
    });

    var collection = new Collection();

    group('parse', () {
      test('should parse a simple card', () {
        var card = collection.parseCard(some_cards[0]);
        expect(card, isNotNull);
      });
    });
  });
}
