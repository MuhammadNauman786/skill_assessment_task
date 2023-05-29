import 'package:http_interceptor/http_interceptor.dart';

import 'logger.dart';


class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    appLogger.i(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    appLogger.i(data.toString());
    return data;
  }
}
