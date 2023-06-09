import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size mqSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: mqSize.height * 0.3,
              ),
              const Text(
                "Bienvenidos",
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: mqSize.height * 0.2,
              ),
              const Spacer(),
              Form(
                  child: Column(
                children: [
                  TextFormField(),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: mqSize.width,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed("product_list"),
                      child: const Text("Ingresar"),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
