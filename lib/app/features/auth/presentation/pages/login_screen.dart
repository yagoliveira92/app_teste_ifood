import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_teste_ifood/app/features/auth/presentation/manager/login_cubit.dart';
import 'package:app_teste_ifood/app/features/auth/presentation/widgets/email_field_widget.dart';
import 'package:app_teste_ifood/app/features/auth/presentation/widgets/login_button_widget.dart';
import 'package:app_teste_ifood/app/features/auth/presentation/widgets/password_field_widget.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController passwordController = TextEditingController(text: '');
    final formKey = GlobalKey<FormState>(debugLabel: '_LoginFormState');

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.go('/current-weather');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1F4D60),
                  Color(0xFF33908A),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    EmailTextFieldWidget(
                      controller: emailController,
                      validator: (text) => formKey.currentState!.validate(),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    PasswordTextFieldWidget(
                      controller: passwordController,
                      validator: (text) => formKey.currentState!.validate(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    LoginButtonWidget(
                      isLoading: state is LoginLoading,
                      onPressed: () async {
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          return await context.read<LoginCubit>().login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        }
                      },
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () async {},
                      child: const Text(
                        'Política de Privacidade',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
