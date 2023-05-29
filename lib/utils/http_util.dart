import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import 'logging_interceptor.dart';

class HttpUtil {
  static Client? _instance;

  static Client get instance {
    if (_instance == null) {
      initialize();
    }
    return _instance!;
  }

  static Future<void> initialize() async {
    late Client client;
    if (kDebugMode) {
      client = InterceptedClient.build(interceptors: [
        LoggingInterceptor(),
      ]);
    } else {
      client = InterceptedClient.build(interceptors: []);
    }
    _instance = client;
  }
}
