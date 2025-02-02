//
//  dj.swift
//  SpotiClone
//
//  Created by Jan Petrina on 28/01/2025.
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


struct DJ {
    var styleTags: Set<[String]>
    var description: String
    
    init(styleTags: Set<[String]>, description: String) {
        self.styleTags = styleTags
        self.description = description
    }
}

struct Algorithm {
    
    func findSimilarityScoreByGenre(genre: String, song: Song) -> Double {
        //Max score for similarities in this is 25 points
        var score: Double = 0
        let firstLevelRelation: [String] = genreRelations[genre] ?? [""]
        
        
        
        if genre == song.basicInfo.genre {
            score = 25
        }
        else if firstLevelRelation.contains(song.basicInfo.genre) {
            score = 17.5
        }
        else {
            for firstLevelGenre in firstLevelRelation {
                let secondLevelRelation: [String] = genreRelations[firstLevelGenre] ?? [""]
                if secondLevelRelation.contains(song.basicInfo.genre) {
                    score = 10
                    break
                }
            }
        }
        return score
    }
    
    func findSimilarityScoreByBPM(bpm: Int, song: Song) -> Double {
        //Max score for this evaluation is 20
        var score: Double = 0
        
        let bpmDiff = abs((bpm - song.technicalInfo.bpm))
        
        switch bpmDiff {
        case 0..<10:
            score = 20
        case 10..<20:
            score = 15
        case 20..<30:
            score = 10
        case 30..<40:
            score = 5
        default:
            score = 0
        }
        
        return score
    }
    
    func findSimilarityScoreByTags(tags: [String], song: Song) -> Double {
        guard !tags.isEmpty else {
            return 0
        }
        guard !song.metadata.tags.isEmpty else {
            return 0
        }
        
        var score: Double = 0
        
        let maxTags = tags.count > song.metadata.tags.count ? tags.count : song.metadata.tags.count
        var similarTags: Int = 0
        
        for tag in tags {
            similarTags = song.metadata.tags.reduce(0) {
                $1 == tag ? 1 : 0 //Intente hacerlo con closure en lugar de contains, pero no lo pude testear
            }
        }
        //Max score should be 30 points
        let ratio: Double = Double(similarTags/maxTags)
        score = ratio * 30
        
        return score
    }
    
    func findSimilarityScoreByTonality(key: String, song: Song) -> Double {
        //Max score is 15 points
        var score: Double = 0
        let firstLevelRelation: [String] = tonalRelations[key] ?? [""]
        
        
        
        if key == song.technicalInfo.key {
            score = 15
        }
        else if firstLevelRelation.contains(song.technicalInfo.key) {
            score = 10.5
        }
        else {
            score = 0
        }
        
        return score
    }
    
    func findSimilarityScoreByPopularity(popularity: Int, song: Song) -> Double {
        //Max score for this evaluation is 10
        var score: Double = 0
        let popularityNormalized = popularity > 100 ? 100 : popularity
        
        let popularityDiff = abs((popularityNormalized - song.metadata.popularity))
        
        let ratio: Double = 1.0 - (Double(popularity)/100.0)
        score = 10.0 * ratio
        
        return score
    }
    
    func findSongSimilarityScore(chosenSong: Song, songToCompare: Song) -> Double {
        var score: Double = 0.0
        score += findSimilarityScoreByBPM(bpm: chosenSong.technicalInfo.bpm, song: songToCompare)
        score += findSimilarityScoreByTags(tags: chosenSong.metadata.tags, song: songToCompare)
        score += findSimilarityScoreByGenre(genre: chosenSong.basicInfo.genre, song: songToCompare)
        score += findSimilarityScoreByTonality(key: chosenSong.technicalInfo.key, song: songToCompare)
        score += findSimilarityScoreByPopularity(popularity: chosenSong.metadata.popularity, song: songToCompare)
        
        return score
    }
}
