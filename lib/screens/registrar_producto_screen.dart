import 'package:flutter/cupertino.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';

class RegistrarProductoScreen extends StatefulWidget {
  const RegistrarProductoScreen({super.key});

  @override
  State<RegistrarProductoScreen> createState() =>
      _RegistrarProductoScreenState();
}

class _RegistrarProductoScreenState extends State<RegistrarProductoScreen> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  IconData _iconoSeleccionado = CupertinoIcons.cube_box_fill;
  String _etiquetaImagen = 'Seleccionar imagen';

  void _seleccionarImagenDemo() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: const Text('Seleccionar ícono / imagen del producto'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              setState(() {
                _iconoSeleccionado = CupertinoIcons.device_laptop;
                _etiquetaImagen = 'Imagen: Laptop seleccionada';
              });
              Navigator.pop(context);
            },
            child: const Text('Laptop / Computadora'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              setState(() {
                _iconoSeleccionado = CupertinoIcons.headphones;
                _etiquetaImagen = 'Imagen: Accesorio seleccionado';
              });
              Navigator.pop(context);
            },
            child: const Text('Audífonos / Accesorio'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              setState(() {
                _iconoSeleccionado = CupertinoIcons.device_phone_portrait;
                _etiquetaImagen = 'Imagen: Dispositivo seleccionado';
              });
              Navigator.pop(context);
            },
            child: const Text('Smartphone / Tablet'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
      ),
    );
  }

  void _guardarProducto() {
    final nombre = _nombreController.text.trim();
    final descripcion = _descripcionController.text.trim();
    final precio = double.tryParse(_precioController.text.trim());
    final stock = int.tryParse(_stockController.text.trim());

    if (nombre.isEmpty || precio == null || stock == null) {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text('Datos incompletos'),
          content: const Text(
            'Completa correctamente el nombre, precio y stock del producto.',
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    AppData.productos.add({
      'nombre': nombre,
      'descripcion': descripcion.isEmpty ? 'Sin descripción' : descripcion,
      'precio': precio,
      'stock': stock,
      'icono': _iconoSeleccionado,
    });

    Navigator.pop(context);
  }

  BoxDecoration _inputDecoration() {
    return BoxDecoration(
      color: CupertinoColors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: CupertinoColors.systemGrey4),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          'Registrar Producto',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Selector de imagen
              GestureDetector(
                onTap: _seleccionarImagenDemo,
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: CupertinoColors.systemGrey4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _iconoSeleccionado == CupertinoIcons.cube_box_fill
                            ? CupertinoIcons.camera_fill
                            : _iconoSeleccionado,
                        size: 36,
                        color: CupertinoColors.systemGrey,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _etiquetaImagen,
                        style: const TextStyle(
                          fontSize: 13,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Nombre del producto
              CupertinoTextField(
                controller: _nombreController,
                placeholder: 'Nombre del producto',
                padding: const EdgeInsets.all(14),
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 14),

              // Descripción
              CupertinoTextField(
                controller: _descripcionController,
                placeholder: 'Descripción',
                maxLines: 3,
                padding: const EdgeInsets.all(14),
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 14),

              // Precio con sufijo S/
              CupertinoTextField(
                controller: _precioController,
                placeholder: 'Precio',
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                padding: const EdgeInsets.all(14),
                suffix: const Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: Text(
                    'S/',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 14),

              // Stock
              CupertinoTextField(
                controller: _stockController,
                placeholder: 'Stock',
                keyboardType: TextInputType.number,
                padding: const EdgeInsets.all(14),
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 26),

              // Botón GUARDAR
              CupertinoButton.filled(
                borderRadius: BorderRadius.circular(10),
                onPressed: _guardarProducto,
                child: const Text(
                  'GUARDAR',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
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