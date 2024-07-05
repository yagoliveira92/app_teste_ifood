import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app_teste_ifood/app/core/containers/injection_container.dart';
import 'package:app_teste_ifood/app/features/auth/domain/use_cases/login_usecase.dart';
import 'package:app_teste_ifood/app/features/auth/presentation/manager/login_cubit.dart';
import 'package:app_teste_ifood/app/features/auth/presentation/pages/login_screen.dart';
import 'package:app_teste_ifood/app/features/auth/presentation/pages/splash_screen.dart';

final getRouterContainer = [
  GoRoute(
    path: '/',
    builder: (context, state) => BlocProvider<LoginCubit>(
      create: (context) =>
          LoginCubit(loginUsecase: dependency.get<LoginUsecase>()),
      child: const SplashScreen(),
    ),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(
        loginUsecase: dependency.get<LoginUsecase>(),
      ),
      child: const LoginScreen(),
    ),
  ),
];
