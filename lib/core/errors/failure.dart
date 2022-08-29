

abstract class AppBadException implements Exception {
  final  String message;
  AppBadException ({required this.message});
}

class NoInternetException extends AppBadException{
  NoInternetException({required super.message});
}

class FormatBadException  extends AppBadException{
  FormatBadException({required super.message});
}

class UnexpectedErrorException  extends AppBadException{
  UnexpectedErrorException({required super.message});
}

