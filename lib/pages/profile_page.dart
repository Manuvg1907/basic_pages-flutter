import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Receiving multiple arguments from Navigator
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String username = args?['username'] ?? 'User';
    final String email = args?['email'] ?? 'Not provided';
    final String phone = args?['phone'] ?? 'Not provided';

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      username.isNotEmpty ? username[0].toUpperCase() : "U",
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Name
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 8),

                  Text(
                    "Welcome to your profile",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),

                  // Info List
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.deepPurple),
                    title: Text("Email"),
                    subtitle: Text(email),
                  ),
                  Divider(),

                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.deepPurple),
                    title: Text("Phone"),
                    subtitle: Text(phone),
                  ),
                  Divider(),

                  // Logout Button
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
