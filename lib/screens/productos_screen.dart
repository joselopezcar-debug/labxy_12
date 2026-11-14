import 'package:flutter/cupertino.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';
import '../widgets/cupertino_card.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  String _filtro = '';

  List<ItemData> get _productosFiltrados {
    if (_filtro.isEmpty) return AppData.productos;
    return AppData.productos
        .where((p) =>
            (p['nombre'] as String)
                .toLowerCase()
                .contains(_filtro.toLowerCase()))
        .toList();
  }

  Future<void> _irARegistrar() async {
    await Navigator.pushNamed(context, '/registrar');
    setState(() {}); // Refresca la lista al volver
  }

  void _mostrarOpcionesProducto(ItemData producto) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: Text(producto['nombre'] as String),
        message: Text(
          'Precio: S/ ${(producto['precio'] as double).toStringAsFixed(2)} | Stock: ${producto['stock']}',
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                producto['stock'] = (producto['stock'] as int) + 1;
              });
            },
            child: const Text('Aumentar Stock (+1)'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                AppData.productos.remove(producto);
              });
            },
            child: const Text('Eliminar Producto'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
      ),
    );
  }

  String _formatearPrecio(double precio) {
    final partes = precio.toStringAsFixed(2).split('.');
    final entero = partes[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return 'S/ $entero.${partes[1]}';
  }

  @override
  Widget build(BuildContext context) {
    final lista = _productosFiltrados;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppTheme.primaryBlue,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(
            CupertinoIcons.bars,
            color: CupertinoColors.white,
          ),
        ),
        middle: const Text(
          'Productos',
          style: TextStyle(color: CupertinoColors.white),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _irARegistrar,
          child: const Icon(
            CupertinoIcons.add,
            color: CupertinoColors.white,
            size: 26,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Barra de búsqueda Cupertino
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: CupertinoSearchTextField(
                placeholder: 'Buscar producto...',
                onChanged: (valor) {
                  setState(() {
                    _filtro = valor;
                  });
                },
              ),
            ),

            // ListView de Cards con CupertinoListTile
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  final producto = lista[index];
                  return CupertinoCard(
                    child: CupertinoListTile(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      leadingSize: 48,
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey6,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          producto['icono'] as IconData,
                          color: AppTheme.primaryBlue,
                          size: 26,
                        ),
                      ),
                      title: Text(
                        producto['nombre'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Precio: ${_formatearPrecio(producto['precio'] as double)}\nStock: ${producto['stock']}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: CupertinoColors.secondaryLabel,
                            height: 1.35,
                          ),
                        ),
                      ),
                      trailing: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => _mostrarOpcionesProducto(producto),
                        child: const Icon(
                          CupertinoIcons.ellipsis_vertical,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}