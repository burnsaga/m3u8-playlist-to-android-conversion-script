# M3U8 Playlist Conversion Script for Windows Android Compatibility

This is a batch script that converts iTunes (on Windows) M3U8 playlists for (VLC player app on) Android. This script will handle special characters and convert the file paths correctly. This makes it so you can for example, just select the Playlist file within the VLC for Android app, and the music playlist will play. No internet connection or streaming service subscription required!

This might also work on M3U playlist files - I haven't tested it yet. Also untested on Mac.

## How to Use

1. Export playlist from iTunes or wherever (in iTunes: select the playlist then go to File > Library > Export Playlist > save as `.m3u8`)
2. Just drag and drop your M3U8 file onto the batch script provided, or run: `convert_playlist.bat "my_playlist.m3u8"` (making sure the Batch file and M3U8 file are in the same directory).
3. put playlists in `.../Music` on phone
4. put music in `.../Music/music` on phone (TODO fix)

## Changelog

- v1.0.0 - 2025-10-30: Working. Music has to be in `/Music/music/`. Playlists have to be in `/Music/`.
- v1.0.0-alt - 2025-10-30: Working. Music and playlists both have to be in `/Music/`. After testing, I find it much harder to get to playlists, so I recommend v1.0.0 but will leave this as an option.