import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final authService = AuthService();

  bool isLoading = false;

  Future<void> register() async {

    if (passwordController.text != confirmController.text) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Las contraseñas no coinciden'),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    final error = await authService.registerUser(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() {
      isLoading = false;
    });

    if (error == null) {

      Navigator.pushReplacementNamed(context, '/home');

    } else {

      String mensaje = 'Ocurrió un error';

      if (error.contains('email-already-in-use')) {

        mensaje = 'Este correo ya está registrado';

      } else if (error.contains('invalid-email')) {

        mensaje = 'El correo no es válido';

      } else if (error.contains('weak-password')) {

        mensaje = 'La contraseña es muy débil';

      } else if (error.contains('network-request-failed')) {

        mensaje = 'Sin conexión a internet';

      } else if (error.contains('too-many-requests')) {

        mensaje = 'Demasiados intentos. Intenta más tarde';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(mensaje),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Registro'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: emailController,

              decoration: InputDecoration(
                hintText: 'Correo electrónico',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,

              decoration: InputDecoration(
                hintText: 'Contraseña',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: confirmController,
              obscureText: true,

              decoration: InputDecoration(
                hintText: 'Confirmar contraseña',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: isLoading ? null : register,

                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Registrarse',
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}