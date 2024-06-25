import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentWordController extends StateNotifier<Map> {
  CurrentWordController() : super({});

  void setNewWord(Map newWord) {
    state = newWord;
  }
}

final currentWordControllerProvider =
    StateNotifierProvider<CurrentWordController, Map>((ref) {
  return CurrentWordController();
});
