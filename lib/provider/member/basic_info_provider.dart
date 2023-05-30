import 'package:flutter/material.dart';

import '../../constant/regex_text.dart';
import '../../generated/l10n.dart';

class BasicInfoProvider extends ChangeNotifier {
  TextEditingController fullnameTextCtr = TextEditingController();
  TextEditingController dateTextCtr = TextEditingController();
  TextEditingController CCCDTextCtr = TextEditingController();
  TextEditingController nationalTextCtr = TextEditingController();
  String? valueRelationship;
  String? valueSex;
  String? valueTypeResidence;
  final formKeyBasicInfo = GlobalKey<FormState>();
  String? relationshipValidate;
  String? sexValidate;
  String? typeResidenceValidate;
  String? fullnamevalidate;
  String? dateValidate;
  String? cccdValidate;
  String? nationalValidate;
  String? sexIndexx;

  String? typeResidenceIndex;

  setValueSex(String i) {
    if (i == "1") {
      valueSex = "MALE";
      sexIndexx = i;
      notifyListeners();
    } else if (i == "2") {
      valueSex = "FEMALE";
      sexIndexx = i;
      notifyListeners();
    } else {
      valueSex = null;
      notifyListeners();
    }
  }

  setValueTypeResidence(String i) {
    if (i == "1") {
      typeResidenceIndex = i;

      valueTypeResidence = "RESIDENT";
      notifyListeners();
    } else {
      typeResidenceIndex = i;
      valueTypeResidence = "STAYING";
      notifyListeners();
    }
  }

  setValueRelationship(String id) {
    valueRelationship = id;
  }

  validateFullname() {
    if (fullnameTextCtr.text.trim().isEmpty) {
      fullnamevalidate = S.current.can_not_empty;
      notifyListeners();
      return "";
    } else if (RegexText.requiredSpecialChar(fullnameTextCtr.text.trim())) {
      fullnamevalidate = S.current.no_special_char;
      notifyListeners();
      return "";
    } else {
      fullnamevalidate = null;
      notifyListeners();
      return null;
    }
  }

  validateBirthday() {
    if (dateTextCtr.text.trim().isEmpty) {
      dateValidate = S.current.can_not_empty;

      notifyListeners();
      return "";
    } else {
      dateValidate = null;
      notifyListeners();
      return null;
    }
  }

  validateNational() {
    if (nationalTextCtr.text.trim().isEmpty) {
      nationalValidate = S.current.can_not_empty;
      print('na :$nationalValidate');
      notifyListeners();
      return "";
    } else {
      print("ac");
      nationalValidate = null;
      notifyListeners();
      return null;
    }
  }

  validateRelationship() {
    if (valueRelationship == null) {
      relationshipValidate = "Hãy chọn một giá trị";
      notifyListeners();
      return "";
    } else {
      relationshipValidate = null;
      notifyListeners();
      return null;
    }
  }

  validateSex() {
    if (valueSex == null) {
      sexValidate = "Hãy chọn một giá trị";
      notifyListeners();
      return "";
    } else {
      sexValidate = null;
      notifyListeners();
      return null;
    }
  }

  validateTypeResidence() {
    if (valueTypeResidence == null) {
      typeResidenceValidate = "Hãy chọn một giá trị";
      notifyListeners();
      return "";
    } else {
      typeResidenceValidate = null;
      notifyListeners();
      return null;
    }
  }

  bool validateBasicInfo() {
    if (formKeyBasicInfo.currentState!.validate()) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
