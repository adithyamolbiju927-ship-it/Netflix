import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netfix/controller/downloadprovider.dart';
import 'package:netfix/controller/provider.dart';
import 'package:netfix/widget/shimer.dart';

class AutoSlider extends ConsumerStatefulWidget {
  const AutoSlider({super.key});

  @override
  ConsumerState<AutoSlider> createState() => _AutoSliderState();
}

class _AutoSliderState extends ConsumerState<AutoSlider> {
  final PageController controller = PageController();
  int currentPage = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      currentPage++;

      controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(nowplayingpro);

    return movies.when(
      data: (data) {
        return SizedBox(
          height: 600,
          child: PageView.builder(
            controller: controller,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final movie = data[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 350,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              movie.image!.isNotEmpty
                                  ? "https://image.tmdb.org/t/p/w500${movie.image}"
                                  : "https://via.placeholder.com/500",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.play_arrow, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      "Play",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(downloadProvider.notifier)
                                      .addDownload(movie);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Added to Downloads"),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.download, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text(
                                      "Download",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
