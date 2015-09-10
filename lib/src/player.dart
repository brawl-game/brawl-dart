library brawl.player;

import 'package:events/events.dart';
import "game_events.dart";
import "game.dart";

/// A single player object
///
/// Represents a single player that can belong to a game.
/// Handles player-related actions and deck/hand/board manipulation.
class Player extends Object with Events {
  /// The user-chosen name of this Player.
  String name;
  /// The `Game` instance this Player belongs to.
  Game game;

  /// Create a new player with a given [name] that belongs to [game].
  Player(String name, Game game) {
    this.name = name;
    this.game = game;
    this.game.players.add(this);
    this.bindEvents();
  }

  bindEvents() {
    this.on(GameEventTurnEnd).listen((GameEventTurnEnd e) {
      print("${this.name}'s turn ended.");
    });

    this.on(GameEventTurnStart).listen((GameEventTurnStart e) {
      print("${this.name}'s turn started.");
    });
  }
}