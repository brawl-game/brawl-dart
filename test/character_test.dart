library brawl.test;

import 'package:brawl/brawl.dart';
import 'package:guinness/guinness.dart';

void main() {
  describe('Character', () {
    var game, slime, blimp;

    beforeEach(() {
      game  = new Game();
      slime = new Character("Slime", 1, 2, game);
      blimp = new Character("Blimp", 1, 3, game);
    });

    describe('Combat', () {
      it('should return damaged status correctly', () {
        expect(slime.isDamaged()).toBeFalsy();
        slime.hitpoints -= 1;
        expect(slime.isDamaged()).toBeTruthy();
      });

      it('should handle taking damage', () {
        blimp.attackCharacter(slime);
        expect(slime.hitpoints).toEqual(1);
        expect(blimp.hitpoints).toEqual(2);
      });
    });
  });
}
