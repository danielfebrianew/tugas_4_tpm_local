// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tugas_4_tpm_2/data/movie_data.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

const Color _firstColor = Color(0xff77aca2);
const Color _secondColor = Color(0xff031926);

List<Movie> movies = movieList;

final Logger logger = Logger('URL Launcher');
final databaseReference = FirebaseDatabase.instance.ref();

String title = "The Godfather";

class WebListPage extends StatefulWidget {
  const WebListPage({Key? key}) : super(key: key);
  @override
  State<WebListPage> createState() => _WebListPageState();
}

class _WebListPageState extends State<WebListPage> {
  List<bool> isFavoriteList = List.generate(movieList.length, (_) => false);
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Recommendations',
          style: TextStyle(color: _secondColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: _firstColor,
        iconTheme: const IconThemeData(color: _secondColor),
      ),
      body: Container(
        decoration: const BoxDecoration(color: _secondColor),
        child: ListView.builder(
          itemCount: movieList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final movie = movieList[index];
            final isFavorite = isFavoriteList[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  onTap: () {
                    Uri query = Uri.parse(movie.imdbUrl);
                    _launch(query);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(2),
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(movie.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Release Year: ${movie.year}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'IMDB Rating: ${movie.imdbRating}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 120,
                        alignment: Alignment.center,
                        child: IconButton(
                          icon:
                              const Icon(Icons.add_circle, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              isFavoriteList[index] = !isFavorite;

                              movieList[index].isFavorite = true;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Added to Favorites'),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<void> _launch(Uri url) async {
  String concatenate = url.origin + url.path;
  Uri finalURL = Uri.parse(concatenate);
  // print(' concatenate : $concatenate');
  try {
    if (await canLaunchUrl(finalURL)) {
      await launchUrl(finalURL);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    logger.severe('Error launching URL: $e');
  }
}
