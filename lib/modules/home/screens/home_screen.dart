import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_booking/app/route/app_router.gr.dart';
import 'package:sports_booking/core/data/src/api_enum.dart';
import 'package:sports_booking/modules/home/bloc/home_cubit.dart';
import 'package:sports_booking/modules/home/repository/home_repository.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return RepositoryProvider(
      create: (context) => HomeRepository(),
      child: BlocProvider(
        create: (context) => HomeCubit(context.read<HomeRepository>())..fetchPlaceListValue(),
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error aavi ')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Home Screen')),
          body:
              state.apiStatus == ApiStatus.loading
                  ? Center(child: CircularProgressIndicator())
                  : state.apiStatus == ApiStatus.loaded && state.sportsModelList.isNotEmpty
                  ? ListView.builder(
                    itemCount: state.sportsModelList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.router.push(
                            PlaceDetailRoute(sportPlace: state.sportsModelList[index]),
                          );
                        },
                        child: ListTile(title: Text(state.sportsModelList[index].placeName ?? '')),
                      );
                    },
                  )
                  : Center(child: Container(height: 10, width: 500, color: Colors.black)),
        );
      },
    );
  }
}
