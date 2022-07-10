import 'package:dio/dio.dart';

class DioNetworkingService {
  static late DioNetworkingService _singletonHttp;
  late Dio _http;

  factory DioNetworkingService() {
    if (_singletonHttp == null) _singletonHttp = DioNetworkingService.obj();
    return _singletonHttp;
  }

  DioNetworkingService.obj() {
    _http = Dio();
    var timezoneOffset = formattedTimeZoneOffset(DateTime.now());
    _http.options.headers["X-CLIENT-TIMEZONE"] = timezoneOffset;
    print('X-CLIENT-TIMEZONE $timezoneOffset');
  }

  String formattedTimeZoneOffset(DateTime time) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    final duration = time.timeZoneOffset,
        hours = duration.inHours,
        minutes = duration.inMinutes.remainder(60).abs().toInt();

    return '${hours > 0 ? '+' : '-'}${twoDigits(hours.abs())}:${twoDigits(minutes)}';
  }

  get dioClient => _http;

  dispose() {
    _http.close();
  }
}
