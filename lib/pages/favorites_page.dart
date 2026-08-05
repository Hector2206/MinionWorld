import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/firestore_service.dart';

class FavoritesPage extends StatelessWidget {

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {

    final firestoreService =
        FirestoreService();

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5F5F5),

      appBar: AppBar(

        automaticallyImplyLeading: false,

        elevation: 0,

        backgroundColor:
            const Color(0xFFF9D923),

        foregroundColor: Colors.black,

        centerTitle: true,

        title: const Text(
          'Mis Favoritos ',

          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: StreamBuilder<QuerySnapshot>(

        stream:
            firestoreService.getFavorites(),

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {

            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          final docs =
              snapshot.data?.docs ?? [];

          if (docs.isEmpty) {

            return Center(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Icon(
                    Icons.favorite_border,

                    size: 120,

                    color:
                        Colors.grey.shade400,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'No tienes favoritos aún',

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,

                      color:
                          Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Agrega Minions para verlos aquí ',

                    style: TextStyle(
                      fontSize: 16,

                      color:
                          Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(

            padding:
                const EdgeInsets.all(15),

            itemCount: docs.length,

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,

              crossAxisSpacing: 15,
              mainAxisSpacing: 15,

              childAspectRatio: 0.72,
            ),

            itemBuilder: (context, index) {

              final data =
                  docs[index].data()
                      as Map<String, dynamic>;

              return Container(

                decoration: BoxDecoration(

                  borderRadius:
                      BorderRadius.circular(25),

                  color: Colors.white,

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

                    Expanded(

                      child: ClipRRect(

                        borderRadius:
                            const BorderRadius.only(

                          topLeft:
                              Radius.circular(25),

                          topRight:
                              Radius.circular(25),
                        ),

                        child: Container(

                          width: double.infinity,

                          color:
                              Colors.grey.shade100,

                          child: Image.asset(
                            data['image'],

                            fit: BoxFit.contain,

                            errorBuilder:
                                (
                                  context,
                                  error,
                                  stackTrace,
                                ) {

                              return const Center(
                                child: Icon(
                                  Icons.image,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    Padding(

                      padding:
                          const EdgeInsets.all(12),

                      child: Column(

                        children: [

                          Text(
                            data['name'],

                            textAlign:
                                TextAlign.center,

                            maxLines: 1,

                            overflow:
                                TextOverflow.ellipsis,

                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Container(

                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(

                              color:
                                  const Color(0xFFF9D923),

                              borderRadius:
                                  BorderRadius.circular(20),
                            ),

                            child: const Text(
                              'Favorito ',

                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          SizedBox(

                            width: double.infinity,

                            child: ElevatedButton.icon(

                              onPressed: () async {

                                await firestoreService
                                    .removeFavorite(
                                  data['name'],
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(

                                  SnackBar(
                                    content: Text(
                                      '${data['name']} eliminado ',
                                    ),
                                  ),
                                );
                              },

                              style: ElevatedButton.styleFrom(

                                backgroundColor: Colors.red,

                                foregroundColor: Colors.white,
                              ),

                              icon: const Icon(
                                Icons.delete,
                                size: 18,
                              ),

                              label: const Text(
                                'Eliminar',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: 1,

        onTap: (index) {

          if (index == 0) {

            Navigator.pushReplacementNamed(
              context,
              '/home',
            );

          } else if (index == 1) {

            Navigator.pushReplacementNamed(
              context,
              '/favorites',
            );

          } else if (index == 2) {

            Navigator.pushReplacementNamed(
              context,
              '/profile',
            );
          }
        },

        selectedItemColor:
            const Color(0xFF4D96FF),

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}