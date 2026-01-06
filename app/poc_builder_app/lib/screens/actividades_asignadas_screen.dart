import 'package:flutter/material.dart';
import '../theme/design_tokens.dart';

class ActividadesAsignadasScreen extends StatefulWidget {
  final String clientName;
  final String clientCode;
  final String? clientImageUrl;

  const ActividadesAsignadasScreen({
    super.key,
    required this.clientName,
    required this.clientCode,
    this.clientImageUrl,
  });

  @override
  State<ActividadesAsignadasScreen> createState() =>
      _ActividadesAsignadasScreenState();
}

class _ActividadesAsignadasScreenState
    extends State<ActividadesAsignadasScreen> {
  bool _tareasFinalizadasExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.neutralText20,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildHeader(),
                const SizedBox(height: 25),
                _buildActionButtons(),
                const SizedBox(height: 25),
                _buildClientInfo(),
                const SizedBox(height: 20),
                _buildActividadesDeHoy(),
                const SizedBox(height: 20),
                _buildTareasFinalizadas(),
                const SizedBox(height: 100),
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
          'Actividades asignadas',
          style: TextStyle(
            color: DesignTokens.primaryColor100,
            fontSize: 16,
            fontWeight: DesignTokens.fontWeightBold,
            height: 1.25,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: DesignTokens.primaryColor75,
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                'Atrás',
                style: TextStyle(
                  color: DesignTokens.primaryColor75,
                  fontSize: 14,
                  fontWeight: DesignTokens.fontWeightMedium,
                  height: 1.43,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            icon: Icons.map_outlined,
            label: 'Ver mapa',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildActionButton(
            icon: Icons.account_circle_outlined,
            label: 'Ver perfil',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: DesignTokens.neutralWhite,
          border: Border.all(color: DesignTokens.primaryColor10),
          borderRadius: BorderRadius.circular(DesignTokens.radiusM),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: DesignTokens.primaryColor100,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                color: DesignTokens.primaryColor100,
                fontSize: 12,
                fontWeight: DesignTokens.fontWeightBold,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClientInfo() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: DesignTokens.neutralText80,
            image: widget.clientImageUrl != null
                ? DecorationImage(
                    image: NetworkImage(widget.clientImageUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: widget.clientImageUrl == null
              ? const Icon(
                  Icons.store,
                  color: DesignTokens.neutralWhite,
                  size: 28,
                )
              : null,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.clientName,
                style: const TextStyle(
                  color: DesignTokens.primaryColor100,
                  fontSize: 14,
                  fontWeight: DesignTokens.fontWeightBold,
                  height: 1.43,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                widget.clientCode,
                style: const TextStyle(
                  color: DesignTokens.secondaryColorDark,
                  fontSize: 14,
                  fontWeight: DesignTokens.fontWeightBold,
                  height: 1.43,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActividadesDeHoy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Actividades de hoy',
              style: TextStyle(
                color: DesignTokens.neutralText90,
                fontSize: 14,
                fontWeight: DesignTokens.fontWeightBold,
                height: 1.43,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.add_box_outlined,
                size: 24,
                color: DesignTokens.primaryColor100,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildActivityItem(
          title: 'Venta',
          status: 'Pendiente',
          isPending: true,
        ),
        const SizedBox(height: 10),
        _buildActivityItem(
          title: 'Registro salida',
          status: 'Pendiente',
          isPending: true,
        ),
      ],
    );
  }

  Widget _buildTareasFinalizadas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _tareasFinalizadasExpanded = !_tareasFinalizadasExpanded;
            });
          },
          child: Row(
            children: [
              const Text(
                'Tareas finalizadas',
                style: TextStyle(
                  color: DesignTokens.neutralText90,
                  fontSize: 14,
                  fontWeight: DesignTokens.fontWeightBold,
                  height: 1.43,
                ),
              ),
              const SizedBox(width: 9),
              Transform.rotate(
                angle: _tareasFinalizadasExpanded ? 0 : 3.14159,
                child: const Icon(
                  Icons.keyboard_arrow_up,
                  size: 14,
                  color: DesignTokens.neutralText90,
                ),
              ),
            ],
          ),
        ),
        if (_tareasFinalizadasExpanded) ...[
          const SizedBox(height: 8),
          _buildActivityItem(
            title: 'Registro entrada',
            status: 'Finalizada',
            isPending: false,
          ),
        ],
      ],
    );
  }

  Widget _buildActivityItem({
    required String title,
    required String status,
    required bool isPending,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 21),
      decoration: BoxDecoration(
        color: DesignTokens.neutralWhite,
        border: Border.all(color: DesignTokens.primaryColor10),
        borderRadius: BorderRadius.circular(DesignTokens.radiusL),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: DesignTokens.neutralText100,
              fontSize: 12,
              fontWeight: DesignTokens.fontWeightBold,
              height: 1.5,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(
              color: isPending
                  ? DesignTokens.primaryColor10
                  : DesignTokens.successColor25,
              borderRadius: BorderRadius.circular(DesignTokens.radiusS),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: isPending
                    ? DesignTokens.neutralText80
                    : DesignTokens.successColor,
                fontSize: 10,
                fontWeight: DesignTokens.fontWeightRegular,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
