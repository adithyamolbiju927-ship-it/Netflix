import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netfix/controller/downloadprovider.dart';

class DownloadPage extends ConsumerWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloads = ref.watch(downloadProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Image.asset("assets/pngnetflix.png", height: 40),
            const SizedBox(width: 10),
            const Text(
              "Downloads",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: downloads.isEmpty
          ? const Center(
              child: Text(
                "No Downloads Yet",
                style: TextStyle(color: Color.fromARGB(255, 19, 0, 0)),
              ),
            )
          : ListView.builder(
              itemCount: downloads.length,
              itemBuilder: (context, index) {
                final movie = downloads[index];

                return ListTile(
                  leading: Image.network(
                    "https://image.tmdb.org/t/p/w500${movie.image}",
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    movie.movename,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    movie.mocedate,
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
    );
  }
}
