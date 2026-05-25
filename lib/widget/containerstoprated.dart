import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netfix/widget/shimer.dart';
import 'package:netfix/controller/provider.dart';
import 'package:netfix/view/navigatepage.dart';

class Containerstoprated extends ConsumerWidget {
  const Containerstoprated({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final move = ref.watch(toprateProvider);

    return move.when(
      data: (data) {
        return SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final movies = data[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Navigatepage(movemodel: movies),
                    ),
                  );
                },
                child: Container(
                  height: 300,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        movies.image!.isNotEmpty
                            ? "https://image.tmdb.org/t/p/w500${movies.image}"
                            : "https://via.placeholder.com/500",
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 16, 15, 15),
                  ),
                  margin: const EdgeInsets.all(8),
                ),
              );
            },
          ),
        );
      },

      loading: () => const ListShimmer(),
      error: (error, stack) => Center(child: Text(error.toString())),
    );
  }
}
