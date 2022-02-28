import 'package:architecture_exemple/src/core/services/remote/client_http_service.dart';
import 'package:architecture_exemple/src/features/home/router/home_router.dart';
import 'package:architecture_exemple/src/features/home/service/local/local_storage_service.dart';
import 'package:flutter/material.dart';
import '../../features/home/repository/home_repository.dart';

class Routers {
  static String get initialRoute => '/';

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    '/': (_, args) => HomeRouter(
          storage: SharedLocalStorageService(),
          repository: HomeRepository(
            client: DioClientHttpService(),
          ),
        )
  };

  static Route? generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
