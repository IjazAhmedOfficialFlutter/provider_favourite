import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_favorite_page/provider/favorite_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final words = nouns.take(50).toList();
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.grey),
              child: ListTile(
                title: Text(word),
                trailing: IconButton(
                  onPressed: () {
                    provider.toggleFavorite(word);
                  },
                  icon: provider.isExist(word)
                      ? const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                        ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
