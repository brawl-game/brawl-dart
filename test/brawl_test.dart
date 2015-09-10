// Copyright (c) 2015, Nico Hämäläinen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library brawl.test;

import 'package:brawl/brawl.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Awesome awesome;

    setUp(() {
      awesome = new Awesome();
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
