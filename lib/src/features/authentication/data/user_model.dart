class UserModel {
  String? userId;
  String? username;
  String? email;
  double? totalScore;

  UserModel(this.userId, this.username, this.email,this.totalScore);

  UserModel.fromMap(Map<String,dynamic> data) {
    userId = data["userId"];
    username = data['username'];
    email = data['email'];
    totalScore = data['totalScore'];
  }

  Map<String, dynamic> toJson(){
    final user = {
      "userId": userId ?? "",
      "username": username ?? "",
      "email": email ?? "",
      "totalScore": totalScore ?? 0.0,
    };

    return user;
  }
}
