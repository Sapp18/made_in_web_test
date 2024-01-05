import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/domain.dart';

class NewPersonProvider extends ChangeNotifier {
  NewPersonProvider(bool isNewPerson, {ListPersonModel? person}) {
    nameCon.text = person?.name ?? '';
    lastNameCon.text = person?.lastName ?? '';
    mLastNameCon.text = person?.mLastName ?? '';
    birthdayCon.text = person?.birthday == null
        ? ''
        : DateFormat('yyyy-MM-dd').format(person!.birthday!);
    emailCon.text = person?.email ?? '';
    rfcCon.text = person?.rfc ?? '';
    curpCon.text = person?.curp ?? '';
    passwordCon.text = person?.password ?? '';
    imageCon.text = person?.image ?? '';
  }
  bool _isLoading = false;
  TextEditingController nameCon = TextEditingController();
  TextEditingController lastNameCon = TextEditingController();
  TextEditingController mLastNameCon = TextEditingController();
  TextEditingController birthdayCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController rfcCon = TextEditingController();
  TextEditingController curpCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController imageCon = TextEditingController();
  Uint8List? _photo;

  Uint8List? get photo => _photo;
  set photo(Uint8List? value) {
    _photo = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
