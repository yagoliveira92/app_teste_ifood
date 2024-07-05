import 'package:flutter/material.dart';
import 'package:app_teste_ifood/app/core/containers/injection_container.dart'
    as injection;
import 'package:app_teste_ifood/app/core/containers/router_container.dart'
    as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router.getRoutes,
    );
  }
}
