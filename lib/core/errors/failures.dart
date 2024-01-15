import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  // factory ServerFailure.fromDioException(DioException dioException) {
  //   switch (dioException.type) {
  //     case DioExceptionType.connectionTimeout:
  //       return ServerFailure('Connection timeout with ApiServer');
  //     case DioExceptionType.sendTimeout:
  //       return ServerFailure('Send timeout with ApiServer');
  //     case DioExceptionType.receiveTimeout:
  //       return ServerFailure('Receive timeout with ApiServer');
  //     case DioExceptionType.badCertificate:
  //       return ServerFailure('Bad Certificate with ApiServer');
  //
  //     case DioExceptionType.badResponse:
  //     // TODO: Handle this case.
  //     case DioExceptionType.cancel:
  //     // TODO: Handle this case.
  //     case DioExceptionType.connectionError:
  //     // TODO: Handle this case.
  //     case DioExceptionType.unknown:
  //     // TODO: Handle this case.
  //   }
  // }
}
