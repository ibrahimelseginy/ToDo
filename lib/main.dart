import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todoapp/auth/login_screen.dart';
import 'package:todoapp/auth/register_screen.dart';
import 'package:todoapp/auth/reset_password_screen.dart';
import 'package:todoapp/auth/user_provider.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/home_screen.dart';
import 'package:todoapp/tabs/settings/settings_provider.dart';
import 'package:todoapp/tabs/tasks/edit_task_screen.dart';
import 'package:todoapp/tabs/tasks/task_tab.dart';
import 'package:todoapp/tabs/tasks/tasks_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /*
  // local data base
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
      */
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ChangeNotifierProvider(create: (_) => TasksProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ], child: const TodoApp()),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        EditTaskScreen.routeName: (context) => const EditTaskScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
        TaskTab.routeName: (context) => const TaskTab(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
