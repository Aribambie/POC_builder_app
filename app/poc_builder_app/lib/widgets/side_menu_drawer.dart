import 'package:flutter/material.dart';

class SideMenuDrawer extends StatelessWidget {
  final String userName;
  final String userId;
  final String userRegion;
  final bool isConnected;
  final DateTime? lastSyncDate;
  final VoidCallback? onClose;
  final VoidCallback? onLogout;
  final VoidCallback? onNotifications;
  final VoidCallback? onClients;
  final VoidCallback? onItinerary;
  final VoidCallback? onOrderHistory;
  final VoidCallback? onCatalog;
  final VoidCallback? onPromotions;
  final VoidCallback? onMetrics;
  final VoidCallback? onFiscalGroups;
  final VoidCallback? onPendingApprovals;

  const SideMenuDrawer({
    super.key,
    required this.userName,
    required this.userId,
    required this.userRegion,
    this.isConnected = true,
    this.lastSyncDate,
    this.onClose,
    this.onLogout,
    this.onNotifications,
    this.onClients,
    this.onItinerary,
    this.onOrderHistory,
    this.onCatalog,
    this.onPromotions,
    this.onMetrics,
    this.onFiscalGroups,
    this.onPendingApprovals,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3C8FB2),
              Color(0xFF425490),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildProfileSection(),
              const SizedBox(height: 20),
              const Divider(
                color: Color(0xFFF9FBFF),
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _buildMenuItems(),
              ),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  const Icon(
                    Icons.wifi,
                    color: Colors.white,
                    size: 24,
                  ),
                  if (isConnected)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFF06A77D),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 17),
              const Text(
                'Conectado',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onClose ?? () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFFF9FBFF),
              size: 20,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.3),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  color: Color(0xFFF9FBFF),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 1.43,
                ),
              ),
              Text(
                userId,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              Text(
                userRegion,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _MenuItem(
              icon: Icons.notifications_outlined,
              label: 'Notificaciones',
              onTap: onNotifications,
            ),
            const SizedBox(height: 38),
            _MenuItem(
              icon: Icons.storefront_outlined,
              label: 'Clientes',
              onTap: onClients,
            ),
            const SizedBox(height: 38),
            _MenuItem(
              icon: Icons.alarm,
              label: 'Itinerario',
              onTap: onItinerary,
            ),
            const SizedBox(height: 38),
            _MenuItem(
              icon: Icons.receipt_long_outlined,
              label: 'Historial de pedidos',
              onTap: onOrderHistory,
            ),
            const SizedBox(height: 38),
            _MenuItem(
              icon: Icons.list_alt,
              label: 'Catálogo',
              onTap: onCatalog,
            ),
            const SizedBox(height: 38),
            _MenuItem(
              icon: Icons.sell_outlined,
              label: 'Promociones',
              onTap: onPromotions,
              isEnabled: false,
            ),
            const SizedBox(height: 38),
            _MenuItem(
              icon: Icons.bar_chart,
              label: 'Mis métricas',
              onTap: onMetrics,
            ),
            const SizedBox(height: 38),
            _MenuItem(
              icon: Icons.edit_document,
              label: 'Grupos fiscales',
              onTap: onFiscalGroups,
            ),
            const SizedBox(height: 38),
            _MenuItem(
              icon: Icons.how_to_reg_outlined,
              label: 'Aprobaciones pendientes',
              onTap: onPendingApprovals,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          if (lastSyncDate != null)
            Text(
              _formatLastSync(lastSyncDate!),
              style: const TextStyle(
                color: Color(0xFFBFC6DA),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            )
          else
            const Text(
              'Ultima sincronización: dd/mm/aaaa hh:mm am',
              style: TextStyle(
                color: Color(0xFFBFC6DA),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: onLogout,
            child: const Text(
              'Cerrar sesión',
              style: TextStyle(
                color: Color(0xFFF8FBFF),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  String _formatLastSync(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;
    final hour = date.hour > 12 ? date.hour - 12 : date.hour;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'pm' : 'am';
    
    return 'Ultima sincronización: $day/$month/$year ${hour.toString().padLeft(2, '0')}:$minute $period';
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isEnabled;

  const _MenuItem({
    required this.icon,
    required this.label,
    this.onTap,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isEnabled ? const Color(0xFFF8FBFF) : const Color(0xFFC6C8D6);
    final iconColor = isEnabled ? Colors.white : const Color(0xFFC6C8D6);

    return InkWell(
      onTap: isEnabled ? onTap : null,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
