import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Perfil Personal'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Acerca del mi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),

              _buildInfoRow(
                icon: Icons.person,
                label: 'Nombre:',
                value: 'Shedi Andres Nasrallah Amer',
              ),
              
              
              _buildInfoRow(
                icon: Icons.cake, 
                label: 'Edad:',
                value: '19 años', 
              ),

            
              
              _buildInfoRow(
                icon: Icons.email,
                label: 'Correo institucional:',
                value: 'snassrallah.8067@unimar.edu.ve',
              ),
              
              
              _buildInfoRow(
                icon: Icons.phone, 
                label: 'Teléfono:',
                value: '+58 412 1806320', 
              ),

              const SizedBox(height: 50),
              
              
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Volver',
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.blue, size: 30),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}