import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netfix/widget/automove.dart';
import 'package:netfix/widget/upcomingcontainer.dart';
import 'package:netfix/widget/containerstoprated.dart';
import 'package:netfix/widget/tvshowcontainer.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 10, 0, 0),
        title: Image.asset(
          "assets/pngnetflix.png",
          height: 130,
          fit: BoxFit.contain,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 57, 2, 2),
              Color.fromARGB(255, 8, 0, 0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AutoSlider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Popular on Netflix',
                    style: TextStyle(
                      color: Color.fromARGB(255, 246, 245, 245),
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              Containerstoprated(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Trending Now',
                    style: TextStyle(color: Colors.white, fontSize: 21),
                  ),
                ),
              ),
              Upcomingcontainer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Watch it Again',
                    style: TextStyle(color: Colors.white, fontSize: 21),
                  ),
                ),
              ),
              Tvshowcontainer(),
            ],
          ),
        ),
      ),
    );
  }
}
