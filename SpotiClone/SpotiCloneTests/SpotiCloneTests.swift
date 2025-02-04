//
//  SpotiCloneTests.swift
//  SpotiCloneTests
//
//  Created by Jan Petrina on 04/02/2025.
//

import Testing

struct SpotiCloneTests {

    @Test func findSimilarityTests() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let algorithm = Algorithm()
        let sampleSongs = SongsLoader().songs.prefix(upTo: 5)        //Prueba
        let similaritySameSong = algorithm.findSongSimilarityScore(chosenSong: sampleSongs[0], songToCompare: sampleSongs[0])
        //Test
        #expect(similaritySameSong == 100.0)
    }

}
