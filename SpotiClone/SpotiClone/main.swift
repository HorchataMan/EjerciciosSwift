

import Foundation


let allSongs = SongsLoader(fromData: SongsData.getSongsData()).songs

func main(){
    
    let algoritmo = Algorithm()
    


    print(allSongs[0].basicInfo.title)
    print(algoritmo.findSimilarityScoreByBPM(bpm: 171, song: allSongs[0]))
    print(algoritmo.findSimilarityScoreByTags(tags: ["80s", "synthwave", "dance"], song: allSongs[0]))
    print(algoritmo.findSongSimilarityScore(chosenSong: allSongs[0], songToCompare: allSongs[2]))
}

main()
