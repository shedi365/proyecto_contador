import 'package:flutter/material.dart';
import 'package:proyecto_contador/screens/info_screen.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _contador = 0;

  
  void _incrementarContador() {
    setState(() { _contador = _contador + 1; });
  }

  void _decrementarContador() {
    setState(() { _contador--; });
  }

  void _reiniciarContador() {
    setState(() { _contador = 0; });
  }

  void _multiplicarContador() {
    setState(() { _contador = _contador * 2; });
  }

  void _dividirContador() {
    setState(() { _contador = _contador / 2; });
  }


  Widget _buildActionButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
    Color? backgroundColor,
    bool isMain = false, 
  }) {
    return FloatingActionButton(
      heroTag: tooltip,
      onPressed: onPressed,
      tooltip: tooltip,
      backgroundColor: backgroundColor ?? Colors.blueGrey, 
      mini: !isMain, 
      child: Icon(icon, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Aplicación de Contador'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InfoScreen()),
              );
            },
            child: const Text(
              'Perfil',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Valor Actual',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              _contador % 1 == 0
                  ? _contador.toInt().toString()
                  : _contador.toStringAsFixed(2),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Usa los botones de abajo para cambiar el contador.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             
              _buildActionButton(
                icon: Icons.refresh,
                tooltip: 'Reiniciar a Cero',
                onPressed: _reiniciarContador,
                backgroundColor: Colors.red, 
              ),
              const SizedBox(width: 20),
             
              _buildActionButton(
                icon: Icons.close,
                tooltip: 'Duplicar Valor',
                onPressed: _multiplicarContador,
                backgroundColor: Colors.purple,
              ),
              const SizedBox(width: 20),
              
              _buildActionButton(
                icon: Icons.percent,
                tooltip: 'Dividir a la mitad',
                onPressed: _dividirContador,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          
          const SizedBox(height: 15), 
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              _buildActionButton(
                icon: Icons.remove,
                tooltip: 'Restar 1',
                onPressed: _decrementarContador,
                isMain: true, 
                backgroundColor: Colors.orange,
              ),
              const SizedBox(width: 40),
             
              _buildActionButton(
                icon: Icons.add,
                tooltip: 'Sumar',
                onPressed: _incrementarContador,
                isMain: true, 
                backgroundColor: Colors.pink, 
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}