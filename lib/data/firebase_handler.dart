import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tugas_4_tpm_2/data/movie_data.dart';

List<Movie> movie = movieList;

class FirebaseHandler {
  static Future<void> addMoviesToFirebase(List<Movie> movies) async {
    await Firebase.initializeApp();
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('movies');
    for (Movie movie in movies) {
      databaseReference.child(movie.id).set({
        'name': movie.name,
        'year': movie.year,
        'imageUrl': movie.imageUrl,
        'imdbUrl': movie.imdbUrl,
        'imdbRating': movie.imdbRating,
      });
    }
  }
}
