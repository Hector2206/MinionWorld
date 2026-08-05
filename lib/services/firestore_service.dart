import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {

  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth auth =
      FirebaseAuth.instance;

  // AGREGAR FAVORITO
  Future<void> addFavorite({
    required String name,
    required String image,
  }) async {

    final uid = auth.currentUser!.uid;

    await firestore
        .collection('favorites')
        .doc(uid)
        .collection('myFavorites')
        .doc(name)
        .set({
      'name': name,
      'image': image,
    });
  }

  // OBTENER FAVORITOS
  Stream<QuerySnapshot> getFavorites() {

    final uid = auth.currentUser!.uid;

    return firestore
        .collection('favorites')
        .doc(uid)
        .collection('myFavorites')
        .snapshots();
  }

  // ELIMINAR FAVORITO
  Future<void> removeFavorite(
    String name,
  ) async {

    final uid = auth.currentUser!.uid;

    await firestore
        .collection('favorites')
        .doc(uid)
        .collection('myFavorites')
        .doc(name)
        .delete();
  }
}

