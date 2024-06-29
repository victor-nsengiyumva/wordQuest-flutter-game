import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordquest/src/features/authentication/data/user_model.dart';

class CurrentUserController extends StateNotifier<UserModel> {
  CurrentUserController() : super(UserModel("", "", "", 0.0));

  void updateCurrentUser(Map<String, dynamic> userMap) {
    state = UserModel.fromMap(userMap);
  }
}

final currentUserControllerProvider =
    StateNotifierProvider<CurrentUserController, UserModel>((ref) {
  return CurrentUserController();
});
