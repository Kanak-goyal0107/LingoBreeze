import 'package:flutter/material.dart';

import '../../domain/entities/word.dart';

class WordCard extends StatelessWidget {
  final Word word;

  const WordCard({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              word.word,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style,
                children: [
                  const TextSpan(
                    text: 'Meaning: ',
                    style: TextStyle(
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: word.meaning,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style,
                children: [
                  const TextSpan(
                    text: 'Translation: ',
                    style: TextStyle(
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: word.translation,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}