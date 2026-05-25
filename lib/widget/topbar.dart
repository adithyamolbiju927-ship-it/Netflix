import 'package:flutter/material.dart';

class TopBars extends StatelessWidget {
  const TopBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "NETFIX",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 15),
                  Icon(Icons.download, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.black,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("TV Shows", style: TextStyle(color: Colors.white)),
              Text("Movies", style: TextStyle(color: Colors.white)),
              Text("Categories", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        
      ],
    );
  }
}
