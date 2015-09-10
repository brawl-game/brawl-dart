library brawl.test;

import 'package:brawl/brawl.dart';
import 'package:test/test.dart';

void main() {
  group('Game', () {
    Game game;

    setUp(() {
      game = new Game();
    });

    group('Initialization', () {
      test('should have an empty players array upon ', () {
        expect(game.players, equals([]));
      });
    });

    group('Preparations', () {
      test('should emit events on turn end', () {
        game.initialize();
        expect(game.currentPlayerIndex, equals(1));
      });
    });

  });
}
