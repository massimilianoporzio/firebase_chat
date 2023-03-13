class GenericException implements Exception {
  final String message;
  GenericException({
    this.message = 'Generic Error',
  });
}

class GeolocatorException implements Exception {
  String message;
  GeolocatorException([
    this.message = 'Problems occured using Locator Services',
  ]);
}

class FireBaseException implements Exception {
  String message;
  FireBaseException({
    required this.message,
  });
}

class CacheException implements Exception {
  String message;
  CacheException({
    this.message = 'Error in saving or retrieving from cache',
  });
}

class GoogleSignInException implements Exception {}
