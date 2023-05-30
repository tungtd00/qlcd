import 'package:flutter/cupertino.dart';

import '../../constant/regex_text.dart';
import '../../generated/l10n.dart';

class OtherInfoProvider extends ChangeNotifier {
  TextEditingController phoneTextCtr = TextEditingController();
  TextEditingController emailTextCtr = TextEditingController();
  TextEditingController fbTextCtr = TextEditingController();
  TextEditingController instagramTextCtr = TextEditingController();
  TextEditingController linkedinTextCtr = TextEditingController();
  TextEditingController tiktokTextCtr = TextEditingController();
  final formkeyOther = GlobalKey<FormState>();
  String? phoneValidate;

  validatePhone() {
    if (phoneTextCtr.text.trim().isEmpty) {
      phoneValidate = S.current.can_not_empty;
      notifyListeners();
      return "";
    } else if (!RegexText.requiredNumber(phoneTextCtr.text.trim())) {
      phoneValidate = S.current.enter_num;
      notifyListeners();
      return "";
    } else if (!RegexText.minMaxString(
            value: phoneTextCtr.text.trim(), max: 10, min: 10) ||
        // ignore: unrelated_type_equality_checks
        phoneTextCtr.text.trim().toString()[0] != "0") {
      phoneValidate = S.current.is_phone_number;
      notifyListeners();
      return "";
    } else {
      phoneValidate = null;
      notifyListeners();
      return null;
    }
  }

  bool validateOtherInfo() {
    if (formkeyOther.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
