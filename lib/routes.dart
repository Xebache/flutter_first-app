import 'package:test/about/about.dart';
import 'package:test/home/home.dart';
import 'package:test/login/login.dart';
import 'package:test/profile/profile.dart';
import 'package:test/quiz/quiz.dart';
import 'package:test/topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  'login': (context) => const LoginScreen(),
  'about': (context) => const AboutScreen(),
  'profile': (context) => const ProfileScreen(),
  'quiz': (context) => const QuizScreen(),
  'topics': (context) => const TopicsScreen(),
};
