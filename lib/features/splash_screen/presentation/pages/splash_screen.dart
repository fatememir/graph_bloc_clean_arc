import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan_with_base/core/utils/my_colors.dart';
import 'package:jan_with_base/features/intro/presentation/pages/gratitude_screen.dart';
import 'package:jan_with_base/features/splash_screen/presentation/bloc/splash_bloc.dart';
import 'package:jan_with_base/features/splash_screen/presentation/pages/splash_widget.dart';

import '../bloc/splash_state.dart';



// This the widget where the BLoC states and events are handled.
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: _buildBody(context),
    );
  }

  BlocProvider<SplashScreenBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      // builder: (context) => SplashScreenBloc(Initial()),
      create: (BuildContext context) {
        return SplashScreenBloc(Initial());
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          // Here I have used BlocBuilder, but instead you can also use BlocListner as well.
          child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
            builder: (context, state) {
              if ((state is Initial) || (state is Loading)) {
                return SplashScreenWidget();
              } else if (state is Loaded) {
                return GratitudeScreen();
              }else{
                return SplashScreenWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}