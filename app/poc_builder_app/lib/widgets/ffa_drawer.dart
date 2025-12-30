import 'package:flutter/material.dart';

class FFADrawer extends StatelessWidget {
  final void Function(String route) onNavigate;
  const FFADrawer({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey.shade900,
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Menú', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            ListTile(
              leading: const Icon(Icons.schedule, color: Colors.white),
              title: const Text('Itinerario', style: TextStyle(color: Colors.white)),
              onTap: () => onNavigate('itinerario'),
            ),
            ListTile(
              leading: const Icon(Icons.inventory_2, color: Colors.white),
              title: const Text('Catálogo', style: TextStyle(color: Colors.white)),
              onTap: () => onNavigate('catalogo'),
            ),
            ListTile(
              leading: const Icon(Icons.store_mall_directory, color: Colors.white),
              title: const Text('Sucursales', style: TextStyle(color: Colors.white)),
              onTap: () => onNavigate('sucursales'),
            ),
          ],
        ),
      ),
    );
  }
}
