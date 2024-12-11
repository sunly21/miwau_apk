import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/veterinarias.dart';
import 'package:flutter_application_1/screens/producto_screen.dart'; // Importar la pantalla de producto

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: ListView(
        children: [
          ListTile(
            leading:
                Image.asset('assets/images/dogchow.png', width: 50, height: 50),
            title: const Text('Dog Chow'),
            subtitle: const Text('Precio: \$7,000'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Esta opción no está disponible.')),
              );
            },
          ),
          ListTile(
            leading:
                Image.asset('assets/images/whiskas.png', width: 50, height: 50),
            title: const Text('Whiskas'),
            subtitle: const Text('Precio: \$19,500 CLP'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductoScreen(
                    producto: 'Whiskas',
                    precio: '\$19,500 CLP',
                    descripcion:
                        'Nueva receta, cuidadosamente preparada para satisfacer las necesidades nutricionales de su gato. Alimento para gatos 100% completo y balanceadoFibras múltiples apoyan el funcionamiento gastrointestinal, contribuyendo a la formación de heces firmes y fáciles de limpiar.Recomendado por Waltham Petcare Science Institute - Una de las autoridades mundiales líderes en nutrición, cuidado y bienestar animal.',
                    cantidadDisponible: 58,
                    ingredientes:
                        'Maíz y/o trigo y/o arroz, harina de subproductos de pollo, gluten de maíz y/o harina de soja y/o salvado de maíz y/o salvado de trigo, grasa de pollo y/o sebo bovino, harina de carne y hueso bovino, hidrolizado de menudencias (pollo y/o cerdo y/o bovino), cloruro de sodio, harina de trigo.',
                    imagen: 'assets/images/whiskas.png',
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/championdog.png',
                width: 50, height: 50),
            title: const Text('Champion Dog'),
            subtitle: const Text('Precio: \$5,990 CLP'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Esta opción no está disponible.')),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16,
            left: 40,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VeterinariasScreen()),
                );
              },
              tooltip: 'Ir a Veterinarias',
              child: const Icon(Icons.location_city),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formulario');
              },
              tooltip: 'Ir al Formulario',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
