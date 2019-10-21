# MusicInfo
### Flutter demo project

This program takes a search query for a song name and returns all associated information including song name, artist name, album name (discography), album thumbnails, YouTube video link, music genre and release date.

Using Music Graph API
https://rapidapi.com/macgyverapi/api/music-graph/endpoints

### Request JSON Example

```json
{
  "key": "free",
  "id": "9m9c8U4f",
  "data": {
    "search": "echoes"
  }
}
```

### Response JSON Example

```json
{
  "result": [
    {
      "songName": "Echoes",
      "albumTitle": "Meddle",
      "thumbnails": {
        "high-quality": "https://img.youtube.com/vi/53N99Nim6WE/hqdefault.jpg",
        "standard": "https://img.youtube.com/vi/53N99Nim6WE/sddefault.jpg"
      },
      "featuredArtists": "",
      "genre": [
        "Prog Rock",
        "Rock"
      ],
      "releaseDate": "1971",
      "artist": "Pink Floyd",
      "ytVideo": "53N99Nim6WE"
    }
  ]
}
```