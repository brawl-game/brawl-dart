library brawl.test;

import 'package:brawl/brawl.dart';
import 'package:guinness/guinness.dart';

import 'dart:convert';

void main() {
  describe('Card', () {
    var some_cards;

    beforeEach(() {
      var cardres = new Resource("package:brawl/res/some_cards.json");
      var cardfuture = cardres.readAsString();
      return cardfuture.then((carddata) =>
          some_cards = new JsonDecoder().convert(carddata));
    });

    describe("parsing", () {
      var collection = new Collection();

      it('should parse a simple card', () {
        var card = collection.parseCard(some_cards[0]);
        expect(card).toBeNotNull();
      });
    });
  });
}
