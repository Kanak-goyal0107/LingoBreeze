import 'package:flutter/material.dart';

import 'available_words_screen.dart';
import 'vocabulary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  int currentIndex = 0;

  final screens = const [
    AvailableWordsScreen(),
    VocabularyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: "Words",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "My Vocabulary",
          ),
        ],
      ),
    );
  }
}