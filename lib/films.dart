// Mendefinisikan kelas Film
class Film {
  final String title; // Variabel untuk judul film
  final String imagePath; // Variabel untuk jalur gambar film
  final String sinopsis; // Variabel untuk sinopsis film
  final String durasi; // Variabel untuk durasi film
  final double rating; // Variabel untuk rating film

  // Konstruktor dengan parameter yang diharuskan untuk inisialisasi variabel
  Film({
    required this.title,
    required this.imagePath,
    required this.sinopsis,
    required this.durasi,
    required this.rating,
  });
}

// Membuat daftar film dengan beberapa contoh film
List<Film> films = [
  Film(
    title: 'The Batman',
    imagePath: 'assets/images/Batman.jpg', // Jalur gambar untuk film Batman
    durasi: '2h 22min', // Durasi film
    rating: 9.3, // Rating film
    sinopsis: 'Di tahun keduanya sebagai Batman (Robert Pattinson), Bruce Wayne berjuang untuk menemukan tempatnya sebagai pemburu kejahatan.'
        'Dia menanamkan rasa takut pada mereka yang melakukan tindakan kriminal, tetapi dengan metodenya yang selalu main hakim sendiri.'
        'Alasannya, karena dia masih belum mendapatkan kepercayaan dari orang-orang, kecuali Letnan James “Jim” Gordon (Jeffrey Wright) yang mengizinkan Batman menyelidiki TKP bersamanya.'
        'Kasus berikutnya yang harus ia hadapi adalah kasus pembunuhan dan korbannya adalah walikota Don Mitchell Jr (Rupert Penry-Jones). Orang yang dicurigai sebagai dalang dari pembunuhan tersebut adalah seseorang yang menyebut dirinya The Riddler (Paul Dano).'
        'Batman pun mulai mengumpulkan petunjuk yang ditinggalkan si pembunuh setelah ia melakukan aksinya. Dengan bantuan Selina Kyle (Zoe Kravitz) yang menjadi pelayan di klub bos mafia Carmine Falcone (John Turturo), Batman bekerja untuk memecahkan misteri sebelum The Riddler dapat mengklaim korban berikutnya.'
        'Misteri yang membawanya pada rahasia besar tentang Gotham dan juga tentang keluarganya.', // Sinopsis film
  ),
  Film(
    title: 'Interstellar',
    imagePath: 'assets/images/Interstellar.jpg', // Jalur gambar untuk film Interstellar
    durasi: '2h 55min', // Durasi film
    rating: 9.2, // Rating film
    sinopsis: 'Pada tahun 2067, Bumi tidak lagi mampu menopang kebutuhan umat manusia. Ladang pertanian sering rusak akibat hawar, badai debu menerjang daratan, dan umat manusia kembali ke peradaban bertani tanpa negara.'
        ' Cooper (Matthew McConaughey), mantan pilot uji coba NASA yang menjadi petani, tinggal bersama keluarganya, termasuk ayah mertuanya, putranya Tom (Timothée Chalamet), dan putrinya yang berusia sepuluh tahun, Murph (Mackenzie Foy),'
        ' yang percaya bahwa rumah mereka dihantui oleh hantu yang berusaha berkomunikasi dengannya. Setelah menantang Murph untuk membuktikan keberadaan hantu melalui penyelidikan ilmiah, Cooper menemukan bahwa hantu tersebut memandu mereka'
        ' ke pangkalan rahasia NASA yang dipimpin Profesor Brand (Michael Caine).', // Sinopsis film
  ),
  Film(
    title: 'Brave',
    imagePath: 'assets/images/brave.jpg', // Jalur gambar untuk film Brave
    durasi: '2h 55min', // Durasi film
    rating: 9.2, // Rating film
    sinopsis: 'Sepuluh tahun kemudian, terlepas dari niat Elinor untuk menjadikan Merida yang berusia enam belas tahun menjadi seorang putri bangsawan yang pantas,'
        'Merida bertekad untuk mencari kebebasan dan menjalani hidupnya sendiri. Suatu hari, Lords Macintosh, MacGuffin, dan Dingwall tiba untuk mempersembahkan putra'
        'mereka untuk pertunangan Merida. Setelah pertengkaran, ketiga pasukan terlibat perkelahian, yang dihentikan Elinor. Dia menyatakan bahwa tantangan yang akan'
        'diikuti oleh anak sulung dari setiap klan akan diputuskan oleh gadis yang adil. Merida, mendengar ini, percaya bahwa ide kontestan menjadi anak sulung adalah'
        'sebuah celah, jadi Merida memilih memanah. Dua kontestan pertama tidak memiliki keterampilan, dan putra Lord Dingwall menang dengan kecelakaan yang menguntungkan.'
        'Merida kemudian melangkah maju dengan busurnya dan mengklaim bahwa dia mewakili klannya sebagai anak sulung dan akan menembak untuk mengklaim dirinya sendiri.'
        'Terlepas dari keberatan Elinor, dia menembak ketiga sasaran, bahkan membelah anak panah Dingwall, yang konon memenangkan kontes.', // Sinopsis film
  ),
  Film(
    title: 'Foreigher',
    imagePath: 'assets/images/Foreigher.jpg', // Jalur gambar untuk film Foreigher
    durasi: '2h 55min', // Durasi film
    rating: 9.2, // Rating film
    sinopsis: 'Quan enters the bombers London flat disguised as a gasman. He kills all of them except for Sara, who was wounded in the scuffle.'
        ' Quan escapes just before the SO15 and MI5 storm the complex. They torture Sara into disclosing the location of their next bomb, which is planted'
        ' in a reportes laptop to be detonated on a plane carrying British dignitaries to a conference. Airport police locate the reporter and throw the'
        ' laptop into an air bridge, which explodes without any casualties. Shortly afterward, McKay is executed to tie up loose ends. British cabinet minister'
        ' Katherine Davies, who was scheduled to be on the targeted flight, calls Hennessy to tell him she knows of his involvement, but having helped prevent'
        ' the attack, he can remain as deputy First Minister, albeit under her control. Meanwhile, Morrison kills Mary.', // Sinopsis film
  ),
  Film(
    title: 'Logan',
    imagePath: 'assets/images/Logan.jpg', // Jalur gambar untuk film Logan
    durasi: '2h 55min', // Durasi film
    rating: 9.2, // Rating film
    sinopsis: 'Logan is a 2017 American superhero film starring Hugh Jackman as the titular character. It is the tenth film in the X-Men film series and the third and'
        ' final installment in the Wolverine trilogy, following X-Men Origins: Wolverine (2009) and The Wolverine (2013). The film, which takes inspiration from the'
        '"Old Man Logan" comics storyline by Mark Millar and Steve McNiven, follows an aged Wolverine and an extremely ill Charles Xavier who must defend a young'
        ' mutant named Laura from the Reavers led by Donald Pierce and Zander Rice. The film is produced by 20th Century Fox, Marvel Entertainment, TSG Entertainment'
        ' and The Donners Company, and distributed by 20th Century Fox. It is directed by James Mangold, who co-wrote the screenplay with Michael Green and Scott Frank,'
        ' from a story by Mangold. In addition to Jackman, the film also stars Patrick Stewart, Richard E. Grant, Boyd Holbrook, Stephen Merchant, and introducing Dafne'
        ' Keen in her film debut as Laura.', // Sinopsis film
  ),
  Film(
    title: 'Matrix',
    imagePath: 'assets/images/Matrix.jpg', // Jalur gambar untuk film Matrix
    durasi: '2h 55min', // Durasi film
    rating: 9.2, // Rating film
    sinopsis: 'Cerita film ini tentang seorang hacker yang bernama Neo dan mengetahui akan keadaan sebenarnya dari realitas dan lalu bergabung dengan sebuah kelompok'
        ' pemberontak melawan program-program komputer penjaga yang disebut agen-agen. Para pemberontak ini dipimpin oleh Morpheus. Anggota lainnya adalah Trinity,'
        ' Cypher, Tank, dan lain-lain.', // Sinopsis film
  ),
  // Tambahkan film-film lainnya sesuai kebutuhan
];

// Mendefinisikan kelas Ticket
class Ticket {
  final String filmTitle; // Variabel untuk judul film yang ditiketkan
  final String ticketInfo; // Variabel untuk informasi tiket

  // Konstruktor dengan parameter yang diharuskan untuk inisialisasi variabel
  Ticket({required this.filmTitle, required this.ticketInfo});
}

// Membuat daftar tiket dengan beberapa contoh tiket
List<Ticket> tickets = [
  Ticket(filmTitle: 'Film 1', ticketInfo: 'Tiket untuk Film 1'), // Contoh tiket untuk Film 1
  Ticket(filmTitle: 'Film 2', ticketInfo: 'Tiket untuk Film 2'), // Contoh tiket untuk Film 2
  // Tambahkan tiket lainnya di sini
];
