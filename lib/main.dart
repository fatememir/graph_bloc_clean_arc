import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jan_with_base/features/authenticate/presentation/bloc/auth_bloc.dart';
import 'package:jan_with_base/features/authenticate/presentation/pages/authentication_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jan_with_base/features/login/presentation/bloc/login_bloc.dart';
import 'package:jan_with_base/features/login/presentation/pages/login_widget.dart';
import 'core/injection/injection.dart';
import 'core/routes/route_generator.dart';
import 'core/utils/preferences.dart';
import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);

  PreferenceUtils.init();

  runApp( const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return

      MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => getIt(),
          child: LoginWidget(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (_) => getIt(),
          child: AuthenticationScreen(),
        ),
      ], child: const
      MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
        localizationsDelegates:  [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales:  [
          Locale("fa", "IR"),
        ],
        locale:  Locale("fa", "IR"),
      initialRoute: "/",
      title: 'Jaan',
      // home: SplashScreen(),
    ));
  }
}
//Step 1 : Create Home Block
//Step 2 : Init getIt (DI)
//Step 3 : Pass HomePage as the clid

