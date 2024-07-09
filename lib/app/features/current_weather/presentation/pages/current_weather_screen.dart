import 'package:app_teste_ifood/app/features/current_weather/presentation/manager/cubit/current_weather_cubit.dart';
import 'package:app_teste_ifood/app/features/current_weather/presentation/widgets/city_card_current_weather_widget.dart';
import 'package:app_teste_ifood/app/features/current_weather/presentation/widgets/current_weather_loading_widget.dart';
import 'package:app_teste_ifood/app/features/current_weather/presentation/widgets/search_city_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({super.key});

  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  @override
  Widget build(BuildContext context) =>
      BlocConsumer<CurrentWeatherCubit, CurrentWeatherState>(
        listener: (context, state) {
          if (state is CurrentWeatherSuccess) {
            if (!state.hasConnection) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Você está sem internet. Esta previsão pode estar desatualizada'),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return switch (state) {
            CurrentWeatherInitial() => const CurrentWeatherLoadingWidget(),
            CurrentWeatherLoading() => const CurrentWeatherLoadingWidget(),
            CurrentWeatherSuccess() => Scaffold(
                appBar: AppBar(
                  title: const Text('Current Weather'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SearchCityDelegate(
                            currentWeatherList: state.currentWeatherList,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
                body: RefreshIndicator(
                  onRefresh: () =>
                      context.read<CurrentWeatherCubit>().getCurrentWeather(),
                  child: ListView.builder(
                    itemCount: state.currentWeatherList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CityCardCurrentWeatherWidget(
                        onTap: () {
                          context.push(
                              '/forecast-weather/${state.currentWeatherList[index].name}');
                        },
                        currentWeather: state.currentWeatherList[index],
                      );
                    },
                  ),
                ),
              ),
            CurrentWeatherError() => const Scaffold(
                body: Center(
                  child: Text('Error'),
                ),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      );
}
