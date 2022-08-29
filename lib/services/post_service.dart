import 'dart:io';

import 'package:bloc_aplication/core/errors/failure.dart';
import 'package:bloc_aplication/core/network/http_client_manager.dart';
import 'package:bloc_aplication/models/post.dart';
import 'dart:convert';
import '../core/api/api.dart';

class PostServive {
  final HttpClientManager httpClientManager;

  final String _pathUrl = "/posts";

  PostServive({required this.httpClientManager});

  Future<List<Post>> listar() async {
    try {
      final request = await httpClientManager.client.get(Uri.parse("${Api.BASEURL}$_pathUrl"));
      if (request.statusCode == HttpStatus.ok) {
        final responseBody = json.decode(request.body);
        return List.from(responseBody.map((e) => Post.fromJson(e)));
      } else {
        throw UnexpectedErrorException(message: "Erro inesperado");
      }
    } on SocketException {
      throw NoInternetException(message: "No internet");
    } on FormatException {
      throw FormatBadException(message: "Requesicao mal formatada");
    }

  }

}
