import 'package:flutter/cupertino.dart';

import '../../constant/regex_text.dart';
import '../../generated/l10n.dart';

class ChangePasswordProvider extends ChangeNotifier {
  final TextEditingController phoneEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  String? phoneEmailValidate;
  final formKeyEmail = GlobalKey<FormState>();

  validatePhoneEmail() {
    if (phoneEmailController.text.length == 10) {
      phoneEmailValidate = null;
      notifyListeners();
      return null;
    } else if (phoneEmailController.text.trim().isEmpty) {
      phoneEmailValidate = S.current.can_not_empty;
      notifyListeners();
      return "";
    } else if (!RegexText.isEmail(phoneEmailController.text.trim())) {
      phoneEmailValidate = S.current.email_not_correct_fomat;
      notifyListeners();
      return "";
    } else {
      phoneEmailValidate = null;
      notifyListeners();
      return null;
    }
  }

  bool emailNotValidate() {
    if (formKeyEmail.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
