// Copyright (c) 2015, Nico Hämäläinen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library brawl.example;

import 'package:brawl/brawl.dart';
import 'package:logging/logging.dart';

main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  // Set up a new game
  final game = new Game();

  // Create some players
  final mauno = new Player("Mauno", game);
  final jonne = new Player("Jonne", game);
  game.players.add(mauno);
  game.players.add(jonne);

  mauno.on(GameEventTurnEnd, (_) {
    print("Maunon vuoro on nyt ohi. ayy.");
  });

  final slime = new Character("Slime", 1, 2, game);
  final blimp = new Character("Blimp", 1, 3, game);

  slime.dealDamage(1, blimp);

  // Prepare the game
  game.initialize();

  // Some turns
  game.endTurn();
  game.endTurn();
}
