//
//  relations.swift
//  SpotiClone
//
//  Created by Jan Petrina on 31/01/2025.
//

let genreRelations: [String: [String]] = [
    // Pop y derivados
    "Pop": ["Dance-Pop", "Pop-Rock", "Indie-Pop", "Electropop"],
    "Dance-Pop": ["Pop", "Electropop", "Disco"],
    "Pop-Rock": ["Pop", "Rock", "Indie-Pop"],
    "Electropop": ["Pop", "Dance-Pop", "Industrial Rock"],
    "Indie-Pop": ["Pop", "Pop-Rock", "Indie"],
    "Britpop": ["Pop", "Rock", "Indie"],

    // Rock y derivados
    "Rock": ["Pop-Rock", "Indie Rock", "Alternative Rock"],
    "Indie Rock": ["Rock", "Alternative Rock", "Indie"],
    "Alternative Rock": ["Rock", "Indie Rock", "Industrial Rock"],
    "Industrial Rock": ["Alternative Rock", "Electropop"],
    "Indie": ["Indie Rock", "Indie-Pop", "Britpop"],

    // R&B y géneros relacionados
    "R&B": ["Soul", "Hip-Hop"],
    "Soul": ["R&B", "Disco"],
    "Hip-Hop": ["R&B", "Dance-Pop"],
    "Disco": ["Dance-Pop", "Soul"],

    // Otros
    "Soundtrack": ["Orchestral", "Pop", "Rock"] // Género versátil que puede relacionarse con varios
]

let tonalRelations: [String: [String]] = [
    "C": ["G", "F", "Am"],
    "C#": ["G#", "F#", "A#m"],
    "Db": ["Ab", "Gb", "Bbm"],
    "D": ["A", "G", "Bm"],
    "D#": ["A#", "A", "Cm"],
    "Eb": ["Bb", "Ab", "Cm"],
    "E": ["B", "A", "C#m"],
    "F": ["C", "Bb", "Dm"],
    "F#": ["C#", "B", "D#m"],
    "Gb": ["Db", "B", "Ebm"],
    "G": ["D", "C", "Em"],
    "G#": ["D#", "D", "Fm"],
    "Ab": ["Eb", "Db", "Cm"],
    "A": ["E", "D", "F#m"],
    "A#": ["F", "E", "Gm"],
    "Bb": ["F", "Eb", "Gm"],
    "B": ["F#", "E", "G#m"]
]
