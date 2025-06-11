import 'package:ewallet/features/auth/domain/entities/response_login_entity.dart';

class ResponseLogin {
  ResponseLogin({required this.accessToken});

  final String accessToken;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) =>
      ResponseLogin(accessToken: json["access_token"]);

  factory ResponseLogin.fromEntity(ResponseLoginEntity entity) =>
      ResponseLogin(accessToken: entity.accessToken);

  Map<String, dynamic> toJson() => {"access_token": accessToken};

  ResponseLoginEntity toEntity() {
    return ResponseLoginEntity(accessToken: accessToken);
  }
}
