import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_theme.dart';
import 'package:todoapp/auth/login_screen.dart';
import 'package:todoapp/auth/user_provider.dart';
import 'package:todoapp/firebase_utils.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/home_screen.dart';
import 'package:todoapp/tabs/tasks/default_elevated_button.dart';
import 'package:todoapp/tabs/tasks/default_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passowrdController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(
          child: Text(S.of(context).createAccount),
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
                      flex: 15,
                    ),
                    DefaultTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First name can\'t be empty';
                        } else if (value.length < 4) {
                          return 'Minimum 6 characters';
                        }
                        return null;
                      },
                      labelText: S.of(context).firstName,
                      controller: nameController,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    DefaultTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Can\'t be empty';
                        } else if (value.length < 6) {
                          return 'Minimum 6 characters';
                        }
                        return null;
                      },
                      labelText: S.of(context).emailAddress,
                      controller: emailController,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    DefaultTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password can\'t be empty';
                        } else if (value.length < 6) {
                          return 'Minimum 6 characters';
                        } else if (value.contains('*&%!')) {
                          return 'Password Should be contains Special characters';
                        }
                        return null;
                      },
                      labelText: S.of(context).password,
                      controller: passowrdController,
                      isPassword: true,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    DefaultElevatedButton(
                      onPressed: _register,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            S.of(context).createAccount,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Icon(
                            Icons.arrow_back,
                            color: AppTheme.white,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        child: Text(
                          S.of(context).alreadyHaveAnAccount,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const Spacer(flex: 3),
                  ]),
            ))
      ]),
    );
  }

  void _register() {
    if (formkey.currentState!.validate() == true) {
      FirebaseUtils.register(
        name: nameController.text,
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
