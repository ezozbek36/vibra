abstract class Failure {
  final Object error;
  final String message;

  const Failure(this.message, this.error);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, super.error);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message, super.error);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure._(super.message, super.error);

  factory UnexpectedFailure(String message, Object error) {
    print(error);

    if (error is Error) {
      print(error.stackTrace);
    }

    return UnexpectedFailure._(message, error);
  }
}
