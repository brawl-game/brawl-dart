library brawl.events;

import 'package:events/events.dart';
import "player.dart";

/// A base class for all [GameEvent] subclasses.
class GameEvent extends Object with Events {}

/// An event that is sent when a [Player]'s turn has started.
class GameEventTurnStart extends GameEvent {
  Player player;

  GameEventTurnStart(this.player);
}

///  An event that is sent when a [Player]'s turn has ended.
class GameEventTurnEnd extends GameEvent {
  Player player;

  GameEventTurnEnd(this.player);
}