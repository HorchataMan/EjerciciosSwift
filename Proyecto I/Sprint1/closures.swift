//
//  closures.swift
//  Sprint1
//
//  Created by Jan Petrina on 27/01/2025.
//

func getSongsByArtistClosure(_ artist: String, songArray: [Song]) -> [Song]{
    
    var songsFound: [Song] = []
    
    guard !artist.isEmpty else {
        return songsFound
    }
    
    songsFound = songArray.filter {
        $0.basicInfo.artist == artist
    }
    
    return songsFound
    
}

func getSongsLongerThanClosure(_ durationInS: Int, songArray: [Song]) -> [Song]{
    
    var songsFound: [Song] = []
    
    guard durationInS != 0 else {
        return songsFound
    }
    
    songsFound = songArray.filter {
        $0.basicInfo.durationMs == durationInS * 100
    }
    
    return songsFound
    
}

func getCatalogueDurationClosure(_ songArray: [Song]) -> Int{
    
    var duration: Int = 0
    
    guard !songArray.isEmpty else {
        return duration
    }
    
    duration = songArray.reduce(0, {$0 + $1.basicInfo.durationMs})
    
    return duration
    
}

func getAverageDurationClosure(_ songArray: [Song]) -> Int {
    
    guard !songArray.isEmpty else {
        return 0
    }
    
    let fullDuration = getCatalogueDuration(songArray)
    
    let averageDuration = fullDuration / songArray.count
    
    return averageDuration
}


func hasSongsOfClosure(genre: String, year: Int, songArray: [Song]) -> Bool {
    
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
