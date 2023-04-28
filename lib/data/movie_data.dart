class Movie {
  final String id;
  final String name;
  final String year;
  final String imageUrl;
  final String imdbUrl;
  final String imdbRating;
  bool isFavorite;

  Movie({
    required this.id,
    required this.name,
    required this.year,
    required this.imageUrl,
    required this.imdbUrl,
    required this.imdbRating,
    required this.isFavorite,
  });
}

var movieList = [
  Movie(
    id: '1',
    name: 'The Godfather',
    year: '1972',
    imageUrl:
        'https://xl.movieposterdb.com/22_07/1972/68646/xl_68646_8c811dec.jpg',
    imdbUrl: 'https://www.imdb.com/title/tt0068646/',
    imdbRating: '5.0',
    isFavorite: false,
  ),
  Movie(
    id: '2',
    name: 'The Shawshank Redemption',
    year: '1994',
    imageUrl:
        'https://xl.movieposterdb.com/05_03/1994/0111161/xl_8494_0111161_3bb8e662.jpg',
    imdbUrl: 'https://www.imdb.com/title/tt0111161/',
    imdbRating: '4.9',
    isFavorite: false,
  ),
  Movie(
    id: '3',
    name: 'The Dark Knight',
    year: '2008',
    imageUrl:
        'https://xl.movieposterdb.com/08_05/2008/468569/xl_468569_f0e2cd63.jpg',
    imdbUrl: 'https://www.imdb.com/title/tt0468569/',
    imdbRating: '4.8',
    isFavorite: false,
  ),
  Movie(
    id: '4',
    name: 'Pulp Fiction',
    year: '1994',
    imageUrl:
        'https://xl.movieposterdb.com/07_10/1994/110912/xl_110912_55345443.jpg',
    imdbUrl: 'https://www.imdb.com/title/tt0110912/',
    imdbRating: '4.7',
    isFavorite: false,
  ),
  Movie(
    id: '5',
    name: 'The Lord of the Rings: The Fellowship of the Ring',
    year: '2001',
    imageUrl:
        'https://xl.movieposterdb.com/04_12/2001/0120737/xl_166_0120737_158c8914.jpg',
    imdbUrl: 'https://www.imdb.com/title/tt0120737/',
    imdbRating: '4.6',
    isFavorite: false,
  ),
  Movie(
    id: '6',
    name: 'The Godfather: Part II',
    year: '1974',
    imageUrl:
        'https://xl.movieposterdb.com/22_07/1974/71562/xl_71562_28dbaac1.jpg',
    imdbUrl: 'https://www.imdb.com/title/tt0071562/',
    imdbRating: '4.5',
    isFavorite: false,
  ),
  Movie(
    id: '7',
    name: 'The Empire Strikes Back',
    year: '1980',
    imageUrl:
        'https://xl.movieposterdb.com/20_09/1980/80684/xl_80684_931daf60.jpg',
    imdbUrl: 'https://www.imdb.com/title/tt0080684/',
    imdbRating: '4.5',
    isFavorite: false,
  ),
  Movie(
    id: '8',
    name: 'The Matrix',
    year: '1999',
    imageUrl:
        'https://xl.movieposterdb.com/06_01/1999/0133093/xl_77607_0133093_ab8bc972.jpg',
    imdbUrl: 'https://www.imdb.com/title/tt0133093/',
    imdbRating: '4.25',
    isFavorite: false,
  ),
  Movie(
    id: '9',
    name: 'The Avengers',
    year: '2012',
    imageUrl:
        'https://xl.movieposterdb.com/12_01/2012/848228/xl_848228_df20a875.jpg',
    imdbUrl: 'https://www.imdb.com/title/tt0848228/',
    imdbRating: '4.0',
    isFavorite: false,
  ),
];
