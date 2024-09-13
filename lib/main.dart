import 'package:app_teste_ifood/app/core/storage_adapter/local_database/manager/i_local_data_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_teste_ifood/app/core/containers/injection_container.dart'
    as injection;
import 'package:app_teste_ifood/app/core/containers/router_container.dart'
    as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injection.init();
  if (!kIsWeb) {
    final localDataManager = injection.dependency.get<ILocalDataManager>();
    await localDataManager.start();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router.getRoutes,
    );
  }
}
