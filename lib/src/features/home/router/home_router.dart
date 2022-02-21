import 'package:architecture_exemple/src/features/home/service/local/local_storage_service.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';
import '../repository/home_repository_interface.dart';
import '../view/container/home_container.dart';

class HomeRouter extends StatelessWidget {
  const HomeRouter({Key? key, required this.repository, required this.storage})
      : super(key: key);
  final IHomeRepository repository;
  final ILocalStorage storage;
  
  @override
  Widget build(BuildContext context) {
    return HomeContainer(
      controller: HomeController(
      storage: storage,
      repository: repository,
      onError: (error) => _showErrorDialog(error, context),
    )..fetchList());
  }

  Future<void> _showErrorDialog(String error, BuildContext context) async {
    await showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(error),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
        context: context);
  }
}
