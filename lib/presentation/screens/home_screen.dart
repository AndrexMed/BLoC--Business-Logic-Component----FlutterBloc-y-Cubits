import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado Simple'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/cubit_counter'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Gestor de estado Completo'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/bloc_counter'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
