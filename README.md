# M3U8 Playlist Conversion Script for Windows Android Compatibility

This is a batch script that converts iTunes (on Windows) M3U8 playlists for (VLC player app on) Android. This script will handle special characters and convert the file paths correctly. This makes it so you can for example, just select the Playlist file within the VLC for Android app, and the music playlist will play. No internet connection or streaming service subscription required!

This might also work on M3U playlist files - I haven't tested it yet. Also untested on Mac.

## How to Use

1. Export playlist from iTunes or wherever (in iTunes: select the playlist then go to File > Library > Export Playlist > save as `.m3u8`)
2. Just drag and drop your M3U8 file onto the batch script provided, or run: `convert_playlist.bat "my_playlist.m3u8"` (making sure the Batch file and M3U8 file are in the same directory).
3. put playlists in `.../Music` on phone
4. put music in `.../Music/music` on phone (TODO fix)

## TODO

- [ ] change it so it looks for playlists in the same folder as the music (remove trailing `music/` in each song filepath).

## Changelog

- v1.0.0 - 2025-10-30: Working. Music has to be in `/Music/music/`. Playlists have to be in `/Music/`.