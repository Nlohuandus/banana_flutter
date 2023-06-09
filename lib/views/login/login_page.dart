import 'package:banana_flutter/data/provider/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late SessionProvider sessionprovider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sessionprovider = Provider.of<SessionProvider>(context, listen: false);
    });
  }

  @override
  dispose() {
    sessionprovider.dispose();
    super.dispose();
  }

  doLogin() async {
    try {
      if (!formKey.currentState!.validate()) return;
      context.loaderOverlay.show();
      await sessionprovider.auth(
        user: userController.text,
        password: passwordController.text,
      );
      if (!mounted) return;
      context.loaderOverlay.hide();
      Navigator.of(context).pushReplacementNamed("product_list");
    } catch (e) {
      showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.width * 0.3,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(e.toString()),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: Navigator.of(context).pop,
                child: const Text("Aceptar"),
              )
            ],
          ),
        ),
      );
    } finally {
      context.loaderOverlay.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mqSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed("product_list"),
                child: const Text("data"),
              ),
              const Text(
                "Bienvenidos",
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                height: mqSize.height * 0.4,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: userController,
                      decoration: const InputDecoration(hintText: "Usuario"),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp("[0-9a-zA-Z]"),
                        ),
                      ],
                      validator: validator,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(hintText: "Contraseña"),
                      obscureText: true,
                      validator: validator,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: mqSize.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: doLogin,
                        child: const Text("Ingresar"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? validator(value) {
    if (value == null || value.isEmpty) {
      return "No puede estar vacio";
    } else if (value.length < 4) {
      return "Longitud minima 3 caracteres";
    } else {
      return null;
    }
  }
}
