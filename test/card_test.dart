library brawl.test;

import 'package:brawl/brawl.dart';
import 'package:guinness/guinness.dart';

import 'dart:convert';

void main() {
  describe('Card', () {
    var some_cards;
    var collection;

    beforeEach(() {
      var cardres = new Resource("package:brawl/res/some_cards.json");
      var cardfuture = cardres.readAsString();
      collection = new Collection();
      return cardfuture.then((carddata) =>
          some_cards = new JsonDecoder().convert(carddata));
    });

    describe("parsing", () {

      it('should parse a simple card', () {
        var card = collection.parseCard(some_cards[0]);
        expect(card).toBeNotNull();
      });
      it("doesn't parse the same named card twice", () {
        var card = collection.parseCard(some_cards[0]);
        var card2 = collection.parseCard(some_cards[0]);
        expect(card2).toBeNull();
      });
      it('puts a card on collection', () {
        var card = collection.parseCard(some_cards[0]);
        expect(collection.cards.length).toEqual(1);
      });
      it('puts the card on collection on key', () {
        var card = collection.parseCard(some_cards[0]);
        expect(collection.cards[card.name]).toEqual(card);
      });
    });

    describe("feature", () {
      it('works for taunt', () {
        var card = collection.parseCard(some_cards[1]);
        expect(card.features.length).toEqual(1);
      });
    });
  });
}
