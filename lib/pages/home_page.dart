import 'package:flutter/material.dart';

import '../models/minion_model.dart';
import '../services/firestore_service.dart';

import '../widgets/minion_card.dart';

import '../models/movie_model.dart';
import '../services/tmdb_service.dart';
import '../widgets/movie_card.dart';

import 'details_page.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final firestoreService = FirestoreService();
    final tmdbService = TmdbService();

    final List<MinionModel> minions = [

      MinionModel(
        name: 'Kevin',
        image: 'assets/images/minions/Kevin.png',
        description: 'Líder aventurero, alto y valiente del trío principal.',
        funFact: 'Ama el golf y proteger a sus hermanos pequeños.',
        favoriteFood: 'Bananas clásicas',
        favoriteSong: 'Banana Song',
        personality: 'Valiente y responsable',
        color: 'Amarillo',
        powerLevel: 95,
        weakness: 'Los gatos y la impaciencia',
        weapon: 'Mega bazuca',
        hobby: 'Jugar golf',
        isEvil: false,
        famousQuote: 'Bananaaaa! ¡Kanpai!',
      ),

      MinionModel(
        name: 'Bob',
        image: 'assets/images/minions/Bob.png',
        description: 'El más pequeño, tierno y consentido de todos.',
        funFact: 'Tiene heterocromía (un ojo verde y uno marrón) y fue coronado Rey de Inglaterra.',
        favoriteFood: 'Plátanos machacados',
        favoriteSong: 'Make \'Em Laugh',
        personality: 'Inocente y cariñoso',
        color: 'Amarillo',
        powerLevel: 85,
        weakness: 'La oscuridad',
        weapon: 'Su osito Tim',
        hobby: 'Abrazar animales',
        isEvil: false,
        famousQuote: '¡King Bob! ¡Kumbala!',
      ),

      MinionModel(
        name: 'Stuart',
        image: 'assets/images/minions/Stuart.png',
        description: 'El Minion rebelde, juguetón y melómano.',
        funFact: 'Sabe tocar la guitarra eléctrica a la perfección.',
        favoriteFood: 'Bananas y helado',
        favoriteSong: 'Hair (de The Cowsills)',
        personality: 'Relajado y rebelde',
        color: 'Amarillo',
        powerLevel: 90,
        weakness: 'El hambre extrema',
        weapon: 'Guitarra sónica',
        hobby: 'Tocar la guitarra',
        isEvil: false,
        famousQuote: '¡Poeka! ¿Para tú?',
      ),

      MinionModel(
        name: 'Otto',
        image: 'assets/images/minions/Otto.png',
        description: 'Hablador, un poco torpe y de gran corazón.',
        funFact: 'Lleva aparatos ortopédicos y le encantan las piedras como mascotas.',
        favoriteFood: 'Bananas con chocolate',
        favoriteSong: 'Chandelier (versión Minion)',
        personality: 'Entusiasta y despistado',
        color: 'Amarillo',
        powerLevel: 75,
        weakness: 'Perder su piedra mascota',
        weapon: 'Piedra sagrada',
        hobby: 'Platicar sin parar',
        isEvil: false,
        famousQuote: 'Bello! Petra!',
      ),

      MinionModel(
        name: 'Mel',
        image: 'assets/images/minions/Mel.png',
        description: 'Líder indiscutible de la rebelión de los Minions en prisión.',
        funFact: 'Tiene un peinado completamente plano y es súper firme con sus decisiones.',
        favoriteFood: 'Sopa de banana de la cárcel',
        favoriteSong: 'I Fought the Law',
        personality: 'Rebelde y líder',
        color: 'Amarillo',
        powerLevel: 88,
        weakness: 'Extrañar a Gru',
        weapon: 'Letrero de protesta',
        hobby: 'Organizar huelgas',
        isEvil: false,
        famousQuote: '¡Tank yu! ¡Revolución!',
      ),

      MinionModel(
        name: 'Phil',
        image: 'assets/images/minions/Phil.png',
        description: 'Un Minion muy tierno, alegre y obediente.',
        funFact: 'Es famoso por disfrazarse de bebé con un gorrito rosa y un biberón.',
        favoriteFood: 'Papilla de banana',
        favoriteSong: 'Copacabana',
        personality: 'Tierno y dócil',
        color: 'Amarillo',
        powerLevel: 60,
        weakness: 'Es muy asustadizo',
        weapon: 'Biberón de juguete',
        hobby: 'Disfrazarse de bebé',
        isEvil: false,
        famousQuote: 'Poopaye!',
      ),

      MinionModel(
        name: 'Carl',
        image: 'assets/images/minions/Phil.png',
        description: 'El encargado oficial de las alertas de emergencia.',
        funFact: 'Lleva luces de bombero en la cabeza y grita con un megáfono.',
        favoriteFood: 'Helado de banana',
        favoriteSong: 'Sound of the Police',
        personality: 'Ansioso y ruidoso',
        color: 'Amarillo',
        powerLevel: 80,
        weakness: 'El fuego real',
        weapon: 'Megáfono de bombero',
        hobby: 'Hacer sonidos de sirena',
        isEvil: false,
        famousQuote: 'Bee-do! Bee-do! Bee-do!',
      ),

      MinionModel(
        name: 'Dave',
        image: 'assets/images/minions/Dave.png',
        description: 'Inteligente, amable y muy hábil con las armas de Gru.',
        funFact: 'Le fascina hacer pastelitos y jugar a los videojuegos.',
        favoriteFood: 'Cupcakes de banana',
        favoriteSong: ' YMCA',
        personality: 'Cariñoso e inteligente',
        color: 'Amarillo',
        powerLevel: 85,
        weakness: 'Es demasiado distraído',
        weapon: 'Lanzacohetes de pastelitos',
        hobby: 'Jugar videojuegos',
        isEvil: false,
        famousQuote: '¡Tulaliloo ti amo!',
      ),

      MinionModel(
        name: 'Evil Kevin',
        image: 'assets/images/minions/Evil_kevin.png',
        description: 'La versión mutada, salvaje e indestructible de Kevin.',
        funFact: 'Fue transformado por el suero PX-41 y devora todo lo que encuentra.',
        favoriteFood: '¡Cualquier cosa que se mueva!',
        favoriteSong: 'Heavy Metal Banana',
        personality: 'Agresivo y caótico',
        color: 'Morado',
        powerLevel: 98,
        weakness: 'El antídoto de gelatina',
        weapon: 'Dientes indestructibles',
        hobby: 'Destruir laboratorios',
        isEvil: true,
        famousQuote: '¡Blah! ¡Raaaaaawr!',
      ),

      MinionModel(
        name: 'Evil Stuart',
        image: 'assets/images/minions/Evil_Stuart.png',
        description: 'La versión morada y caótica de Stuart.',
        funFact: 'Aunque es un monstruo sin control total, intenta hacer ruidos graciosos.',
        favoriteFood: 'Bananas moradas',
        favoriteSong: 'Smells Like Teen Spirit',
        personality: 'Gruñón y salvaje',
        color: 'Morado',
        powerLevel: 96,
        weakness: 'La gelatina de mutación',
        weapon: 'Garras y mordiscos',
        hobby: 'Morder las guitarras',
        isEvil: true,
        famousQuote: '¡Grrr! ¡Ba-na-naaaa!',
      ),
    ];

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF4D96FF),
        foregroundColor: Colors.white,
        titleSpacing: 0,

        title: Row(
          children: [

            const SizedBox(width: 10),

            Image.asset(
              'assets/images/LogoSinFondo.png',
              width: 45,
              height: 45,
            ),

            const SizedBox(width: 10),

            const Text(
              'MinionWorld',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),

      body: FutureBuilder<List<MovieModel>>(
        future: tmdbService.fetchMovies(),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          final movies = snapshot.data ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(15),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const Text(
                  'Minions Destacados ',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: minions.length,

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.72,
                  ),

                  itemBuilder: (context, index) {

                    final minion = minions[index];

                    return GestureDetector(
                      onTap: () {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => DetailsPage(
                              name: minion.name,
                              image: minion.image,
                              description: minion.description,
                              funFact: minion.funFact,

                              favoriteFood: minion.favoriteFood,
                              favoriteSong: minion.favoriteSong,
                              personality: minion.personality,
                              color: minion.color,

                              powerLevel: minion.powerLevel,

                              weakness: minion.weakness,
                              weapon: minion.weapon,
                              hobby: minion.hobby,

                              isEvil: minion.isEvil,

                              famousQuote: minion.famousQuote,
                            ),
                          ),
                        );
                      },

                      child: MinionCard(
                        name: minion.name,
                        image: minion.image,
                        description: minion.description,

                        onFavorite: () async {

                          await firestoreService.addFavorite(
                            name: minion.name,
                            image: minion.image,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${minion.name} agregado a Favoritos',
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),

                const Text(
                  'Películas',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 210,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,

                    itemBuilder: (context, index) {

                      final movie = movies[index];

                      return MovieCard(
                        title: movie.title,
                        image: movie.posterPath,
                        vote: movie.vote,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      
    );
  }
}