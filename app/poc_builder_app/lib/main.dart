import 'package:flutter/material.dart';
import 'widgets/side_menu_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Lateral Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3C8FB2)),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Lateral Demo'),
        backgroundColor: const Color(0xFF3C8FB2),
        foregroundColor: Colors.white,
      ),
      drawer: SideMenuDrawer(
        userName: 'Nombre Apellido',
        userId: '000000',
        userRegion: 'Nor-oriente',
        isConnected: true,
        lastSyncDate: DateTime.now(),
        onNotifications: () {
          Navigator.pop(context);
          _showMessage(context, 'Notificaciones');
        },
        onClients: () {
          Navigator.pop(context);
          _showMessage(context, 'Clientes');
        },
        onItinerary: () {
          Navigator.pop(context);
          _showMessage(context, 'Itinerario');
        },
        onOrderHistory: () {
          Navigator.pop(context);
          _showMessage(context, 'Historial de pedidos');
        },
        onCatalog: () {
          Navigator.pop(context);
          _showMessage(context, 'Catálogo');
        },
        onPromotions: () {
          Navigator.pop(context);
          _showMessage(context, 'Promociones');
        },
        onMetrics: () {
          Navigator.pop(context);
          _showMessage(context, 'Mis métricas');
        },
        onFiscalGroups: () {
          Navigator.pop(context);
          _showMessage(context, 'Grupos fiscales');
        },
        onPendingApprovals: () {
          Navigator.pop(context);
          _showMessage(context, 'Aprobaciones pendientes');
        },
        onLogout: () {
          Navigator.pop(context);
          _showMessage(context, 'Cerrar sesión');
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Abrir el menú lateral usando el botón del AppBar',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
              label: const Text('Abrir Drawer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3C8FB2),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navegando a: $message'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
