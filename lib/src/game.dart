library brawl.game;

import 'package:events/events.dart';
import 'package:logging/logging.dart';
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

  Game() {}

  /// Returns the currently active [Player] instance.
  Player currentPlayer() =>
    this.players[this.currentPlayerIndex];

  /// Returns the opponent for the currently active [Player].
  Player currentOpponent() =>
    this.players[this.nextPlayerIndex()];

  /// Returns the next-in-line player's index in the [players] array.
  int nextPlayerIndex() =>
    (this.currentPlayerIndex + 1) % (this.players.length);

  /// Prepares the game to begin.
  void initialize() {
    // TODO: Game.initialize() PRE_GAME_INIT hook and events.
    this.startTurn();
    // TODO: Game.initialize() POST_GAME_INIT hook and events.
  }

  void startTurn() {
    // Get current player
    var currentPlayer = this.currentPlayer();

    // Emit start of turn events
    var event = new GameEventTurnStart(currentPlayer); this.emit(event);

    // TODO: Game.startTurn() TURN_STARTED hook and events.

  }

  void endTurn() {
    // Emit events
    final event = new GameEventTurnEnd(this.currentPlayer());
    this.emit(event);
    // TODO: Game.entTurn() TURNN_ENDED

    // Start next turn
    this.currentPlayerIndex = this.nextPlayerIndex();
    this.startTurn();
  }
}