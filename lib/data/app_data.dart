import 'package:flutter/cupertino.dart';

typedef ItemData = Map<String, dynamic>;

class AppData {
  // Mapa de datos del perfil (Pantalla 5)
  static ItemData perfilUsuario = {
    'nombre': 'José Alonso',
    'email': 'jose.lopez.car@tecsup.edu.pe',
    'telefono': '976149945',
    'rol': 'Administrador',
  };

  // Lista de Mapas para las opciones del menú (Pantalla 2)
  static final List<ItemData> menuOpciones = [
    {
      'titulo': 'Registrar Productos',
      'icono': CupertinoIcons.cart_fill,
      'color': const Color(0xFF1976D2),
      'ruta': '/registrar',
    },
    {
      'titulo': 'Listar Productos',
      'icono': CupertinoIcons.list_bullet,
      'color': const Color(0xFF1976D2),
      'ruta': '/productos',
    },
    {
      'titulo': 'Perfil',
      'icono': CupertinoIcons.person_fill,
      'color': CupertinoColors.systemGrey,
      'ruta': '/perfil',
    },
    {
      'titulo': 'Logout',
      'icono': CupertinoIcons.square_arrow_right,
      'color': CupertinoColors.systemRed,
      'ruta': '/login',
    },
  ];

  // Lista de Mapas de productos iniciales (Pantalla 3)
  static List<ItemData> productos = [
    {
      'nombre': 'Laptop',
      'descripcion': 'Laptop profesional de alto rendimiento',
      'precio': 3500.00,
      'stock': 10,
      'icono': CupertinoIcons.device_laptop,
    },
    {
      'nombre': 'Mouse',
      'descripcion': 'Mouse inalámbrico ergonómico',
      'precio': 50.00,
      'stock': 25,
      'icono': CupertinoIcons.cursor_rays,
    },
    {
      'nombre': 'Teclado',
      'descripcion': 'Teclado mecánico retroiluminado',
      'precio': 120.00,
      'stock': 15,
      'icono': CupertinoIcons.keyboard,
    },
    {
      'nombre': 'Monitor',
      'descripcion': 'Monitor LED Full HD 24 pulgadas',
      'precio': 800.00,
      'stock': 8,
      'icono': CupertinoIcons.tv,
    },
  ];
}