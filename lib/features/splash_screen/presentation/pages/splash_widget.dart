import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/const.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';

class SplashScreenWidget extends StatefulWidget {
  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    this._dispatchEvent(
        context); // This will dispatch the navigateToHomeScreen event.
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/jaan_icon.png',
        width: 96,
        height: 96,
      ),
    );
  }

  //This method will dispatch the navigateToHomeScreen event.
  void _dispatchEvent(BuildContext context) {
    // Navigator.of(context).pushReplacementNamed(RouteName.gratitude);

    BlocProvider.of<SplashScreenBloc>(context).add(
      NavigateToGratitudeScreenEvent(),
    );
  }
}