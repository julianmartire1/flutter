import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String name;
    String picture;
    String userId;
    String email;

    UserModel({
        this.name,
        this.picture,
        this.userId,
        this.email,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        picture: json["picture"],
        userId: json["user_id"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "picture": picture,
        "user_id": userId,
        "email": email,
    };
}