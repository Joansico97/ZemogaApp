import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class _DioService {
  static final Dio _dio = Dio();
  final _logger = Logger();

  Future<dynamic> getData({required String url}) async {
    try {
      final data = await _dio.get(url);

      return data.data;
    } on DioError {
      _logger.e('Error while bringing the information');
      rethrow;
    }
  }
}

final dioService = _DioService();
