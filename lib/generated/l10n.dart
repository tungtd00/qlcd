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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up_acc {
    return Intl.message(
      'Sign up',
      name: 'sign_up_acc',
      desc: '',
      args: [],
    );
  }

  /// `sign_up`
  String get sign_up {
    return Intl.message(
      'sign_up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account?`
  String get have_acc {
    return Intl.message(
      'Do you have an account?',
      name: 'have_acc',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter password`
  String get re_password {
    return Intl.message(
      'Re-enter password',
      name: 're_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter full name`
  String get enter_full_name {
    return Intl.message(
      'Enter full name',
      name: 'enter_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get enter_email {
    return Intl.message(
      'Enter email address',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Confirm agreement with`
  String get confirm_agreement_with {
    return Intl.message(
      'Confirm agreement with',
      name: 'confirm_agreement_with',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Services`
  String get terms_services {
    return Intl.message(
      'Terms & Services',
      name: 'terms_services',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get wellcome_back {
    return Intl.message(
      'Welcome back!',
      name: 'wellcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Have an account yet?`
  String get have_acc_yet {
    return Intl.message(
      'Have an account yet?',
      name: 'have_acc_yet',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone/email`
  String get enter_phone_email {
    return Intl.message(
      'Enter phone/email',
      name: 'enter_phone_email',
      desc: '',
      args: [],
    );
  }

  /// `Save password`
  String get save_password {
    return Intl.message(
      'Save password',
      name: 'save_password',
      desc: '',
      args: [],
    );
  }

  /// `Can not empty`
  String get can_not_empty {
    return Intl.message(
      'Can not empty',
      name: 'can_not_empty',
      desc: '',
      args: [],
    );
  }

  /// `No special characters allowed`
  String get no_special_char {
    return Intl.message(
      'No special characters allowed',
      name: 'no_special_char',
      desc: '',
      args: [],
    );
  }

  /// `Enter number`
  String get enter_num {
    return Intl.message(
      'Enter number',
      name: 'enter_num',
      desc: '',
      args: [],
    );
  }

  /// `Phone number has 10 digits and starts with 0`
  String get is_phone_number {
    return Intl.message(
      'Phone number has 10 digits and starts with 0',
      name: 'is_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Email is not in the correct format`
  String get email_not_correct_fomat {
    return Intl.message(
      'Email is not in the correct format',
      name: 'email_not_correct_fomat',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get password_6_char {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'password_6_char',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get password_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verify_otp {
    return Intl.message(
      'Verify OTP',
      name: 'verify_otp',
      desc: '',
      args: [],
    );
  }

  /// `We have sent the OTP code to your phone number. Please enter the OTP code to complete the verification.`
  String get lable_verify_otp {
    return Intl.message(
      'We have sent the OTP code to your phone number. Please enter the OTP code to complete the verification.',
      name: 'lable_verify_otp',
      desc: '',
      args: [],
    );
  }

  /// `Did not receive OTP?`
  String get did_not_receive_otp {
    return Intl.message(
      'Did not receive OTP?',
      name: 'did_not_receive_otp',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Failure`
  String get failure {
    return Intl.message(
      'Failure',
      name: 'failure',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful, please login`
  String get reg_success {
    return Intl.message(
      'Registration successful, please login',
      name: 'reg_success',
      desc: '',
      args: [],
    );
  }

  /// `Missing required fields`
  String get missing {
    return Intl.message(
      'Missing required fields',
      name: 'missing',
      desc: '',
      args: [],
    );
  }

  /// `Password not match`
  String get not_match {
    return Intl.message(
      'Password not match',
      name: 'not_match',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters. It must contain at least 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character`
  String get val_pass {
    return Intl.message(
      'Password must be at least 8 characters. It must contain at least 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character',
      name: 'val_pass',
      desc: '',
      args: [],
    );
  }

  /// `Account already exists, please login with other account`
  String get account_existed {
    return Intl.message(
      'Account already exists, please login with other account',
      name: 'account_existed',
      desc: '',
      args: [],
    );
  }

  /// `User information is not available on the system, please contact Admin.`
  String get account_not_avaiable {
    return Intl.message(
      'User information is not available on the system, please contact Admin.',
      name: 'account_not_avaiable',
      desc: '',
      args: [],
    );
  }

  /// `Invalid authentication code`
  String get invalid_code {
    return Intl.message(
      'Invalid authentication code',
      name: 'invalid_code',
      desc: '',
      args: [],
    );
  }

  /// `System error`
  String get systeme_error {
    return Intl.message(
      'System error',
      name: 'systeme_error',
      desc: '',
      args: [],
    );
  }

  /// `Card number is existed`
  String get card_exist {
    return Intl.message(
      'Card number is existed',
      name: 'card_exist',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Add requesting asset`
  String get add_request_asset {
    return Intl.message(
      'Add requesting asset',
      name: 'add_request_asset',
      desc: '',
      args: [],
    );
  }

  /// `Notification !`
  String get notification {
    return Intl.message(
      'Notification !',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `The OTP code is incorrect. Please enter again.`
  String get notification_otp_incorrect {
    return Intl.message(
      'The OTP code is incorrect. Please enter again.',
      name: 'notification_otp_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `The phone number/email or password is incorrect. Please check again.`
  String get notification_email_phone_incorrect {
    return Intl.message(
      'The phone number/email or password is incorrect. Please check again.',
      name: 'notification_email_phone_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `The phone number/email does not exist in the system. Please check again.`
  String get notification_email_phone_not_exist {
    return Intl.message(
      'The phone number/email does not exist in the system. Please check again.',
      name: 'notification_email_phone_not_exist',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendar {
    return Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Wrong username or password !`
  String get wrong_email_pass {
    return Intl.message(
      'Wrong username or password !',
      name: 'wrong_email_pass',
      desc: '',
      args: [],
    );
  }

  /// `Family management`
  String get family_management {
    return Intl.message(
      'Family management',
      name: 'family_management',
      desc: '',
      args: [],
    );
  }

  /// `Member`
  String get member {
    return Intl.message(
      'Member',
      name: 'member',
      desc: '',
      args: [],
    );
  }

  /// `Permissions`
  String get permissions {
    return Intl.message(
      'Permissions',
      name: 'permissions',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get expense {
    return Intl.message(
      'Expense',
      name: 'expense',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Project_management`
  String get task_management {
    return Intl.message(
      'Project_management',
      name: 'task_management',
      desc: '',
      args: [],
    );
  }

  /// `Creat task`
  String get creat_task {
    return Intl.message(
      'Creat task',
      name: 'creat_task',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get result {
    return Intl.message(
      'Result',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get reminder {
    return Intl.message(
      'Reminder',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Statement`
  String get statement {
    return Intl.message(
      'Statement',
      name: 'statement',
      desc: '',
      args: [],
    );
  }

  /// `Assign task`
  String get assign_task {
    return Intl.message(
      'Assign task',
      name: 'assign_task',
      desc: '',
      args: [],
    );
  }

  /// `Child's activity`
  String get child_activity {
    return Intl.message(
      'Child\'s activity',
      name: 'child_activity',
      desc: '',
      args: [],
    );
  }

  /// `Network err`
  String get network_err {
    return Intl.message(
      'Network err',
      name: 'network_err',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'otp_not true' key

  /// `Personal profile`
  String get person_profile {
    return Intl.message(
      'Personal profile',
      name: 'person_profile',
      desc: '',
      args: [],
    );
  }

  /// `Premises information`
  String get premises_information {
    return Intl.message(
      'Premises information',
      name: 'premises_information',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get device {
    return Intl.message(
      'Device',
      name: 'device',
      desc: '',
      args: [],
    );
  }

  /// `Usage time`
  String get usage_time {
    return Intl.message(
      'Usage time',
      name: 'usage_time',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgot_password {
    return Intl.message(
      'Forgot password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Phone/Email`
  String get phone_email {
    return Intl.message(
      'Phone/Email',
      name: 'phone_email',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
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
