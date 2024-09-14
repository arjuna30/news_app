class RepositoryException<T> implements Exception {
  RepositoryException({required this.message, required this.stackTrace});

  final String message;
  final StackTrace stackTrace;

  @override
  String toString() => '$message. Type: $T';
}
