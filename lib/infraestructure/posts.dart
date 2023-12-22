class LoginUser {
    final int statusCode;
    final int idUser;

    LoginUser({
        required this.statusCode,
        required this.idUser,
    });

    factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        statusCode: json["StatusCode"],
        idUser: json["id_user"],
    );

    Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "id_user": idUser,
    };
}