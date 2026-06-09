import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'presentation/screens/home_screen.dart';
import 'data/datasources/firebase_datasource.dart';
import 'data/datasources/remote_datasource.dart';
import 'data/repositories/vocabulary_repository_impl.dart';
import 'presentation/providers/vocabulary_provider.dart';
import 'presentation/screens/vocabulary_screen.dart';
import 'presentation/screens/available_words_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final repository =
  VocabularyRepositoryImpl(
    firebaseDatasource:
    FirebaseDatasource(),
    remoteDatasource:
    RemoteDatasource(),
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => VocabularyProvider(
        repository: repository,
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}