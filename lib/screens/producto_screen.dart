import 'package:flutter/material.dart';

class ProductoScreen extends StatelessWidget {
  final String producto;
  final String precio;
  final String descripcion;
  final int cantidadDisponible;
  final String ingredientes;
  final String imagen;

  const ProductoScreen({
    super.key,
    required this.producto,
    required this.precio,
    required this.descripcion,
    required this.cantidadDisponible,
    required this.ingredientes,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(producto)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagen, height: 200, fit: BoxFit.contain),
            const SizedBox(height: 20),
            Text(
              producto,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Precio: $precio',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Descripción:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(descripcion),
            const SizedBox(height: 20),
            const Text(
              'Cantidad Disponible:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('$cantidadDisponible unidades'),
            const SizedBox(height: 20),
            const Text(
              'Ingredientes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(ingredientes),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Cesta'),
                      content: const Text('Producto añadido a la cesta.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
