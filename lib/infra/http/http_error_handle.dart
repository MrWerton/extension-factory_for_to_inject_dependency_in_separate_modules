import 'package:test_app/infra/http/http_failures.dart';

class HttpFailureHandler {
  static dynamic getFirstError(HttpFailures err) {
    if (err is DefaultFailures) {
      return err.error[err.error.keys.first];
    } else {
      for (final error in err.error.values) {
        if (error is List && error.isNotEmpty) {
          return error[0];
        }
      }
    }
    return null;
  }
}
