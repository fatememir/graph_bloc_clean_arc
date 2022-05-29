import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan_with_base/core/utils/my_colors.dart';
import 'package:jan_with_base/features/login/presentation/bloc/login_event.dart';
import 'package:provider/provider.dart';
import '../../../../core/components/login_image.dart';
import '../../../../core/components/my_app_bar.dart';
import '../../../../core/components/text_fields/login_text_field.dart';
import '../../../../core/components/texts/extra_bold_title.dart';
import '../../../../core/components/texts/normal_description_text.dart';
import '../../../../core/routes/const.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';


class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is ResponseHasData) {
                // Navigate to next screen
                Navigator.of(context).pushNamed(RouteName.authentication);
              }
            },

            builder: (context, state) {
              return SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LoginImage(image: "assets/icons/login.svg"),
                        const SizedBox(height: 16),
                        const ExtraBoldTitle(title: "ورود به جآن"),
                        const SizedBox(height: 16),
                        const NormalDescriptionText(
                            text:
                            "برای ورود به جآن ایمیل یا شماره موبایل خود را وارد کنید."),
                        const SizedBox(height: 24),
                        LoginTextField(
                          labelText: "ایمیل یا شماره موبایل",
                          // controller: viewModel.myController,
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {
                            print("click");
                            print("state= " + state.toString());
                            // state is !Loading ?
                            _onLoginButtonPressed();
                            // : null ;
                          },
                          child: Container(color: MyColors.blue,
                            child: Center(
                              child: state is Loading
                                  ? CircularProgressIndicator()
                                  : Text("تایید"),
                            ),),
                        )
                        // WideBlueButton(
                        //   text: "تایید",
                        //   onPressed: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   RouteName.authentication,
                        //   arguments: AuthenticationArguments(
                        //       viewModel.loginMethod, viewModel.myController.text),
                        // );
                        // },
                        // status:true,
                        // ),
                      ],
                    ),
                  ));
              //   BlocBuilder<LoginBloc, LoginState>(
              //     builder: (context, state) =>(

              // ))));
            }));
  }

  _onLoginButtonPressed() {
    context.read<LoginBloc>().add(LoginButtonPressed(
        phoneNumber: "09387169428"
    ));
  }
}