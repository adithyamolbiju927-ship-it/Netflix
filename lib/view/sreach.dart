import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:netfix/controller/searchprovide.dart';

class Sreach extends ConsumerWidget {
  const Sreach({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieSearch = ref.watch(searchProvider);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Color.fromARGB(255, 65, 64, 64)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.black,
          title: Image.asset(
            "assets/netflixn.jpeg",
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                onChanged: (value) {
                  ref.read(searchMoveProvider.notifier).state = value;
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search Movies...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[900],
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),

            Expanded(
              child: movieSearch.when(
                data: (movies) {
                  if (movies.isEmpty) {
                    return const Center(
                      child: Text(
                        "No results found",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];

                      if (movie.movename.trim().isEmpty) {
                        return const SizedBox();
                      }
                      return ListTile(
                        leading: movie.image!.isNotEmpty
                            ? Image.network(
                                "https://image.tmdb.org/t/p/w200${movie.image}",
                                width: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                      Icons.broken_image,
                                      color: Colors.grey,
                                    ),
                              )
                            : const Icon(
                                Icons.image_not_supported,
                                color: Colors.grey,
                              ),

                        title: Text(
                          movie.movename,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          movie.mocedate.isNotEmpty
                              ? movie.mocedate
                              : "Unknown date",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),

                error: (error, stack) => Center(
                  child: Text(
                    "Error: ${error.toString()}",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
