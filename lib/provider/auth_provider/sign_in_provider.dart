import 'package:flutter/widgets.dart';
import 'package:qlcd/generated/l10n.dart';

import '../../constant/regex_text.dart';

class SignInProvider extends ChangeNotifier {
  final TextEditingController passwordSignInTextController =
      TextEditingController();
  final TextEditingController emailSignInTextController =
      TextEditingController();
  final formKeySignIn = GlobalKey<FormState>();

  String? emailSignInValidate;
  String? passwordSignInValidate;

  validateEmail() {
    if (emailSignInTextController.text.length == 10) {
      emailSignInValidate = null;
      notifyListeners();
      return null;
    } else if (emailSignInTextController.text.trim().isEmpty) {
      emailSignInValidate = S.current.can_not_empty;
      notifyListeners();
      return "";
    } else if (!RegexText.isEmail(emailSignInTextController.text.trim())) {
      emailSignInValidate = S.current.email_not_correct_fomat;
      notifyListeners();
      return "";
    } else {
      emailSignInValidate = null;
      notifyListeners();
      return null;
    }
  }

  validatePassword() {
    if (passwordSignInTextController.text.isEmpty) {
      passwordSignInValidate = S.current.can_not_empty;
      notifyListeners();
      return "";
    } else if (passwordSignInTextController.text.trim().length < 6) {
      passwordSignInValidate = S.current.password_6_char;
      notifyListeners();
      return "";
    } else {
      passwordSignInValidate = null;
      notifyListeners();
      return null;
    }
  }

  bool signInValidate() {
    if (formKeySignIn.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  disposeTextController() {
    emailSignInValidate = null;
    passwordSignInValidate = null;
    emailSignInTextController.clear();
    passwordSignInTextController.clear();
  }
}
