import 'package:flutter/cupertino.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';
import '../widgets/cupertino_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void _navegarOpcion(BuildContext context, String ruta) {
    if (ruta == '/login') {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      Navigator.pushNamed(context, ruta);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: AppTheme.primaryBlue,
        leading: Icon(
          CupertinoIcons.bars,
          color: CupertinoColors.white,
        ),
        middle: Text(
          'Menú',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: AppData.menuOpciones.length,
          itemBuilder: (context, index) {
            final opcion = AppData.menuOpciones[index];
            return CupertinoCard(
              child: CupertinoListTile(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                leading: Icon(
                  opcion['icono'] as IconData,
                  color: opcion['color'] as Color,
                  size: 24,
                ),
                title: Text(
                  opcion['titulo'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: () => _navegarOpcion(context, opcion['ruta'] as String),
              ),
            );
          },
        ),
      ),
    );
  }
}