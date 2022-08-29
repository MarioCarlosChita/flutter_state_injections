import 'package:http/http.dart' as http;

abstract class IhttpClientManager{}



class HttpClientManager  extends IhttpClientManager{
    final  http.Client client;
    HttpClientManager({required this.client});

    http.Client get clientHttp => this.client;
}
