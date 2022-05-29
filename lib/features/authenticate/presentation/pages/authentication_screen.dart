import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan_with_base/features/authenticate/presentation/bloc/auth_bloc.dart';
import 'package:jan_with_base/features/authenticate/presentation/bloc/auth_state.dart';
import '../../../../core/components/my_app_bar.dart';
import '../../../../core/utils/my_colors.dart';
import '../bloc/auth_event.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  // final args =
  // ModalRoute.of(context)!.settings.arguments as AuthenticationArguments;
  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: const MyAppBar(),
            body:BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
      if (state is ResponseHasData) {
        // // Navigate to next screen
        // Navigator.of(context).pushNamed(RouteName.authentication);
      }
    },

    builder: (context, state) {
    return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 32 ,bottom: 64),
                      width: 300,
                      height: 100,
                      color: MyColors.blue,
                      child: TextFormField(
                        controller: controller,
                      ),
                    ),

                    ElevatedButton(onPressed: (){
                      _fourNumbersAreEntered();
                    }, child: Text("click"))
                  ],
                )
              ),
          );
        }));
  }
  _fourNumbersAreEntered() {
    context.read<AuthenticationBloc>().add(FourNumbersAreEntered(
      //shomare ro az shared bekhoon
        phoneNumber: "09387169428" ,
        code: int.parse(controller.text)
    ));
    // _loginBloc.add(LoginButtonPressed(
    //   phoneNumber: "09387169428"
    //
    // ));
  }

}
