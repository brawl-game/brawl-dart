// Copyright (c) 2015, Nico Hämäläinen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library brawl.example;

import 'package:brawl/brawl.dart' as Brawl;

main() {
  // Set up a new game
  final game = new Brawl.Game();

  // Create some players
  final mauno = new Brawl.Player("Mauno", game);
  final jonne = new Brawl.Player("Jonne", game);

  // Prepare the game
  game.initialize();
}
