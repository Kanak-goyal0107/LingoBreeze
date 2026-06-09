import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/word.dart';
import '../providers/vocabulary_provider.dart';

class AvailableWordsScreen extends StatefulWidget {
  const AvailableWordsScreen({super.key});

  @override
  State<AvailableWordsScreen> createState() =>
      _AvailableWordsScreenState();
}

class _AvailableWordsScreenState
    extends State<AvailableWordsScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<VocabularyProvider>()
          .getApiWords();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider =
    Provider.of<VocabularyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Available Words",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: provider.apiWords.length,
        itemBuilder: (context, index) {
          final Word word =
          provider.apiWords[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    word.word,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Meaning: ${word.meaning}",
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Translation: ${word.translation}",
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () async {
                      await provider
                          .saveApiWord(word);

                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${word.word} saved",
                            ),
                          ),
                        );
                      }
                    },
                    child:
                    const Text("Save"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}