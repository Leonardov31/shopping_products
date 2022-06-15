abstract class Failure implements Exception {
  String get message;
}

class ErrorEditproduct extends Failure {
  @override
  final String message;

  ErrorEditproduct({
    required this.message,
  });
}

class ErrorDeleteProduct extends Failure {
  @override
  final String message;

  ErrorDeleteProduct({
    required this.message,
  });
}

class ErrorGetProducts extends Failure {
  @override
  final String message;

  ErrorGetProducts({
    required this.message,
  });
}

class ServerError extends Failure {
  @override
  final String message;

  ServerError({
    required this.message,
  });
}
