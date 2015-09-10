// Copyright (c) 2015, Nico Hämäläinen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library brawl.example;

import 'package:brawl/brawl.dart' as Brawl;
import 'package:logging/logging.dart';

main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  // Set up a new game
  final game = new Brawl.Game();

  // Create some players
  final mauno = new Brawl.Player("Mauno", game);
  final jonne = new Brawl.Player("Jonne", game);
  game.players.add(mauno);
  game.players.add(jonne);

  // Prepare the game
  game.initialize();

  game.endTurn();
  game.endTurn();
}
