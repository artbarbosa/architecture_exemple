import '../model/post_model.dart';

abstract class IHomeRepository {
  Future<List<PostModel>> getList();
  Future<List<PostModel>> fetchListWithError();
}
