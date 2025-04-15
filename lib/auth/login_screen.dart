import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_theme.dart';
import 'package:todoapp/auth/register_screen.dart';
import 'package:todoapp/auth/reset_password_screen.dart';
import 'package:todoapp/auth/user_provider.dart';
import 'package:todoapp/firebase_utils.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/home_screen.dart';
import 'package:todoapp/tabs/tasks/default_elevated_button.dart';
import 'package:todoapp/tabs/tasks/default_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passowrdController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(
          child: Text(S.of(context).login),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 5,
                  ),
                  Text(
                    S.of(context).welcomeBack,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 30),
                  ),
                  Text(
                    S.of(context).pleaseLogin,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 20),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  DefaultTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Can\'t be empty';
                      } else if (value.length < 6) {
                        return 'Minimum 6 characters';
                      }
                      return null;
                    },
                    maxlines: 1,
                    maxlenght: 100,
                    labelText: S.of(context).email,
                    controller: emailController,
                  ),
                  DefaultTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Can\'t be empty';
                      } else if (value.length < 6) {
                        return 'Minimum 6 characters';
                      } else if (value.contains('*&%!')) {
                        return 'Should be contains Special characters';
                      }
                      return null;
                    },
                    labelText: S.of(context).password,
                    controller: passowrdController,
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ResetPasswordScreen.routeName);
                    },
                    child: Text(
                      S.of(context).forgotPassword,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall  
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  DefaultElevatedButton(
                      onPressed: _login,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            S.of(context).login,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Icon(
                            Icons.arrow_back,
                            color: AppTheme.white,
                          ),
                        ],
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.routeName);
                      },
                      child: Text(
                        S.of(context).dontHaveAnAccount,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  DefaultElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).continueAsGuest,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 17,
                                  ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    },
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ]),
          ),
        )
      ]),
    );
  }

  void _login() {
    if (formkey.currentState!.validate() == true) {
      FirebaseUtils.login(
        email: emailController.text,
        password: passowrdController.text,
      ).then((user) {
        Provider.of<UserProvider>(context, listen: false).updateUser(user);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }).catchError((onError) {
        if (onError is FirebaseAuthException && onError.message != null) {
          Fluttertoast.showToast(
              msg: onError.message!, toastLength: Toast.LENGTH_SHORT);
        } else {
          Fluttertoast.showToast(
              msg: 'Something went wrong!', toastLength: Toast.LENGTH_SHORT);
        }
      });
    }
  }
}
