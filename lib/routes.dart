import 'package:quizzoxo/screens/about.dart';
import 'package:quizzoxo/screens/profile.dart';
import 'package:quizzoxo/screens/login.dart';
import 'package:quizzoxo/screens/topics.dart';
import 'package:quizzoxo/screens/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
