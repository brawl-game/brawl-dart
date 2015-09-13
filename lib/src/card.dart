library brawl.card;

/// Card feature
class Feature extends Object {
  String name;

  Feature(this.name);
}

/// Generic card
class Card extends Object {
  String name;
  List<Feature> features;

  Card(this.name) {
    this.features = [];
  }
}

/// Card that can spawn a Creature to enter the board
class CreatureCard extends Card {
  /// Base Attack Value
  num attack;
  /// Base Health Value
  num health;

  CreatureCard(String name, this.attack, this.health) : super(name);
}

/// Collection of cards that decks can be formed from
class Collection extends Object {
  Collection() {
    this.cards = {};
  }

  /// Name-Card mapping of all cards in this Collection
  Map<String, Card> cards;

  /// attempts to parse a card data object into an appropriate Card subclass
  Card parseCard(cardData) {
    var card = null;
    if (!cardData.containsKey("name")) {
      return null;
    }

    if (this.cards.containsKey(cardData["name"])) {
      return null;
    }

    if (cardData.containsKey("attack") && cardData.containsKey("health")) {
      card = new CreatureCard(cardData["name"], cardData["attack"], cardData["health"]);
    }

    if (cardData.containsKey("features")) {
      for (var featureData in cardData["features"]) {
        if (!featureData.containsKey("name")) {
          // TODO log/fail when finding invalid data
          continue;
        }
        if (featureData["name"] == "Taunt") {
          // TODO handle all simple features here
          card.features.add(new Feature("Taunt"));
        }
        // TODO special case all more complicated features here
      }
    }

    if (card != null) {
      this.cards[card.name] = card;
    }

    return card;
  }

}