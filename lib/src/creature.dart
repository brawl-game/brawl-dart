library brawl.creature;

import 'package:events/events.dart';
import 'package:logging/logging.dart';
import "game_event.dart";
import "game.dart";
import "player.dart";
import "character.dart";

class Creature extends Character {
  /// Create a Creature called [name] with [attack] attack and [hitpoints] hitpoints
  /// that belongs to [owner];
  Creature(String name, int attack, int hitpoints, Player owner): super(name, attack, hitpoints, owner.game) {
    this.controller = this.owner = owner;
  }
}