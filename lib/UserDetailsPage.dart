// UserDetailsPage.dart

import 'package:flutter/material.dart';
import 'models/user.dart'; // Import your User model

class UserDetailsPage extends StatelessWidget {
  final Data user; // Assuming Data is your User model
  UserDetailsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('${user.avatar!}'),
            ),
            Text('User ID: ${user.id!}'),
            Text('Name: ${user.firstName!} ${user.lastName!}'),
            Text('Email: ${user.email!}'),
            // Add more user details if needed
          ],
        ),
      ),
    );
  }
}
