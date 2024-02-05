part of 'network_controller.dart';

final _dioLoggerInterceptor = InterceptorsWrapper(
  onRequest: (RequestOptions options, handler) {
    String headers = '';
    options.headers.forEach((key, value) {
      headers += '| $key: $value';
    });

    print(
        '┌------------------------------------------------------------------------------');
    print('''| [DIO] Request: ${options.method} ${options.uri}
| ${json.encode(options.data)}
| Headers:\n$headers''');
    print(
        '├------------------------------------------------------------------------------');
    handler.next(options);
  },
  onResponse: (Response response, handler) async {
    print(
        '| [DIO] Response [code ${response.statusCode}]: ${json.encode(response.data)}');
    print(
        '└------------------------------------------------------------------------------');
    handler.next(response);
  },
  onError: (DioError error, handler) async {
    print('| [DIO] Error: ${error.error}: ${error.response}');
    print(
        '└------------------------------------------------------------------------------');
    handler.next(error);
  },
);
