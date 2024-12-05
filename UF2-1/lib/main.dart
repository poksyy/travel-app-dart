import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MiPaginaPrincipal(),
    );
  }
}

class MiPaginaPrincipal extends StatefulWidget {
  const MiPaginaPrincipal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MiPaginaPrincipalState createState() => _MiPaginaPrincipalState();
}

class _MiPaginaPrincipalState extends State<MiPaginaPrincipal> {
  String titulo = "Mi primera aplicación";

  void _cambiarTitulo() {
    setState(() {
      titulo = "Título cambiado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("aplicacion_1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titulo,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/androidimage.png',
              height: 100,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cambiarTitulo,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3DDC84),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                ),
              ),
              child: const Text("Cambiar texto"),
            ),
          ],
        ),
      ),
    );
  }
}
