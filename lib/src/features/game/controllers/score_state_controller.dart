import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreStateController extends StateNotifier<double> {
  ScoreStateController() : super(0);

  void setNewScore(double newscore) {
    state = state+newscore;
  }
}

final scoreStateControllerProvider =
    StateNotifierProvider<ScoreStateController, double>((ref) {
  return ScoreStateController();
});
