import 'dart:math';

import 'package:wordquest/src/features/game/data/dummy_data.dart';

class GameRepo {
  GameRepo._();

  static final GameRepo _instance = GameRepo._();

  static GameRepo get instance => _instance;

  Map getWord() {
    List listOfWords = mockWords;
    final random = Random();
    int randomIndex = random.nextInt(listOfWords.length);
    return listOfWords[randomIndex];
  }
}
