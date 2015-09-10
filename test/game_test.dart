library brawl.test;

import 'package:brawl/brawl.dart';
import 'package:test/test.dart';

void main() {
  group('Game', () {
    var game = new Game();
    var mauno;
    var jonne;

    group('Initialization', () {
      test('should have an empty players array upon ', () {
        expect(game.players, equals([]));
      });
    });

    group('Events', () {
      test('should accept new players', () {
        mauno = new Player("Mauno", game);
        jonne = new Player("Jonne", game);
        expect(game.players.length, equals(2));
      });

      test('should emit events on turn end', () {
        game.initialize();
        expect(game.currentPlayerIndex, equals(0));
        game.endTurn();
        expect(game.currentPlayerIndex, equals(1));
        game.endTurn();
        expect(game.currentPlayerIndex, equals(0));
        game.endTurn();
      });
    });

  });
}
