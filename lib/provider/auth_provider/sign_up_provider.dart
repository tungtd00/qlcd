import 'package:flutter/cupertino.dart';
import 'package:qlcd/constant/regex_text.dart';
import 'package:qlcd/generated/l10n.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController emailSignUpTextController =
      TextEditingController();
  final TextEditingController passwordSignUpTextController =
      TextEditingController();
  final TextEditingController rePasswordSignUpTextController =
      TextEditingController();
  final formKeySignUp = GlobalKey<FormState>();

  final formKeyChangePass = GlobalKey<FormState>();

  String? nameValidate;

  String? phoneValidate;
  String? emailSignUpValidate;
  String? passwordSignUpValidate;
  String? rePasswordSignUpValidate;

  validateName() {
    if (nameTextController.text.trim().isEmpty) {
      nameValidate = S.current.can_not_empty;
      notifyListeners();
      return "";
    } else if (RegexText.requiredSpecialChar(nameTextController.text.trim())) {
      nameValidate = S.current.no_special_char;
      notifyListeners();
      return "";
    } else {
      nameValidate = null;
      notifyListeners();
      return null;
    }
  }

  validatePhone() {
    if (phoneTextController.text.trim().isEmpty) {
      phoneValidate = S.current.can_not_empty;
      notifyListeners();
      return "";
    } else if (!RegexText.requiredNumber(phoneTextController.text.trim())) {
      phoneValidate = S.current.enter_num;
      notifyListeners();
      return "";
    } else if (!RegexText.minMaxString(
            value: phoneTextController.text.trim(), max: 10, min: 10) ||
        // ignore: unrelated_type_equality_checks
        phoneTextController.text.trim().toString()[0] != "0") {
      phoneValidate = S.current.is_phone_number;
      notifyListeners();
      return "";
    } else {
      phoneValidate = null;
      notifyListeners();
      return null;
    }
  }

  validateEmail() {
    if (emailSignUpTextController.text.trim().isEmpty) {
      emailSignUpValidate = S.current.can_not_empty;
      notifyListeners();
      return "";
    } else if (!RegexText.isEmail(emailSignUpTextController.text.trim())) {
      emailSignUpValidate = S.current.email_not_correct_fomat;
      notifyListeners();
      return "";
    } else {
      emailSignUpValidate = null;
      notifyListeners();
      return null;
    }
  }

  validatePassword() {
    if (passwordSignUpTextController.text.isEmpty) {
      passwordSignUpValidate = S.current.can_not_empty;
      notifyListeners();
      return "";
    } else if (passwordSignUpTextController.text.trim().length < 6) {
      passwordSignUpValidate = S.current.password_6_char;
      notifyListeners();
      return "";
    } else {
      passwordSignUpValidate = null;
      notifyListeners();
      return null;
    }
  }

  validateRePassword() {
    if (rePasswordSignUpTextController.text.isEmpty) {
      rePasswordSignUpValidate = S.current.can_not_empty;
      notifyListeners();
      return "";
    } else if (rePasswordSignUpTextController.text !=
        passwordSignUpTextController.text) {
      rePasswordSignUpValidate = S.current.password_not_match;
      notifyListeners();
      return "";
    } else {
      rePasswordSignUpValidate = null;
      notifyListeners();
      return null;
    }
  }

  bool SignUp() {
    if (formKeySignUp.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool ChangePass() {
    if (formKeyChangePass.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  disposeSignUpTextController() {
    nameValidate = null;
    phoneValidate = null;
    passwordSignUpValidate = null;
    rePasswordSignUpValidate = null;
    nameTextController.clear();
    phoneTextController.clear();
    emailSignUpTextController.clear();
    passwordSignUpTextController.clear();
    rePasswordSignUpTextController.clear();
  }
}
