import 'package:flutter/material.dart';
import 'screens/inicio_itinerario_screen.dart';
import 'widgets/side_menu_drawer.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  // 0 Menú, 1 Sucursales, 2 X, 3 Itinerario, 4 Catálogo
  int _tabIndex = 3;

  Future<void> _openFullMenu() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => SizedBox(
        height: MediaQuery.of(ctx).size.height,
        width: double.infinity,
        child: SideMenuDrawer(
          userName: 'Nombre Apellido',
          userId: '000000',
          userRegion: 'Nor-oriente',
          isConnected: true,
          lastSyncDate: DateTime.now(),
          onClose: () => Navigator.pop(ctx),
          onLogout: () => Navigator.pop(ctx),
          onNotifications: () => Navigator.pop(ctx),
          onClients: () => Navigator.pop(ctx),
          onItinerary: () {
            Navigator.pop(ctx);
            setState(() => _tabIndex = 3);
          },
          onOrderHistory: () => Navigator.pop(ctx),
          onCatalog: () {
            Navigator.pop(ctx);
            setState(() => _tabIndex = 4);
          },
          onPromotions: () => Navigator.pop(ctx),
          onMetrics: () => Navigator.pop(ctx),
          onFiscalGroups: () => Navigator.pop(ctx),
          onPendingApprovals: () => Navigator.pop(ctx),
        ),
      ),
    );
  }

  Widget _body() {
    if (_tabIndex == 3) return InicioItinerarioScreen();
    if (_tabIndex == 4) return const Center(child: Text('Catálogo (stub)'));
    if (_tabIndex == 1) return const Center(child: Text('Sucursales (stub)'));
    return InicioItinerarioScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _bottomBar() {
    // SafeArea evita que se meta en la barra de navegación del teléfono sin causar overflow.
    return SafeArea(
      top: false,
      child: SizedBox(
        height: 90, // suficiente para halo + botón sin overflow
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            // Barra rectangular borde-a-borde (sin redondeo)
            Container(
              height: 70,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.zero,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 18,
                    color: Colors.black12,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _navItem(
                          icon: Icons.menu_rounded,
                          label: 'Menú',
                          selected: _tabIndex == 0,
                          onTap: () {
                            _openFullMenu();
                            setState(() => _tabIndex = 0);
                          },
                        ),
                        _navItem(
                          icon: Icons.person_outline_rounded,
                          label: 'Sucursales',
                          selected: _tabIndex == 1,
                          onTap: () => setState(() => _tabIndex = 1),
                        ),
                      ],
                    ),
                  ),

                  // Espacio para el botón central
                  const SizedBox(width: 88),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _navItem(
                          icon: Icons.access_time_rounded,
                          label: 'Itinerario',
                          selected: _tabIndex == 3,
                          onTap: () => setState(() => _tabIndex = 3),
                        ),
                        _navItem(
                          icon: Icons.shopping_bag_outlined,
                          label: 'Catálogo',
                          selected: _tabIndex == 4,
                          onTap: () => setState(() => _tabIndex = 4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Botón central un poquito más pequeño + halo completo (sin recorte)
            Positioned(
              bottom: 14,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF7D7D2),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => _tabIndex = 2),
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF2B9B0),
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        size: 28,
                        color: Color(0xFFD63B2C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    // Verde tipo "indicador" como tu mock para el seleccionado
    final iconColor = selected ? const Color(0xFF1DB954) : const Color(0xFF8A8F98);
    final textColor = const Color(0xFF8A8F98);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 26, color: iconColor),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 13, color: textColor)),
          ],
        ),
      ),
    );
  }
}

