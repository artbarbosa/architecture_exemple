import 'package:dio/dio.dart';

abstract class IClientHttp {
  void addToken(String toke);
  Future<Map<String, dynamic>> get(String url);
}

class DioClientHttpService implements IClientHttp {
  final Dio dio = Dio();

  @override
  Future<Map<String, dynamic>> get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }

  @override
  void addToken(String toke) {}
}
