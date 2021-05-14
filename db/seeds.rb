# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
Movie.create(title: "OSS 117, Le Caire Nid d'Espions", overview: "Égypte, 1955, le Caire est un véritable nid d'espions.
Tout le monde se méfie de tout le monde, tout le monde complote contre tout le monde : Anglais, Français, Soviétiques, la famille du Roi déchu Farouk qui veut retrouver son trône, les Aigles de Kheops, secte religieuse qui veut prendre le pouvoir. Le Président de la République Française, Monsieur René Coty, envoie son arme maîtresse mettre de l'ordre dans cette pétaudière au bord du chaos : Hubert Bonisseur de la Bath, dit OSS 117.", poster_url: "https://img.huffingtonpost.com/asset/5c92d1b82a000052024dff49.jpeg", rating: 10.0)
Movie.create(title: "OSS 117, Rio Ne Répond Plus", overview: "Douze ans après Le Caire, OSS 117 est de retour pour une nouvelle mission à l'autre bout du monde. Lancé sur les traces d'un microfilm compromettant pour l'Etat français, le plus célèbre de nos agents va devoir faire équipe avec la plus séduisante des lieutenants-colonels du Mossad pour capturer un nazi maître chanteur. Des plages ensoleillées de Rio aux luxuriantes forêts amazoniennes, des plus profondes grottes secrètes au sommet du Christ du Corcovado, c'est une nouvelle aventure qui commence. Quel que soit le danger, quel que soit l'enjeu, on peut toujours compter sur Hubert Bonisseur de la Bath pour s'en sortir...", poster_url: "https://fr.web.img6.acsta.net/c_310_420/o_club300-310x420.png_0_se/medias/nmedia/18/67/41/85/19057747.jpg", rating: 12.0)

puts '6 movies created'


url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

puts 'Movies parsed'


movies['results'].each do |movie|
  Movie.create(title: movie['title'],
               overview: movie['overview'],
               poster_url: 'https://image.tmdb.org/t/p/original' + movie['backdrop_path'],
               rating: movie['vote_average']
              )
end

puts 'TMDB Le Wagon movies loaded'
