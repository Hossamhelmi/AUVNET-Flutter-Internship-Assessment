import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/helper/shared_preference_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile', style: TextStyle(fontSize: 18),),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                SharedPreferencesHelper.remove( 'isLoggedIn');
                context.go('/login');
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
