import 'package:flutter/material.dart';

class MinionCard extends StatelessWidget {

  final String name;
  final String image;
  final String description;
  final VoidCallback onFavorite;

  const MinionCard({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(
        padding: const EdgeInsets.all(10),

        child: Column(
          children: [

            Expanded(

              child: ClipRRect(

                borderRadius:
                    BorderRadius.circular(15),

                child: Container(

                  color: Colors.grey.shade100,

                  child: Image.asset(
                    image,

                    fit: BoxFit.contain,

                    errorBuilder:
                        (context, error, stackTrace) {

                      return const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              name,

              maxLines: 1,

              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              description,

              maxLines: 2,
              overflow: TextOverflow.ellipsis,

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton.icon(

                onPressed: onFavorite,

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFFF9D923),

                  foregroundColor: Colors.black,
                ),

                icon: const Icon(
                  Icons.favorite,
                  size: 16,
                ),

                label: const Text(
                  'Favorito',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

