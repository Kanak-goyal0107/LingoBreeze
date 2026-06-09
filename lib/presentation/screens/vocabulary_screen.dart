import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/vocabulary_provider.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/word_card.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() =>
      _VocabularyScreenState();
}

class _VocabularyScreenState
    extends State<VocabularyScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<VocabularyProvider>()
          .getSavedWords();
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
          'My Vocabulary',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Builder(
        builder: (_) {

          if (provider.isLoading) {
            return const LoadingWidget();
          }

          if (provider.error != null) {
            return CustomErrorWidget(
              message: provider.error!,
            );
          }

          if (provider.savedWords.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book,
                    size: 80,
                  ),

                  SizedBox(height: 20),

                  Text(
                    "You haven't saved any words yet.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await provider.getSavedWords();
            },
            child: ListView.builder(
              itemCount:
              provider.savedWords.length,
              itemBuilder:
                  (context, index) {
                return WordCard(
                  word:
                  provider.savedWords[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}