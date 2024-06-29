import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreStateController extends StateNotifier<double> {
  ScoreStateController() : super(0);

  void setNewScore(double newscore) async {
    var db = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    state = state + newscore;

    var query = await db
        .collection("users")
        .where("userId", isEqualTo: user!.uid)
        .get();

    final dataQuery = query.docs;

    await dataQuery[0].reference.update({"totalScore": state});
  }

  void resetScore() async {
    var db = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    state = 0;

    var query = await db
        .collection("users")
        .where("userId", isEqualTo: user!.uid)
        .get();

    final dataQuery = query.docs;

    await dataQuery[0].reference.update({"totalScore": state});
  }
}

final scoreStateControllerProvider =
    StateNotifierProvider<ScoreStateController, double>((ref) {
  return ScoreStateController();
});
