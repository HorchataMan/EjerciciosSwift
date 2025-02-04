//
//  dj.swift
//  SpotiClone
//
//  Created by Jan Petrina on 28/01/2025.
//
import Foundation




struct DJ {
    var styleTags: Set<[String]>
    var description: String
    
    init(styleTags: Set<[String]>, description: String) {
        self.styleTags = styleTags
        self.description = description
    }
    
    func createPlaylistByTags(playlistName: String) -> Playlist {
        var newPlaylist = Playlist(name: playlistName)
        let songList = SongsLoader().songs
        
        for song in songList {
            for tag in styleTags {
                if song.metadata.tags.contains(tag) && !newPlaylist.contains(song: song) {
                    newPlaylist.addSong(song)
                }
            }
        }
        return newPlaylist
    }
}


