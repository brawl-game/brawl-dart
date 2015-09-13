library brawl.game_events;

import 'package:events/events.dart';
import "player.dart";
import "game.dart";

/// MARK: Game Events

/// A base class for all [GameEvent] subclasses.
class GameEvent extends Object with Events { }

/// Sent after characters are destroyed, damaged and after combat
class GameEventDeathCheck extends GameEvent { }

/// MARK: Player Events

/// Sent when a [Player]'s turn has started.
class GameEventTurnStart extends GameEvent {
  Player player;

  GameEventTurnStart(this.player);
}

/// Sent when a [Player]'s turn has ended.
class GameEventTurnEnd extends GameEvent {
  Player player;

  GameEventTurnEnd(this.player);
}

/// MARK: Combat Events

/// Generic two-way damage event between two characters
class GameEventDamage extends GameEvent {
  Character target;
  Character source;
  int amount;

  GameEventDamage(this.target, this.source, this.amount);
}

/// Sent after the [source] deals [amount] damage to [target]
class GameEventDamageDealt extends GameEventDamage {
  GameEventDamageDealt(Character target, Character source, int amount): super(target, source, amount);
}

/// Sent after the [target] takes [amount] damage from [source]
class GameEventDamageTaken extends GameEventDamage {
  GameEventDamageTaken(Character target, Character source, int amount): super(target, source, amount);
}
