import 'package:equatable/equatable.dart';

abstract class HttpFailures extends Equatable {
  final Map<String, dynamic> error;

  const HttpFailures(this.error);

  @override
  List<Object> get props => [error];
}

class BadRequestFailure extends HttpFailures {
  BadRequestFailure(Map<String, dynamic> error) : super(error);
}

class UnauthorizedFailure extends HttpFailures {
  UnauthorizedFailure(Map<String, dynamic> error) : super(error);
}

class NotFoundFailure extends HttpFailures {
  NotFoundFailure(Map<String, dynamic> error) : super(error);
}

class ServerExeption extends HttpFailures {
  ServerExeption(Map<String, dynamic> error) : super(error);
}

class DefaultFailures extends HttpFailures {
  DefaultFailures(Map<String, dynamic> error) : super(error);
}
