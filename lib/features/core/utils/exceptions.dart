import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class MessageException implements Exception {
  final String message;
  final int? code;

  MessageException(this.message, {this.code});
}

class MessageFailure extends Failure {
  final int? code;

  const MessageFailure(String message, {this.code}) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}
