library brawl.card;

/// Generic card
class Card extends Object {
  String name;
}

/// Card that can spawn a Creature to enter the board
class CreatureCard extends Card {
  /// Base Attack Value
  num attack;
  /// Base Health Value
  num health;

  CreatureCard(num attack, num health) {
    this.attack = attack;
    this.health = health;
  }
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
       card = new CreatureCard(cardData["attack"], cardData["health"]);
    }

    if (card != null) {
      this.cards[card.name] = card;
    }

    return card;
  }

}