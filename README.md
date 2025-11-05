# M3U8 Playlist Conversion Script for Windows -> Android

This is a batch script that converts M3U8 playlists (e.g. from iTunes on Windows) to work on Android (e.g. in the VLC Player app). This script will handle special characters and convert the file paths correctly. This makes it so you can for example, just select the Playlist file within the VLC for Android app, and the music playlist will play. No internet connection or streaming service subscription required!

This might also work on M3U playlist files - I haven't tested it yet. Also untested on Mac.

## How to Use

1. Edit Line 6 of the script (`MUSIC_BASE_PATH=O:\music"`) to point to your Windows/iTunes music library.
2. Export playlist from iTunes or wherever (in iTunes: select the playlist then go to File > Library > Export Playlist > save as `.m3u8`).
3. Just drag and drop your M3U8 file onto the batch script provided, or run: `convert_playlist.bat "my_playlist.m3u8"` (making sure the Batch file and M3U8 file are in the same directory).
4. Put converted playlist files in `.../Music` on phone.
5. Put music in `.../Music/music` on phone.

## Changelog

- v1.0.0 - 2025-10-30: Working. Music has to be in `/Music/music/`. Playlists have to be in `/Music/`.
- v1.0.0-alt - 2025-10-30: Working. Music and playlists both have to be in `/Music/`. After testing, I find it much harder to get to playlists, so I recommend v1.0.0 but will leave this as an option.

## TODO

- [ ] test m3u files (e.g. from MusicBee)
