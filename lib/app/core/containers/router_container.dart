import 'package:go_router/go_router.dart';
import 'package:app_teste_ifood/app/features/auth/router/auth_router_container.dart'
    as auth;
import 'package:app_teste_ifood/app/features/current_weather/router/current_weather_router_container.dart'
    as current_weather;
import 'package:app_teste_ifood/app/features/forecast_weather/router/forecast_weather_router_container.dart'
    as forecast_weather;

final getRoutes = GoRouter(
  routes: [
    ...auth.getRouterContainer,
    ...current_weather.getRouterContainer,
    ...forecast_weather.getRouterContainer,
  ],
);
