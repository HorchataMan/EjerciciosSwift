//
//  songPlayer.swift
//  SpotiClone
//
//  Created by Jan Petrina on 03/02/2025.
//
import Foundation

struct SongPlayer {
    var interval: Int
    
    private var prevSongIndex: Int
    private var currentSongIndex: Int
    private var nextSongIndex: Int
    private var isPaused: Bool
    
    init(interval: Int = 5) {
        self.interval = interval
        self.prevSongIndex = 0
        self.currentSongIndex = 0
        self.nextSongIndex = 0
        self.isPaused = false
    }
    
    ///Plays a playlist
    mutating func play(_ playlist: Playlist) {
        guard !playlist.songList.isEmpty else {
            return
        }
        
        if !isPaused {
            for (index, song) in playlist.songList[currentSongIndex...playlist.songCount()-1].enumerated() {
                
                print("Now playing: \(song.basicInfo.title) from \(playlist.name)")
                currentSongIndex = index
                prevSongIndex = (index - 1) % playlist.songCount()
                nextSongIndex = (index + 1) % playlist.songCount()
                sleep(UInt32(interval))
                
            }
        } else {
            print("Se ha pausado")
            return
        }
        
        print("Se ha terminado la playlist")
        return
    }
    
    ///Pausa la reproduccion de la playlist
    mutating func pause(_ playlist: Playlist) {
        //Aun falta definir como funcionaria esto dado que depende del funcionamiento de play
        isPaused = true
        play(playlist)
    }
    
    ///Adelanta a la siguiente cancion
    mutating func fastForward(_ playlist: Playlist) {
        currentSongIndex = nextSongIndex
        play(playlist)
    }
    
    ///Retrocede a la cancion anterior
    mutating func rewind(_ playlist: Playlist) {
        currentSongIndex = prevSongIndex
        play(playlist)
    }
    
    mutating func resume(_ playlist: Playlist) {
        //Aun falta definir como funcionaria esto dado que depende del funcionamiento de play
        isPaused = false
        play(playlist)
    }
    
}
