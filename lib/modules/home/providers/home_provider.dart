import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../../providers/providers.dart';

class HomeProvider extends ChangeNotifier {
  bool isDarkmode = false;
  List<ListPersonModel> listPersonModel = [];

  Future<List<ListPersonModel>> getInfo() async {
    //?? DESCOMENTAR PARA LLAMAR A LA API
    // final value = await AppService().apiGet('');
    // if (value.statusCode == 200) {
    //   listPersonModel = listPersonModelFromJson(value.body); //!Aqui se llena el modelo
    // } else {
    //   log('Error statusCode:${value.statusCode}');
    // }
    //?? SIMULANDO RESPUESTA
    listPersonModel = [
      ListPersonModel(
        name: 'Saul',
        lastName: 'Perez',
        mLastName: 'Ponce',
        birthday: DateTime(1997, 06, 18),
        email: 'saulpp18@outlook.com',
        rfc: 'PEPS970618N46',
        curp: 'PEPS970618HDFRNL06',
        password: '12345',
      ),
      ListPersonModel(
        name: 'María',
        lastName: 'Rodríguez',
        mLastName: 'Hernández',
        birthday: DateTime(2000, 08, 28),
        email: 'maria@outlook.com',
        rfc: 'ROAM951207XDF',
        curp: 'ROMA951207MDFRRL07',
        password: '12345',
        image:
            'https://static.diariofemenino.com/uploads/trabajo/215742-realizarte-mujer.jpg',
      ),
    ];
    return listPersonModel;
  }

  void changeTheme(bool value, ThemeProvider provider) {
    isDarkmode = value;
    value ? provider.setDarkMode() : provider.setLightMode();
    notifyListeners();
  }
}
