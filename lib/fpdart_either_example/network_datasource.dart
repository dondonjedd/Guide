import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class Main {
  getStringFromServer() async {
    Either<String, Exception> result = await apiCall(param: 'param');

    result.fold((successString) {
      //do something with success String
      //for example, update interface
    }, (failureException) {
      //do something with failure exception
      //for example, show failure dialog
    });
  }

  ///call api example
  ///returns either a String or an Exception
  Future<Either<String, Exception>> apiCall({required final String param}) async {
    try {
      //call api
      final response = await http.get(
        Uri.parse('example/api?param=$param'),
        headers: {
          'Accept': 'application/json',
        },
      );

      String? jsonResponse = jsonDecode(response.body);
      //success
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Left(jsonResponse ?? '');
      }
      final error = jsonDecode(response.body)?['error'];

      //failure
      //you can customize an exception
      return Right(ServerException(
        title: error['title']?.toString() ?? 'Error',
        message: error['message']?.toString() ?? 'Something unexpected happened. Please try again.',
        statusCode: response.statusCode.toString(),
      ));
    } catch (e) {
      //failure
      return Right(Exception(e));
    }
  }
}

//customized exception
class ServerException implements Exception {
  const ServerException({this.title = 'Server Error', required this.message, required this.statusCode});
  final String title;
  final String message;
  final String statusCode;
}
