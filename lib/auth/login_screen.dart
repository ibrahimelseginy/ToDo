import 'package:flutter/material.dart';
import 'package:todoapp/apptheme.dart';
import 'package:todoapp/auth/register_screen.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Login',
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
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Welcome back!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 16,
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
                  labelText: 'Email',
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
                  labelText: 'Password',
                  controller: passowrdController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                DefaultElevatedButton(
                  onpressed: login,
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Login',
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
                            .pushReplacementNamed(RegisterScreen.routeName),
                        child: const Text(
                          'or Create My Account',
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

  void login() {
    if (formkey.currentState?.validate() == true) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }
}
