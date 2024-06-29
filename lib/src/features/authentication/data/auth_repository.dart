
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordquest/src/features/authentication/controller.dart/current_user_controller.dart';
import 'package:wordquest/src/features/authentication/data/user_model.dart';


class AuthRepository {
  /* The following are the local varables for the auth repository */


  Future<String> register(String email, String password, String username,
      ) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      User? user = userCredential.user;
      await FirebaseFirestore.instance.collection('users').add(UserModel(
              user!.uid,
              username.trim(),
              user.email,
              0.0,
              )
          .toJson());
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<String> signIn(String email, String password, WidgetRef ref) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      bool doneGettingUser = await getUser(ref);
      if (doneGettingUser) {
        return "success";
        
      } else {
        return "fail";
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
     
    }
  }

  Future<bool> getUser(WidgetRef ref) async {
    var db = FirebaseFirestore.instance;
    var user = FirebaseAuth.instance.currentUser;

    var query = await db
        .collection("users")
        .where("userId", isEqualTo: user!.uid)
        .get();

    final data = query.docs;
    ref.read(currentUserControllerProvider.notifier).updateCurrentUser(data[0].data());
    return true;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
