import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quizzoxo/services/auth.dart';
import 'package:quizzoxo/services/models.dart';
import 'package:quizzoxo/widgets/loading.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(user.displayName ?? 'Guest'),
              const Spacer(flex: 2),
              Text(user.email ?? '', style: Theme.of(context).textTheme.titleMedium),
              Text('${report.total}', style: Theme.of(context).textTheme.titleLarge),
              Text('Quizzes Completed', style: Theme.of(context).textTheme.titleSmall),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: const Text('SignOut'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    } else {
      return const Loader();
    }
  }
}
