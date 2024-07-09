import 'package:flutter/material.dart';

class CurrentWeatherLoadingWidget extends StatelessWidget {
  const CurrentWeatherLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
