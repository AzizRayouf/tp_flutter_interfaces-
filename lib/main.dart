import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Interfaces',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAFAFA), // Couleur de fond très claire
      ),
      // CHANGE CETTE LIGNE POUR TESTER LES AUTRES ÉCRANS :
      // home: const SignUpScreen(),
      // home: const ProfileScreen(),
      home: const ProfileScreen(), 
    );
  }
}

// ==========================================
// 1. ÉCRAN SIGN IN (Connexion)
// ==========================================
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Permet de scroller si le clavier s'ouvre
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image du clapperboard (J'ai mis une icône géante pour que ça marche direct)
              const Center(
                child: Icon(Icons.movie_creation, size: 120, color: Colors.black87),
              ),
              const SizedBox(height: 40),
              
              // Titre
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Champs de texte
              const CustomTextField(hint: 'email'),
              const SizedBox(height: 15),
              const CustomTextField(hint: 'password', isPassword: true),
              const SizedBox(height: 25),

              // Boutons
              CustomButton(text: 'SIGN IN', color: const Color(0xFFFF7A45)),
              const SizedBox(height: 15),
              CustomButton(text: 'CREATE AN ACCOUNT', color: const Color(0xFFF44336)),
              const SizedBox(height: 20),

              // Mot de passe oublié
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('Forgot password? '),
                  Icon(Icons.arrow_forward, color: Color(0xFFFF7A45)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 2. ÉCRAN SIGN UP (Inscription)
// ==========================================
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(Icons.movie_creation, size: 120, color: Colors.black87),
              ),
              const SizedBox(height: 40),
              
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              const CustomTextField(hint: 'username'),
              const SizedBox(height: 15),
              const CustomTextField(hint: 'email'),
              const SizedBox(height: 15),
              const CustomTextField(hint: 'password', isPassword: true),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('Already have an account ? '),
                  Icon(Icons.arrow_forward, color: Color(0xFFFF7A45)),
                ],
              ),
              const SizedBox(height: 20),

              CustomButton(text: 'SIGN UP', color: const Color(0xFFFF7A45)),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 3. ÉCRAN PROFILE SETTINGS
// ==========================================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile settings', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Image de profil
            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(Icons.person, size: 80, color: Colors.white),
            ),
            const SizedBox(height: 40),

            const CustomTextField(hint: 'Current password', isPassword: true),
            const SizedBox(height: 15),
            const CustomTextField(hint: 'New password', isPassword: true),
            const SizedBox(height: 15),
            // Le champ adresse est plus grand (maxLines: 4)
            const CustomTextField(hint: 'Address', maxLines: 4), 
            const SizedBox(height: 30),

            CustomButton(text: 'SAVE', color: const Color(0xFFFF7A45)),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// WIDGETS PERSONNALISÉS (Pour éviter de répéter le code)
// ==========================================

// Un widget réutilisable pour les champs de texte
class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final int maxLines;

  const CustomTextField({
    super.key, 
    required this.hint, 
    this.isPassword = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword, // Cache le texte si c'est un mot de passe
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFFF7A45)),
        ),
      ),
    );
  }
}

// Un widget réutilisable pour les boutons
class CustomButton extends StatelessWidget {
  final String text;
  final Color color;

  const CustomButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Prend toute la largeur
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Bords très arrondis
          ),
          elevation: 2,
        ),
        onPressed: () {}, // Ne fait rien pour l'instant (juste l'interface)
        child: Text(
          text, 
          style: const TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}