import 'dart:io';
import 'package:bloc_aplication/services/post_service.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:one_context/one_context.dart';

import '../core/network/http_client_manager.dart';

final instance = GetIt.instance;

void setUpConfigurationInjection() {
  instance.registerLazySingleton<http.Client>(() => http.Client());
  instance.registerLazySingleton<HttpClientManager>(() => HttpClientManager(client: instance.get<http.Client>()));
  instance.registerLazySingleton<PostServive>(() => PostServive(httpClientManager: instance.get<HttpClientManager>()));
  instance.registerLazySingleton<OneContext>(() => OneContext());
}
