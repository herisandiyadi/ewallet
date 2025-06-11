import 'package:equatable/equatable.dart';

class ResponseLoginEntity extends Equatable {
  final String accessToken;

  const ResponseLoginEntity({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}
