import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {

  final String name;
  final String image;
  final String description;
  final String funFact;

  final String favoriteFood;
  final String favoriteSong;
  final String personality;
  final String color;

  final int powerLevel;

  final String weakness;
  final String weapon;
  final String hobby;

  final bool isEvil;

  final String famousQuote;

  const DetailsPage({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.funFact,

    required this.favoriteFood,
    required this.favoriteSong,
    required this.personality,
    required this.color,

    required this.powerLevel,

    required this.weakness,
    required this.weapon,
    required this.hobby,

    required this.isEvil,

    required this.famousQuote,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5F5F5),

      body: CustomScrollView(

        slivers: [

          SliverAppBar(

            expandedHeight: 350,

            pinned: true,

            backgroundColor:
                const Color(0xFFF9D923),

            foregroundColor: Colors.black,

            flexibleSpace: FlexibleSpaceBar(

              centerTitle: true,

              title: Text(
                name,

                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              background: Container(

                color: Colors.white,

                child: Padding(

                  padding:
                      const EdgeInsets.all(30),

                  child: Hero(

                    tag: name,

                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(

            child: Padding(

              padding:
                  const EdgeInsets.all(20),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Container(

                    padding:
                        const EdgeInsets.all(20),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(25),

                      boxShadow: [

                        BoxShadow(
                          color:
                              Colors.black12,

                          blurRadius: 10,

                          offset:
                              const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const Text(
                          'Descripción',

                          style: TextStyle(
                            fontSize: 24,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          description,

                          style: TextStyle(
                            fontSize: 17,
                            color:
                                Colors.grey.shade700,

                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  Container(

                    width: double.infinity,

                    padding:
                        const EdgeInsets.all(20),

                    decoration: BoxDecoration(

                      color:
                          const Color(0xFFF9D923),

                      borderRadius:
                          BorderRadius.circular(25),

                      boxShadow: [

                        BoxShadow(
                          color:
                              Colors.black12,

                          blurRadius: 10,

                          offset:
                              const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Column(

                      children: [

                        const Icon(
                          Icons.lightbulb,
                          size: 50,
                          color: Colors.black,
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          'Dato Curioso',

                          style: TextStyle(
                            fontSize: 24,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          funFact,

                          textAlign:
                              TextAlign.center,

                          style: const TextStyle(
                            fontSize: 18,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  Container(

                    width: double.infinity,

                    padding:
                        const EdgeInsets.all(20),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(25),

                      boxShadow: [

                        BoxShadow(
                          color:
                              Colors.black12,

                          blurRadius: 10,

                          offset:
                              const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'Comida favorita: $favoriteFood',
                          style: const TextStyle(fontSize: 17),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Canción favorita: $favoriteSong',
                          style: const TextStyle(fontSize: 17),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Personalidad: $personality',
                          style: const TextStyle(fontSize: 17),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Color: $color',
                          style: const TextStyle(fontSize: 17),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Nivel de poder: $powerLevel',
                          style: const TextStyle(fontSize: 17),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Debilidad: $weakness',
                          style: const TextStyle(fontSize: 17),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Arma: $weapon',
                          style: const TextStyle(fontSize: 17),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Hobby: $hobby',
                          style: const TextStyle(fontSize: 17),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          '¿Es malvado?: ${isEvil ? "Sí" : "No"}',
                          style: const TextStyle(fontSize: 17),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Frase famosa: "$famousQuote"',
                          style: const TextStyle(
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}