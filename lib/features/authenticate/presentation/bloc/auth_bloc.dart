import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import '../../data/repositories/authenticate_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';



@lazySingleton
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthenticateRepository authenticationRepository;


  AuthenticationBloc({
    required this.authenticationRepository,
  }) : super(Initial());


  @override
  AuthenticationState get initialState => Initial();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,) async* {
    if (event is FourNumbersAreEntered) {
      yield Loading();

        try {
          final token = await authenticationRepository.authenticate(event.phoneNumber , event.code);

          if(token == null){
            print("data is null in auth bloc");

            yield ResponseDoesntHasData();
          }else{
            print("data isnt null in auth bloc");
            yield ResponseHasData();
            // navigatorKey.currentState!.pushNamed('/home');
          }
        } catch (error) {
          print("error in auth bloc");
          print("error= "+error.toString());

          yield ResponseHasError();
        }
      }
    }
  }
