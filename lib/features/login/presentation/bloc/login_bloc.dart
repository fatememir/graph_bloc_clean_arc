import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:jan_with_base/features/login/data/repositories/login_repository.dart';
import 'package:jan_with_base/features/login/presentation/bloc/login_event.dart';
import 'package:jan_with_base/features/login/presentation/bloc/login_state.dart';
import 'package:bloc/bloc.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILoginRepository loginRepository;
  // final GlobalKey<NavigatorState> navigatorKey;

  // final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.loginRepository,
  })  : super(Initial());


  @override
  LoginState get initialState => Initial();

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {

    if (event is LoginButtonPressed) {
      yield Loading();

      try {
        final loginMessage = await loginRepository.login(event.phoneNumber);

        if(loginMessage == null){
          print("data is null in bloc");

          yield ResponseDoesntHasData();
        }else{
          print("data isnt null in bloc");
          //check kon
          yield ResponseHasData();
          // navigatorKey.currentState!.pushNamed('/home');
        }
      } catch (error) {
        print("error in bloc");
        print("error= "+error.toString());

        yield ResponseHasError();
      }
    }
  }
}