library brawl.game;

import 'package:events/events.dart';
import "game_event.dart";
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
    /// Run death checks for all creatures after damage events
    this.on(GameEventDeathCheck, (e) {
      print("Implement death check.");
    });
  }

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
    var event = new GameEventTurnStart(currentPlayer);
    currentPlayer.emit(event);
    this.emit(event);
  }

  void endTurn() {
    // Send the GameEventTurnEnd events
    final player = this.currentPlayer();
    final event  = new GameEventTurnEnd(player);
    player.emit(event);
    this.emit(event);

    // Switch to next player and start their turn
    this.currentPlayerIndex = this.nextPlayerIndex();
    this.startTurn();
  }
}