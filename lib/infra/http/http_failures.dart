import 'package:equatable/equatable.dart';

abstract class HttpFailures extends Equatable {
  final Map<String, dynamic> error;

  const HttpFailures(this.error);

  @override
  List<Object> get props => [error];
}

class BadRequestFailure extends HttpFailures {
  const BadRequestFailure(Map<String, dynamic> error) : super(error);
}

class UnauthorizedFailure extends HttpFailures {
  const UnauthorizedFailure(Map<String, dynamic> error) : super(error);
}

class NotFoundFailure extends HttpFailures {
  const NotFoundFailure(Map<String, dynamic> error) : super(error);
}

class ServerExeption extends HttpFailures {
  const ServerExeption(Map<String, dynamic> error) : super(error);
}

class DefaultFailures extends HttpFailures {
  const DefaultFailures(Map<String, dynamic> error) : super(error);
}
