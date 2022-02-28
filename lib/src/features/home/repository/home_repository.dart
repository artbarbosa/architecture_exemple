import '../../../core/const/api_cont.dart';
import '../../../core/services/remote/client_http_service.dart';
import '../model/post_model.dart';
import 'home_repository_interface.dart';

class HomeRepository implements IHomeRepository {
  final IClientHttp client;
  HomeRepository({required this.client});


  @override
  Future<List<PostModel>> getList() async {
    final list = await client.get(ApiConst.apiUrl) as List<dynamic>;
    return list.map((e) => PostModel.fromJson(e)).toList();    
  }

  @override
  Future<List<PostModel>> fetchListWithError() {
    throw Exception('Não foi possível carregar a lista');
  }
}

