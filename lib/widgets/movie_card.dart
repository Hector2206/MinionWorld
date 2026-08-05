import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {

  final String title;
  final String image;
  final double vote;

  const MovieCard({
    super.key,
    required this.title,
    required this.image,
    required this.vote,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 5,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(

        padding: const EdgeInsets.all(10),

        child: Column(

          children: [

            Expanded(

              child: ClipRRect(

                borderRadius: BorderRadius.circular(15),

                child: Image.network(
                  image,

                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stackTrace) {

                    return const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              title,

              maxLines: 1,

              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

          ],
        ),
      ),
    );
  }
}