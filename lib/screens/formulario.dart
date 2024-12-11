import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({super.key});

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final TextEditingController veterinariaController = TextEditingController();
  final TextEditingController tipoMascotaController = TextEditingController();
  final TextEditingController nombreMascotaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: veterinariaController,
              decoration: const InputDecoration(
                labelText: 'Nombre de la veterinaria',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: tipoMascotaController,
              decoration: const InputDecoration(
                labelText: 'Tipo de mascota',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nombreMascotaController,
              decoration: const InputDecoration(
                labelText: 'Nombre de la mascota',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final nombreVet = veterinariaController.text.trim();
                final tipoMasc = tipoMascotaController.text.trim();
                final nombreMasc = nombreMascotaController.text.trim();

                if (nombreVet.isEmpty ||
                    tipoMasc.isEmpty ||
                    nombreMasc.isEmpty) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, completa todos los campos.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                try {
                  final CollectionReference mascotas =
                      FirebaseFirestore.instance.collection('mascotas');

                  await mascotas.add({
                    'nombreVet': nombreVet,
                    'tipoMasc': tipoMasc,
                    'nombreMasc': nombreMasc,
                  });

                  if (!mounted) return;

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Información Guardada'),
                      content: Text(
                        'Veterinaria: $nombreVet\n'
                        'Tipo de Mascota: $tipoMasc\n'
                        'Nombre de la Mascota: $nombreMasc\n¡Pronto se contactarán con usted!',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cerrar'),
                        ),
                      ],
                    ),
                  );
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ocurrió un error al guardar los datos.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    veterinariaController.dispose();
    tipoMascotaController.dispose();
    nombreMascotaController.dispose();
    super.dispose();
  }
}
