class RegExpHelpers {
  static const email =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String? validateEmail(String? value) {
    RegExp regExp = RegExp(email);
    return regExp.hasMatch(value ?? '') ? null : 'Correo incorrecto';
  }
}
