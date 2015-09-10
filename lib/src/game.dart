library brawl.game;

import 'package:events/events.dart';
import "game_events.dart";
import "player.dart";

/// A single game in the brawl engine
///
/// Contains functionality for distributing events, handling player actions and enforcing rulesets.
class Game extends Object with Events {
  /// The players competing in this Game instance.
  List<Player> players = [];

  /// The currently active player's index in the [players] array.
  int currentPlayerIndex = 0;

  Game() {
    this.on(GameEventTurnStart).listen((GameEventTurnStart e) {
      print("Turn started!");
    });

    this.on(GameEventTurnEnd).listen((GameEventTurnEnd e) {
      print("Turn ended for ${e.player.name}!");
    });
  }

  /// Returns the currently active [Player] instance.
  Player currentPlayer() =>
    this.players[this.currentPlayerIndex];

  /// Returns the opponent for the currently active [Player].
  Player currentOpponent() =>
    this.players[this.nextPlayerIndex()];

  int nextPlayerIndex() =>
    this.currentPlayerIndex + 1 % this.players.length;

  /// Prepares the game to begin.
  void initialize() {
    // Set up starting player
    // Get the current player
    final endingTurnPlayer = this.currentPlayer();
    this.emit(new GameEventTurnEnd(endingTurnPlayer));
    this.currentPlayerIndex = this.nextPlayerIndex();
  }

  void startTurn() {
    final player = this.currentPlayer();
    final event  = new GameEventTurnEnd(player);
    player.emit(event);
  }

  void endTurn() {

  }
}