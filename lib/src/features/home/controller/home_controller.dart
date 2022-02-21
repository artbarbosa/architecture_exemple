import 'package:architecture_exemple/src/features/home/service/local/local_storage_service.dart';
import 'package:flutter/material.dart';
import '../model/post_model.dart';
import '../repository/home_repository_interface.dart';

abstract class IHomeController extends ChangeNotifier {
  bool get isLoading;
  bool get hasError;
  String get error;
  Future<void> fetchList({bool isError = false});
  List<PostModel> get list;
}

class HomeController extends ChangeNotifier implements IHomeController {
  final IHomeRepository repository;
  final ILocalStorage storage;
  final Future<void> Function(String) onError;

  HomeController({
    required this.storage,
    required this.repository,
    required this.onError,
  });

  bool _isLoading = false;

  List<PostModel> _list = [];

  String _error = '';

  void _setIsLoading({bool value = false}) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError({String value = ''}) {
    _error = value;
    notifyListeners();
  }

  @override
  String get error => _error;

  @override
  Future<void> fetchList({bool isError = false}) async {
    try {
      _setError(value: '');
      _setIsLoading(value: true);
      if (isError) {
        _list = await repository.fetchListWithError();
      } else {
        _list = await repository.getList();
      }
    } on Exception catch (e) {
      _setError(value: e.toString());
      onError(e.toString());
    } finally {
      _setIsLoading();
    }
  }

  @override
  bool get hasError => _error.isNotEmpty;

  @override
  bool get isLoading => _isLoading;

  @override
  List<PostModel> get list => _list;
}
