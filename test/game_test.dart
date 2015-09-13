library brawl.test;

import 'package:brawl/brawl.dart';
import 'package:guinness/guinness.dart';

void main() {
  describe('Game', () {
    var game, mauno, jonne;

    beforeEach(() {
      game = new Game();
      mauno = new Player("Mauno", game);
      jonne = new Player("Jonne", game);
    });
    describe('Events', () {
      it('should accept new players', () {
        expect(game.players.length).toEqual(2);
      });

      it('should emit events on turn end', () {
        game.initialize();
        expect(game.currentPlayerIndex).toEqual(0);
        game.endTurn();
        expect(game.currentPlayerIndex).toEqual(1);
        game.endTurn();
        expect(game.currentPlayerIndex).toEqual(0);
        game.endTurn();
      });
    });
  });
}
