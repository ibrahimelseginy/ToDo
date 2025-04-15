// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get todo => Intl.message('ToDo', name: 'todo');
  String get settings => Intl.message('Settings', name: 'settings');
  String get arabic => Intl.message('Arabic', name: 'arabic');
  String get english => Intl.message('English', name: 'english');
  String get language => Intl.message('Language', name: 'language');
  String get darkMode => Intl.message('Dark Mode', name: 'darkMode');
  String get lightMode => Intl.message('Light Mode', name: 'lightMode');
  String get mode => Intl.message('Mode', name: 'mode');
  String get selectDate => Intl.message('Select Date', name: 'selectDate');
  String get addNewTask => Intl.message('Add New Task', name: 'addNewTask');
  String get taskTitle => Intl.message('Task Title', name: 'taskTitle');
  String get taskDescription =>
      Intl.message('Task Description', name: 'taskDescription');
  String get add => Intl.message('Add', name: 'add');
  String get edit => Intl.message('Edit', name: 'edit');
  String get editTask => Intl.message('Edit Task', name: 'editTask');
  String get delete => Intl.message('Delete', name: 'delete');
  String get task => Intl.message('Task', name: 'task');
  String get done => Intl.message('Done..!', name: 'done');
  String get login => Intl.message('Login', name: 'login');
  String get welcomeBack => Intl.message('Welcome back!', name: 'welcomeBack');
  String get pleaseLogin => Intl.message('Please login', name: 'pleaseLogin');
  String get email => Intl.message('Email', name: 'email');
  String get password => Intl.message('Password', name: 'password');
  String get forgotPassword =>
      Intl.message('Forgot password?', name: 'forgotPassword');
  String get dontHaveAnAccount =>
      Intl.message("Don't have an account?", name: 'dontHaveAnAccount');
  String get continueAsGuest =>
      Intl.message("Continue as guest", name: 'continueAsGuest');
  String get resetPassword =>
      Intl.message("Reset password", name: 'resetPassword');
  String get pleaseEnterYourEmailAddress =>
      Intl.message("Please enter your email address",
          name: 'pleaseEnterYourEmailAddress');
  String get toResetYourPassword =>
      Intl.message("to reset your password", name: 'toResetYourPassword');
  String get createAccount =>
      Intl.message("Create Account", name: 'createAccount');
  String get firstName => Intl.message("First Name", name: 'firstName');
  String get emailAddress =>
      Intl.message("Email address", name: 'emailAddress');
  String get alreadyHaveAnAccount =>
      Intl.message("Already have an account?", name: 'alreadyHaveAnAccount');
  String get toDoList => Intl.message("To Do List", name: 'toDoList');
  String get selectTime => Intl.message("Select Time", name: 'selectTime');
  String get save => Intl.message("Save", name: 'save');
  String get taskAddedSuccessfully =>
      Intl.message("Task added successfully", name: 'taskAddedSuccessfully');
  String get somethingWentWrongTryAgain =>
      Intl.message("Something went wrong..! Try again",
          name: 'somethingWentWrongTryAgain');
  String get next => Intl.message("Next", name: 'next');
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
