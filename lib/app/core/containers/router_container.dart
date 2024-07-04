import 'package:go_router/go_router.dart';
import 'package:app_teste_ifood/app/features/auth/router/auth_router_container.dart'
    as auth;

final getRoutes = GoRouter(
  routes: [
    ...auth.getRouterContainer,
  ],
);
