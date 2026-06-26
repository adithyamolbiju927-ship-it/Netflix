import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netfix/controller/searchprovide.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchMoveProvider);
    final searchResult = ref.watch(searchProvider);

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(228, 0, 0, 0),
        toolbarHeight: 60,
        title: Image.asset("assets/netflixn.jpeg", height: 50),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 7, 0, 0),
              Color.fromARGB(255, 56, 18, 18),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  ref.read(searchMoveProvider.notifier).state = value;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: "Search movies...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Expanded(
                child: searchResult.when(
                  data: (movies) {
                    if (movies.isEmpty) {
                      return Center(
                        child: Icon(Icons.search, color: Colors.white),
                      );
                    }

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${movie.image}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  },

                  loading: () => Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  ),

                  error: (e, s) => Center(
                    child: Text("Error", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
