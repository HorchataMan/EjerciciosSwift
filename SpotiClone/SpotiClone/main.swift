

import Foundation


let allSongs = SongsLoader(fromData: SongsData.getSongsData()).songs

func main(){
    
    let algoritmo = Algorithm()
    


    print(allSongs[0].basicInfo.title)
    print(algoritmo.findSimilarityScoreByBPM(bpm: 171, song: allSongs[0]))
    print(algoritmo.findSimilarityScoreByTags(tags: ["disco", "dance", "summer"], song: allSongs[0]))
    print(algoritmo.findSimilarityScoreByTonality(key: "F#", song: allSongs[0]))
    print(algoritmo.findSongSimilarityScore(chosenSong: allSongs[0], songToCompare: allSongs[1]))
    print()
    print(algoritmo.findSimilarityScoreByGenre(genre: allSongs[0].basicInfo.genre, song: allSongs[1]))
    print(algoritmo.findSimilarityScoreByTags(tags: allSongs[0].metadata.tags, song: allSongs[1]))
    print(algoritmo.findSimilarityScoreByBPM(bpm: allSongs[0].technicalInfo.bpm, song: allSongs[1]))
    print(algoritmo.findSimilarityScoreByTonality(key: allSongs[0].technicalInfo.key, song: allSongs[1]))
    print(algoritmo.findSimilarityScoreByPopularity(popularity: allSongs[0].metadata.popularity, song: allSongs[1]))
    print()
    print(algoritmo.findSongSimilarityScore(chosenSong: allSongs[0], songToCompare: allSongs[3]))
}

main()
