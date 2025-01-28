//
//  main.swift
//  Sprint1
//
//  Created by Ismael Sabri Pérez on 16/1/25.
//

import Foundation
import OSLog

let logger = Logger(subsystem: "Sprint1", category: "main")

let songsList = SongsLoader().songs

func printSongs(_ songs: [Song]){
    
    songs.forEach { song in
            print(song.basicInfo.title)
        }
}

// MARK: - Main
func main() {
    
    

    
    printSongs(getSongsLongerThan(3000, songArray: songsList))
    
    
    
}

main()

func getSongsByArtist(_ artist: String, songArray: [Song]) -> [Song]{
    
    var songsFound: [Song] = []
    
    guard !artist.isEmpty else {
        return songsFound
    }
    
    for song in songArray {
        if song.basicInfo.artist.lowercased() == artist {
            songsFound.append(song)
        }
    }
    
    return songsFound
    
}

func getSongsLongerThan(_ durationInS: Int, songArray: [Song]) -> [Song]{
    
    var songsFound: [Song] = []
    
    guard durationInS != 0 else {
        return songsFound
    }
    
    for song in songArray {
        if song.basicInfo.durationMs >= (durationInS * 100) {
            songsFound.append(song)
        }
    }
    
    return songsFound
    
}

func getCatalogueDuration(_ songArray: [Song]) -> Int{
    
    var duration: Int = 0
    
    guard !songArray.isEmpty else {
        return duration
    }
    
    for song in songArray {
        duration += song.basicInfo.durationMs
    }
    
    return duration
    
}

func getAverageDuration(_ songArray: [Song]) -> Int {
    
    guard !songArray.isEmpty else {
        return 0
    }
    
    let fullDuration = getCatalogueDuration(songArray)
    
    let averageDuration = fullDuration / songArray.count
    
    return averageDuration
}


func hasSongsOf(genre: String, year: Int, songArray: [Song]) -> Bool {
    
    var doesExist: Bool = false
    
    guard !genre.isEmpty || year != 0 else {
        return doesExist
    }
    
    for song in songArray {
        if song.basicInfo.genre == genre {
            if Int(song.basicInfo.releaseDate.prefix(4)) == year {
                doesExist = true
            }
                
        }
    }
    
    return doesExist
    
}


