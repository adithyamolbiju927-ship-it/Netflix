import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netfix/widget/shimer.dart';
import 'package:netfix/controller/provider.dart';
import 'package:netfix/view/navigatorpage3.dart';

class Tvshowcontainer extends ConsumerWidget {
  const Tvshowcontainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final move = ref.watch(tvshowprovider);

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
                      builder: (context) => Navigatepage3(movemodel: movies),
                    ),
                  );
                },
                child: Container(
                  height: 300,
                  width: 160,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 16, 15, 15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        movies.image!.isNotEmpty
                            ? "https://image.tmdb.org/t/p/w500${movies.image}"
                            : "https://via.placeholder.com/500",
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      // loading: () => const Center(child: CircularProgressIndicator()),
      loading: () => const ListShimmer(),
      error: (error, stack) => Center(child: Text(error.toString())),
    );
  }
}
