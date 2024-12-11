import 'package:flutter/material.dart';

class VeterinariasScreen extends StatelessWidget {
  const VeterinariasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final veterinarias = [
      {
        'nombre': 'NeuroCentro Veterinaria',
        'direccion': 'Av. Brasil 827',
        'imagen': 'assets/images/veterinaria1.jpg',
      },
      {
        'nombre': 'Centro Veterinario de Atención Primaria Viña del Mar',
        'direccion': 'El Tranque 1425',
        'imagen': 'assets/images/veterinaria2.jpg',
      },
      {
        'nombre': 'Posta Veterinaria',
        'direccion': 'Av. Eduardo Freire 3624',
        'imagen': 'assets/images/veterinaria3.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Veterinarias')),
      body: ListView.builder(
        itemCount: veterinarias.length,
        itemBuilder: (context, index) {
          final vet = veterinarias[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  vet['imagen']!,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  vet['nombre']!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  vet['direccion']!,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const Divider(thickness: 1, color: Colors.grey),
              ],
            ),
          );
        },
      ),
    );
  }
}
