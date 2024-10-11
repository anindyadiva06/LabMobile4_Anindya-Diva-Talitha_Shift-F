class Login {
  int? code;
  bool? status;
  String? token;
  String? userID; // Diubah menjadi String sesuai respons API
  String? userEmail;

  Login({this.code, this.status, this.token, this.userID, this.userEmail});

  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
      code: obj['code'],
      status: obj['status'],
      token: obj['data']['token'], // Token sebagai String
      userID: obj['data']['user']['id'], // ID pengguna sebagai String
      userEmail: obj['data']['user']['email'],
    );
  }
}
