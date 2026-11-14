import 'package:flutter/cupertino.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/productos_screen.dart';
import 'screens/registrar_producto_screen.dart';
import 'screens/perfil_screen.dart';

void main() {
  runApp(const LabCupertinoApp());
}

class LabCupertinoApp extends StatelessWidget {
  const LabCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'LabXY - Sección B Cupertino',
      theme: AppTheme.cupertinoTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/login': (context) => const LoginScreen(),
        '/menu': (context) => const MenuScreen(),
        '/productos': (context) => const ProductosScreen(),
        '/registrar': (context) => const RegistrarProductoScreen(),
        '/perfil': (context) => const PerfilScreen(),
      },
    );
  }
}