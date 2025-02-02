//
//  playlist.swift
//  SpotiClone
//
//  Created by Jan Petrina on 28/01/2025.
//

import Foundation

struct Playlist {
    var name: String
    var songList: [Song]
    
    //Iniciamos la playlist que tiene un nombre y una lista de canciones
    init(name: String, songList: [Song] = []) {
        self.name = name
        self.songList = songList
    }
    
    ///Adds a single song to the playlist
    mutating func addSong(_ song: Song) {
        
        guard type(of: song) == Song.self else {
            return
        }
        
        songList.append(song)
        
    }
    
    ///Adds a selection of songs to the playlist
    mutating func addSongs(_ songSelection: [Song]) {
        
        guard !songSelection.isEmpty else {
            return
        }
        
        for song in songSelection {
            songList.append(song)
        }
        
    }
    
    ///Returns the number of songs in the playlist
    func songCount() -> Int {
        return songList.count
    }
    
    ///Deletes a song from the playlist
    mutating func deleteSong(_ songToRemove: Song) {
        
        guard type(of: songToRemove) == Song.self else {
            return
        }
        
        songList.removeAll(where: {$0 == songToRemove})
    }
    
    ///Deletes all the selected songs from a playlist
    mutating func deleteSongSelection(_ songsToDelete: [Song]) {
        
        guard !songsToDelete.isEmpty else {
            return
        }
        
        for song in songsToDelete {
            deleteSong(song)
        }
    }
    
    ///Empties the playlist
    mutating func emptyPlaylist() {
        songList = []
    }
    
    ///Shuffles the playlist
    mutating func shufflePlaylist(){
        songList.shuffle()
    }
    
    ///Reverses the playlist order
    mutating func reverseOrder() {
        songList.reverse()
    }
    
    
    ///Orders the playlist by release date
    mutating func orderByRelease() {
        
        guard !songList.isEmpty else {
            return
        }
        
        var newSongList = songList
        
        newSongList.sort(by: {
            getSongReleaseDate($0) > getSongReleaseDate($1)
        })
        
        songList = newSongList
    }
    
    ///Gets the song release date as a Date type so it can be compared and ordered by
    private func getSongReleaseDate(_ song: Song) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        
        guard let songDate = dateFormatter.date(from: song.basicInfo.releaseDate) else {
            return Date.now
        }
        
        return songDate
    }
    
}
