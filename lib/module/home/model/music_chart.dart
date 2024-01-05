class ChartData {
  int id;
  String name;
  int week;
  int year;
  List<ChartSong> songs;

  ChartData({
    required this.id,
    required this.name,
    required this.week,
    required this.year,
    required this.songs,
  });

  factory ChartData.fromJson(Map<String, dynamic> json) {
    List<ChartSong> songsList = List<ChartSong>.from(
      json['songs'].map((song) => ChartSong.fromJson(song)),
    );

    return ChartData(
      id: json['id'],
      name: json['name'],
      week: json['week'],
      year: json['year'],
      songs: songsList,
    );
  }
}

class ChartSong {
  int position;
  SongData song;

  ChartSong({
    required this.position,
    required this.song,
  });

  factory ChartSong.fromJson(Map<String, dynamic> json) {
    return ChartSong(
      position: json['position'],
      song: SongData.fromJson(json['song']),
    );
  }
}

class SongData {
  int id;
  int artistId;
  String artistName;
  String artistProfilePicture;
  String title;
  String? spotifyUrl;
  String? appleMusicUrl;

  SongData({
    required this.id,
    required this.artistId,
    required this.artistName,
    required this.artistProfilePicture,
    required this.title,
    this.spotifyUrl,
    this.appleMusicUrl,
  });

  factory SongData.fromJson(Map<String, dynamic> json) {
    return SongData(
      id: json['id'],
      artistId: json['artist_id'],
      artistName: json['artist_name'],
      artistProfilePicture: json['artist_profile_picture'],
      title: json['title'],
      spotifyUrl: json['spotify_url'],
      appleMusicUrl: json['apple_music_url'],
    );
  }
}
