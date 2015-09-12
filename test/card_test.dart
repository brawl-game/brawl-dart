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
    var collection;

    setUp(() {
      var cardres = new Resource("package:brawl/res/some_cards.json");
      var cardfuture = cardres.readAsString();
      collection = new Collection();
      return cardfuture.then((carddata) =>
          some_cards = new JsonDecoder().convert(carddata));
    });

    /// initial sanity checks
    group('parse', () {
      test('accepts simple card', () {
        var card = collection.parseCard(some_cards[0]);
        expect(card, isNotNull);
      });
      test('puts card on collection', () {
        var card = collection.parseCard(some_cards[0]);
        expect(collection.cards.length, equals(1));
      });
      test('puts some card on collection on key', () {
        var card = collection.parseCard(some_cards[0]);
        expect(collection.cards[card.name], isNotNull);
      });
      test('puts the card on collection on key', () {
        var card = collection.parseCard(some_cards[0]);
        expect(collection.cards[card.name], equals(card));
      });
    });

    group("feature", () {
      test('works for taunt', () {
        var card = collection.parseCard(some_cards[1]);
        expect(card.features.length, equals(1));
      });
    });
  });
}
