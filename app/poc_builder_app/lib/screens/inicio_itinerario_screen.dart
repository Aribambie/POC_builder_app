import 'package:flutter/material.dart';
import '../theme/design_tokens.dart';
import 'actividades_asignadas_screen.dart';

class InicioItinerarioScreen extends StatefulWidget {
  const InicioItinerarioScreen({super.key});

  @override
  State<InicioItinerarioScreen> createState() => _InicioItinerarioScreenState();
}

class _InicioItinerarioScreenState extends State<InicioItinerarioScreen> {
  int _selectedTabIndex = 0;
  int _selectedDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.neutralText20,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: DesignTokens.spacingXL),
                _buildHeader(),
                const SizedBox(height: DesignTokens.spacing27),
                _buildSearchBar(),
                const SizedBox(height: DesignTokens.spacing27),
                _buildWeekSelector(),
                const SizedBox(height: 27),
                _buildActivitiesSection(),
                const SizedBox(height: 27),
                _buildClientsSection(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Itinerario',
          style: TextStyle(
            color: DesignTokens.primaryColor100,
            fontSize: DesignTokens.fontSizeXL,
            fontWeight: DesignTokens.fontWeightBold,
            height: 1.25,
          ),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: DesignTokens.neutralWhite,
                border: Border.all(color: DesignTokens.primaryColor10),
                borderRadius: BorderRadius.circular(DesignTokens.radiusM),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.map_outlined,
                    size: 16,
                    color: const Color(0xFF001E6D),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Ver mapa',
                    style: TextStyle(
                      color: Color(0xFF001E6D),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Icon(
              Icons.notifications_outlined,
              size: 24,
              color: const Color(0xFF5E7FCD),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE6E8F0)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: const Color(0xFFC6C8D6),
            size: 18,
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Text(
              'Buscar',
              style: TextStyle(
                color: Color(0xFFC6C8D6),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.43,
              ),
            ),
          ),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: const Color(0xFFF4F6FE),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.filter_alt_outlined,
              size: 20,
              color: const Color(0xFF425490),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Semana #7 2025',
              style: TextStyle(
                color: Color(0xFF6A6C78),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            const Text(
              'Semana #8 2025',
              style: TextStyle(
                color: Color(0xFFC6C8D6),
                fontSize: 8,
                fontWeight: FontWeight.w400,
                height: 1.25,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildWeekArrow(
              icon: Icons.chevron_left,
              enabled: false,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDayItem('L', '13', isSelected: true),
                  _buildDayItem('M', '14'),
                  _buildDayItem('M', '15'),
                  _buildDayItem('J', '16'),
                  _buildDayItem('V', '17'),
                  _buildDayItem('S', '18'),
                ],
              ),
            ),
            const SizedBox(width: 20),
            _buildWeekArrow(
              icon: Icons.chevron_right,
              enabled: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWeekArrow({required IconData icon, required bool enabled}) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: enabled ? const Color(0xFFF0F2FA) : const Color(0xFFE6E8F0),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        size: 16,
        color: enabled ? const Color(0xFF5E7FCD) : const Color(0xFFA8AAB8),
      ),
    );
  }

  Widget _buildDayItem(String day, String number, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            color: isSelected ? const Color(0xFFF9FBFF) : const Color(0xFF001E6D),
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 1.43,
          ),
        ),
        const SizedBox(height: 3),
        Container(
          width: 24,
          height: 17,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF51BFE7) : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: TextStyle(
              color: isSelected ? const Color(0xFFF9FBFF) : const Color(0xFF001E6D),
              fontSize: 10,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActivitiesSection() {
    final activities = [
      'Entrega pedido',
      'Reparación estantería',
      'Mantenimiento de luminarias',
      'Ajuste de puertas de vitrinas',
      'Reparación de mobiliario',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Actividades de hoy',
              style: TextStyle(
                color: Color(0xFF6A6C78),
                fontSize: 14,
                fontWeight: FontWeight.w700,
                height: 1.43,
              ),
            ),
            Icon(
              Icons.preview_outlined,
              size: 24,
              color: const Color(0xFFC6C8D6),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE6E8F0)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              for (int i = 0; i < activities.length; i++) ...[
                if (i > 0) ...[
                  const Divider(
                    height: 9,
                    color: Color(0xFFE8EAF9),
                  ),
                ],
                _buildActivityItem(activities[i]),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF4A4C58),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFE6E8F0),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'Pendiente',
              style: TextStyle(
                color: Color(0xFF7E808D),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Clientes',
          style: TextStyle(
            color: Color(0xFF6A6C78),
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 1.43,
          ),
        ),
        const Text(
          'Tienes 4 clientes pendientes de visitar',
          style: TextStyle(
            color: Color(0xFF6A6C78),
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        _buildClientTabs(),
        const SizedBox(height: 10),
        _buildClientsList(),
      ],
    );
  }

  Widget _buildClientTabs() {
    return Row(
      children: [
        _buildTabButton('Ver todos', 0),
        const SizedBox(width: 10),
        _buildTabButton('Pendientes', 1),
        const SizedBox(width: 10),
        _buildTabButton('Visitados', 2),
      ],
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEFF8FC) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF51BFE7) : const Color(0xFFE6E8F0),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF001E6D),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildClientsList() {
    final clients = [
      ClientData(
        name: 'Tienda El Buen Precio',
        code: '300001',
        address: '7a Avenida 12-45, Zona 1. Ciudad de Guatemala',
        pendingCount: 3,
        statusColor: const Color(0xFF06A77D),
        showAddress: true,
      ),
      ClientData(
        name: 'Super tienda Martín',
        code: '300302',
        address: null,
        pendingCount: 3,
        statusColor: const Color(0xFFFBE07D),
        showAddress: false,
      ),
      ClientData(
        name: 'Tienda la Esperanza',
        code: '460302',
        address: '4a Calle 8-22, Zona 3. Ciudad de Guatemala',
        pendingCount: 3,
        statusColor: const Color(0xFF06A77D),
        showAddress: true,
      ),
      ClientData(
        name: 'Mini Market Doña Rosa',
        code: '720212',
        address: null,
        pendingCount: 3,
        statusColor: const Color(0xFFFBE07D),
        showAddress: false,
      ),
    ];

    return Column(
      children: [
        for (int i = 0; i < clients.length; i++) ...[
          if (i > 0) const SizedBox(height: 10),
          _buildClientCard(clients[i]),
        ],
      ],
    );
  }

  Widget _buildClientCard(ClientData client) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ActividadesAsignadasScreen(
              clientName: client.name,
              clientCode: client.code,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            width: 10,
            height: 95,
            decoration: BoxDecoration(
              color: client.statusColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE6E8F0)),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            client.name,
                            style: const TextStyle(
                              color: Color(0xFF4A4C58),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1.43,
                            ),
                          ),
                          Text(
                            client.code,
                            style: const TextStyle(
                              color: Color(0xFFA8AAB8),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 22,
                      height: 22,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: client.pendingCount > 0
                            ? const Color(0xFF51BFE7)
                            : const Color(0xFFA8AAB8),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${client.pendingCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                if (client.showAddress && client.address != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFF51BFE7),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.navigation,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 214,
                            child: Text(
                              client.address!,
                              style: const TextStyle(
                                color: Color(0xFF6A6C78),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: const Color(0xFF6A6C78),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ClientData {
  final String name;
  final String code;
  final String? address;
  final int pendingCount;
  final Color statusColor;
  final bool showAddress;

  ClientData({
    required this.name,
    required this.code,
    required this.address,
    required this.pendingCount,
    required this.statusColor,
    required this.showAddress,
  });
}
