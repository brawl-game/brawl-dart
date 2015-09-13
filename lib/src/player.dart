library brawl.player;

import 'package:events/events.dart';
import "game_event.dart";
import "game.dart";
import "creature.dart";

/// A single player object
///
/// Represents a single player that can belong to a game.
/// Handles player-related actions and deck/hand/board manipulation.
class Player extends Object with Events {
  /// The user-chosen name of this Player.
  String name;

  /// The `Game` instance this Player belongs to.
  Game game;

  /// The opposing player object for this Player
  Player opponent;

  /// The amount of mana left for the current turn
  int mana;
  /// The amount of mana slots per turn
  int manaSlots;

  /// The current board of creatures for this player
  List<Creature> board = [];

  /// The current hand of cards for this player
  /// TODO: Change this to Card when Card object is done.
  List<Object> hand = [];

  /// Create a new player with a given [name] that belongs to [game].
  Player(String name, Game game) {
    this.name = name;
    this.game = game;

    // TODO: Rulesets define the default values (these are set in [Game])
    this.mana = 0;
    this.manaSlots = 0;

    game.players.add(this);
  }

  // MARK: Mana Handling

  /// Gives an [amount] of mana this turn
  void gainMana(int amount) =>
    this.mana = Math.min(this.maxMana, this.mana + amount);

  /// Gives an [amount] of mana slots
  void gainManaSlots(int amount) =>
    this.manaSlots = Math.min(10, this.manaSlots + amount);

  /// Destroys an [amount] of mana slots
  void destroyManaSlots(int amount) {
    this.manaSlots = Math.max(0, this.manaSlots - amount);
    if (this.mana > this.manaSlots)
      this.mana = this.manaSlots;
  }
}