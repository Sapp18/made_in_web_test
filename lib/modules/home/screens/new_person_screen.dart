import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../app/app.dart';
import '../../../domain/domain.dart';
import '../../../widgets/widgets.dart';
import '../../modules.dart';

class NewPersonScreen extends StatelessWidget {
  static const String name = 'new_person_screen';
  final bool? isNewPerson;
  final ListPersonModel? person;
  const NewPersonScreen({
    Key? key,
    this.isNewPerson = false,
    this.person,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewPersonProvider(isNewPerson!, person: person),
        ),
      ],
      child: _NewPersonScreen(isNewPerson: isNewPerson!),
    );
  }
}

class _NewPersonScreen extends StatelessWidget {
  final bool isNewPerson;
  const _NewPersonScreen({required this.isNewPerson});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final provider = Provider.of<NewPersonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(isNewPerson ? 'Agregar nueva persona' : 'Editar persona'),
        centerTitle: true,
        actions: isNewPerson
            ? null
            : [
                IconButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => ShowDialog(
                      title: 'Borrar registro',
                      content:
                          '¿Estás seguro de borrar a ${provider.nameCon.text} ${provider.lastNameCon.text} ${provider.mLastNameCon.text}?',
                      onPressed: () async {
                        await AppService()
                            .apiDelete(
                          'ONER PATH, CON ID A ELIMINAR',
                        )
                            .then(
                          (value) {
                            if (value.statusCode == 200) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Registro borrado'),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              );
                              Navigator.pop(context);
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(value.body),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  icon: Icon(
                    Icons.delete_rounded,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horPadding),
          child: Column(
            children: [
              SizedBox(height: size.height * .06),
              GestureDetector(
                onTap: () => showModalBottomSheet(
                  useSafeArea: true,
                  elevation: 20,
                  context: context,
                  builder: (_) => _ModalBottomSheetWidget(provider),
                ),
                child: provider.photo == null
                    ? Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              provider.imageCon.text == ''
                                  ? 'https://www.eleonoracardona.com/wp-content/uploads/2016/04/sin-foto.jpg'
                                  : provider.imageCon.text,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.memory(
                          provider.photo!,
                        ),
                      ),
              ),
              SizedBox(height: size.height * .06),
              MainTextFormField(
                controller: provider.nameCon,
                hintText: 'Escribe tu nombre',
                icon: const Icon(Icons.person),
                labelText: 'Nombre',
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: size.height * .02),
              MainTextFormField(
                controller: provider.lastNameCon,
                hintText: 'Escribe tu primer apellido',
                icon: const Icon(Icons.person),
                labelText: 'Primer apellido',
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: size.height * .02),
              MainTextFormField(
                controller: provider.mLastNameCon,
                hintText: 'Escribe tu segundo apellido',
                icon: const Icon(Icons.person),
                labelText: 'Segundo Apellido',
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: size.height * .02),
              MainTextFormField(
                controller: provider.birthdayCon,
                hintText: 'Escribe tu fecha de nacimiento',
                icon: const Icon(Icons.cake_rounded),
                labelText: 'Fecha de nacimiento',
                textCapitalization: TextCapitalization.words,
                readOnly: true,
                onTap: () => showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate:
                      DateTime.now().subtract(const Duration(days: 10950)),
                  lastDate: DateTime.now(),
                ).then(
                  (DateTime? value) => provider.birthdayCon.text =
                      DateFormat('yyyy-MM-dd').format(
                    value ?? DateTime.now(),
                  ),
                ),
              ),
              SizedBox(height: size.height * .02),
              MainTextFormField(
                controller: provider.emailCon,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Escribe tu correo electronico',
                icon: const Icon(Icons.email),
                labelText: 'Correo electronico',
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: size.height * .02),
              MainTextFormField(
                controller: provider.rfcCon,
                keyboardType: TextInputType.text,
                hintText: 'Escribe tu rfc',
                icon: const Icon(Icons.edit_document),
                labelText: 'RFC',
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: size.height * .02),
              MainTextFormField(
                controller: provider.curpCon,
                keyboardType: TextInputType.text,
                hintText: 'Escribe tu curp',
                icon: const Icon(Icons.edit_document),
                labelText: 'CURP',
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: size.height * .02),
              MainTextFormField(
                controller: provider.passwordCon,
                keyboardType: TextInputType.text,
                hintText: 'Escribe tu contraseña',
                icon: const Icon(Icons.password_rounded),
                labelText: 'Contraseña',
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: size.height * .02),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(LightTheme.onPrimary),
                  ),
                  onPressed: !provider.isLoading
                      ? () async {
                          provider.isLoading = true;
                          if (provider.photo != null) {
                            provider.imageCon.text = provider.photo.toString();
                          } else {
                            provider.imageCon.text = '';
                          }
                          PersonModel personModel = PersonModel(
                            formdata: [
                              Formdatum(
                                key: 'name',
                                value: provider.nameCon.text,
                                type: 'text',
                              ),
                              Formdatum(
                                key: 'last_name',
                                value: provider.lastNameCon.text,
                                type: 'text',
                              ),
                              Formdatum(
                                key: 'm_last_name',
                                value: provider.mLastNameCon.text,
                                type: 'text',
                              ),
                              Formdatum(
                                key: 'birthday',
                                value: provider.birthdayCon.text,
                                type: 'text',
                              ),
                              Formdatum(
                                key: 'email',
                                value: provider.emailCon.text,
                                type: 'text',
                              ),
                              Formdatum(
                                key: 'rfc',
                                value: provider.rfcCon.text,
                                type: 'text',
                              ),
                              Formdatum(
                                key: 'curp',
                                value: provider.curpCon.text,
                                type: 'text',
                              ),
                              Formdatum(
                                key: 'password',
                                value: provider.passwordCon.text,
                                type: 'text',
                              ),
                              Formdatum(
                                key: 'image',
                                type: 'file',
                                src: provider.imageCon.text,
                              ),
                            ],
                          );
                          if (isNewPerson) {
                            await AppService()
                                .apiPost('PONER PATH',
                                    data: personModelToJson(personModel))
                                .then(
                              (value) {
                                if (value.statusCode == 201) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          const Text('Nuevo registro creado'),
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  );
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(value.body),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            await AppService()
                                .apiPut('PONER PATH, CON ID A EDITAR',
                                    data: personModelToJson(personModel))
                                .then(
                              (value) {
                                if (value.statusCode == 204) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          const Text('Registro actualizado'),
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  );
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(value.body),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                }
                              },
                            );
                          }
                          provider.isLoading = false;
                        }
                      : () {},
                  child: Text(
                    !provider.isLoading
                        ? '${isNewPerson ? 'Guardar registro' : 'Editar registro'} '
                        : 'Cargando...',
                    style: AppStyle.w500(20, Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModalBottomSheetWidget extends StatelessWidget {
  final NewPersonProvider provider;
  const _ModalBottomSheetWidget(this.provider);
  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      title: 'Selecciona una opción',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              await filePicker().then((XFile? pickedFile) async {
                if (pickedFile == null) return;
                await pickedFile.readAsBytes().then(
                  (Uint8List value) {
                    provider.photo = value;
                    Navigator.pop(context);
                  },
                );
              });
            },
            child: Text(
              'Tomar de cámara',
              style: AppStyle.w400(16),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              await filePickerGalery().then((XFile? pickedFile) async {
                if (pickedFile == null) return;
                await pickedFile.readAsBytes().then(
                  (Uint8List value) {
                    provider.photo = value;
                    Navigator.pop(context);
                  },
                );
              });
            },
            child: Text(
              'Elegir de galería',
              style: AppStyle.w400(16),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
