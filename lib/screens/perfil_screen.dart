import 'package:flutter/cupertino.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';
import '../widgets/cupertino_card.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  void _editarPerfil() {
    final nombreCtrl =
        TextEditingController(text: AppData.perfilUsuario['nombre'] as String);
    final telefonoCtrl = TextEditingController(
        text: AppData.perfilUsuario['telefono'] as String);

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Editar Perfil'),
        content: Column(
          children: [
            const SizedBox(height: 12),
            CupertinoTextField(
              controller: nombreCtrl,
              placeholder: 'Nombre',
            ),
            const SizedBox(height: 8),
            CupertinoTextField(
              controller: telefonoCtrl,
              placeholder: 'Teléfono',
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              setState(() {
                AppData.perfilUsuario['nombre'] = nombreCtrl.text.trim();
                AppData.perfilUsuario['telefono'] = telefonoCtrl.text.trim();
              });
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final perfil = AppData.perfilUsuario;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.primaryBlue,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(
            CupertinoIcons.back,
            color: CupertinoColors.white,
          ),
        ),
        middle: const Text(
          'Perfil',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Avatar circular con badge
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.person_fill,
                      size: 54,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.pencil,
                      color: CupertinoColors.white,
                      size: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                perfil['nombre'] as String,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                perfil['email'] as String,
                style: const TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              const SizedBox(height: 24),

              // Card con CupertinoListTiles del perfil
              CupertinoCard(
                child: Column(
                  children: [
                    CupertinoListTile(
                      leading: const Icon(
                        CupertinoIcons.person_fill,
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      title: const Text('Nombre'),
                      additionalInfo: Text(perfil['nombre'] as String),
                    ),
                    Container(height: 1, color: CupertinoColors.systemGrey6),
                    CupertinoListTile(
                      leading: const Icon(
                        CupertinoIcons.mail_solid,
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      title: const Text('Email'),
                      additionalInfo: Text(perfil['email'] as String),
                    ),
                    Container(height: 1, color: CupertinoColors.systemGrey6),
                    CupertinoListTile(
                      leading: const Icon(
                        CupertinoIcons.phone_fill,
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      title: const Text('Teléfono'),
                      additionalInfo: Text(perfil['telefono'] as String),
                    ),
                    Container(height: 1, color: CupertinoColors.systemGrey6),
                    CupertinoListTile(
                      leading: const Icon(
                        CupertinoIcons.gear_solid,
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      title: const Text('Roles'),
                      additionalInfo: Text(perfil['rol'] as String),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Botón EDITAR PERFIL con borde azul
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.primaryBlue, width: 1.5),
                ),
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  onPressed: _editarPerfil,
                  child: const Text(
                    'EDITAR PERFIL',
                    style: TextStyle(
                      color: AppTheme.primaryBlue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
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