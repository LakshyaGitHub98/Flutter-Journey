import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_provider.dart';
import '../helpers/profile_storage.dart';
import '../services/auth_services.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  String gender = "Male";
  final usernameController = TextEditingController();
  final passController= TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passController,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Age"),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: gender,
              items: ["Male", "Female", "Other"]
                  .map((g) => DropdownMenuItem(
                value: g,
                child: Text(g),
              ))
                  .toList(),
              onChanged: (val) => gender = val!,
              decoration: const InputDecoration(labelText: "Gender"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loading
                  ? null
                  : () async {
                setState(() => loading = true);

                final data = await AuthService.login(
                  username:usernameController.text.trim(),
                  password: passController.text.trim(),
                  name: nameController.text.trim(),
                  age:
                  int.tryParse(ageController.text.trim()) ?? 0,
                  gender: gender,

                );

                setState(() => loading = false);

                if (data == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Login failed")),
                  );
                  return;
                }

                Provider.of<ProfileProvider>(context,
                    listen: false)
                    .setProfileFromStorage(data);

                await ProfileStorage.saveProfile(
                  data["name"],
                  data["age"],
                  data["gender"],
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const HomeScreen()),
                );
              },
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}