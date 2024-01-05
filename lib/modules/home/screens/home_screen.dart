import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../modules.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
      ],
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de personas'),
        centerTitle: true,
        actions: [
          Switch.adaptive(
            activeColor: Theme.of(context).colorScheme.secondary,
            inactiveThumbColor: Theme.of(context).colorScheme.primary,
            inactiveTrackColor: Theme.of(context).colorScheme.background,
            value: provider.isDarkmode,
            onChanged: (value) {
              provider.changeTheme(value, themeProvider);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: provider.getInfo(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.listPersonModel.length,
              itemBuilder: (_, int i) {
                var listPersonModel = provider.listPersonModel[i];
                return ListTile(
                  title: Text(
                    "${listPersonModel.name ?? ''} ${listPersonModel.lastName ?? ''} ${listPersonModel.mLastName ?? ''}",
                  ),
                  subtitle: Text(listPersonModel.email ?? ''),
                  leading: listPersonModel.image == null
                      ? const Icon(
                          Icons.person,
                          size: 40,
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(listPersonModel.image!),
                          maxRadius: 20,
                        ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewPersonScreen(
                        person: listPersonModel,
                      ),
                    ),
                  ).then((value) => provider.getInfo()),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const NewPersonScreen(isNewPerson: true),
            ),
          ).then((value) => provider.getInfo()),
        ),
      ),
    );
  }
}
