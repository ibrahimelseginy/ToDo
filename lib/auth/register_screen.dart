import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/apptheme.dart';
import 'package:todoapp/auth/login_screen.dart';
import 'package:todoapp/auth/user_provider.dart';
import 'package:todoapp/firebase_utils.dart';
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
        title: Text(
          'register',
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'First name can\'t be empty';
                    } else if (value.length < 4) {
                      return 'Minimum 6 characters';
                    }
                    return null;
                  },
                  labelText: 'First name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 16,
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
                  labelText: 'E-mail address',
                  controller: emailController,
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
                  labelText: 'Password',
                  controller: passowrdController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                DefaultElevatedButton(
                  onpressed: register,
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Create Account',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 19, color: AppTheme.whiteColor),
                      ),
                      const Spacer(
                        flex: 8,
                      ),
                      Icon(
                        Icons.arrow_back,
                        color: AppTheme.whiteColor,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName),
                        child: const Text(
                          'Already have an account',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formkey.currentState?.validate() == true) {
      FirebaseUtils.register(
        email: emailController.text,
        name: nameController.text,
        password: passowrdController.text,
      )
          .then((user) => {
                Provider.of<UserProvider>(context, listen: false)
                    .updateUser(user),
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName)
              })
          .catchError(
        (error) {
          if (error is FirebaseAuthException && error.message != null) {
            Fluttertoast.showToast(
              msg: error.message!,
              toastLength: Toast.LENGTH_SHORT,
            );
          } else {
            Fluttertoast.showToast(
              msg: 'Something Went wrong !',
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        },
      );
    }
  }
}
