import Foundation


// MARK: - Exercise 1: startWithVowels
/// Filtra un array de strings para obtener solo aquellos que comienzan con vocal
///
/// - Parameter strings: Un array de strings (`[String]`) a filtrar
///
/// - Returns: Un array de strings (`[String]`) que contiene solo las cadenas que empiezan por vocal
///
/// La función es case-insensitive (funciona tanto con mayúsculas como minúsculas)
/// e ignora caracteres acentuados
///
/// Ejemplo de uso:
/// ```swift
/// let words = ["Avión", "Casa", "Iglesia", "Mesa", "Oso"]
/// let result = startWithVowels(strings: words)
/// print(result) // Output: ["Avión", "Iglesia", "Oso"]
/// ```
func startWithVowels(strings: [String])->[String]{
    
    let vowels = Set<Character>("aeiou")
                        
    var selected : [String] = []
    
    for current in strings{
        if let firstChar = current.first {
            let normalizedChar = firstChar.lowercased()
            if vowels.contains(normalizedChar) {
                selected.append(current)
            }
        }
    }
    return selected
}




// MARK: - Exercise 2: longerThan
/// Filtra un array de strings para obtener aquellos cuya longitud es mayor que un valor especificado
///
/// - Parameters:
///   - strings: Un array de strings (`[String]`) a filtrar
///   - length: Un entero (`Int`) que especifica la longitud mínima
///
/// - Returns: Un array de strings (`[String]`) con las cadenas más largas que `length`
///
/// Ejemplo de uso:
/// ```swift
/// let words = ["Hola", "Mundo", "Programación", "Swift"]
/// let result = longerThan(strings: words, length: 5)
/// print(result) // Output: ["Programación"]
/// ```
func longerThan(strings: [String], length: Int) -> [String] {
    var selected: [String] = []
    
    for current in strings {
        if current.count > length {
            selected.append(current)
        }
    }
    return selected
}


// MARK: - Exercise 3: select
/// Filtra un array de strings usando un predicado personalizable
///
/// - Parameters:
///   - sequence: Un array de strings (`[String]`) a filtrar
///   - predicate: Una closure que recibe un `String` y devuelve un `Bool`
///
/// - Returns: Un array de strings (`[String]`) que cumplen con el predicado
///
/// Ejemplo de uso:
/// ```swift
/// let words = ["Swift", "iOS", "Programming"]
/// let result = select(sequence: words) { $0.count > 3 }
/// print(result) // Output: ["Swift", "Programming"]
/// ```
func select(sequence: [String],
            predicate: (String) -> Bool) -> [String] {
    
    var accum : [String] = []
    for element in sequence{
        if predicate(element){
            accum.append(element)
        }
    }
    return accum
}

// MARK: - Exercise 4: longerThanFive
/// Verifica si un string tiene una longitud mayor que 5
///
/// - Parameter text: El string (`String`) a verificar
///
/// - Returns: `true` si la longitud es mayor que 5, `false` en caso contrario
///
/// Esta función está diseñada para ser usada como predicado en la función `select`
func longerThanFive(text: String) -> Bool{
    return text.count > 5
}

// MARK: - Exercise 5: startingWithVowelWordsFrom
/// Filtra un array de strings para obtener aquellos que comienzan con vocal, utilizando la función `select`
///
/// - Parameter sequence: Un array de strings (`[String]`) a filtrar
///
/// - Returns: Un array de strings (`[String]`) que comienzan con vocal
///
/// Ejemplo de uso:
/// ```swift
/// let words = ["Avión", "Casa", "Iglesia", "Mesa", "Oso"]
/// let result = startingWithVowelWordsFrom(sequence: words)
/// print(result) // Output: ["Avión", "Iglesia", "Oso"]
/// ```
func startingWithVowelWordsFrom(sequence: [String]) -> [String] {
    select(
        sequence: sequence) { current in
            let vowels : Set<Character> = ["a", "e", "i", "o", "u"]
            if let firstChar = current.first {
                let normalizedChar = firstChar.lowercased()
                return vowels.contains(normalizedChar)
            }
            return false
        }
}


// MARK: - Exercise 6: select2
/// Versión mejorada de `select` que incluye una closure de finalización
///
/// - Parameters:
///   - sequence: Un array de strings (`[String]`) a filtrar
///   - predicate: Una closure que recibe un `String` y devuelve un `Bool`
///   - completion: Una closure que se ejecuta al finalizar con el resultado del filtrado
///
/// - Returns: Un array de strings (`[String]`) que cumplen con el predicado
///
/// La función ejecuta la closure de completion con el resultado antes de retornarlo
func select2(sequence: [String],
            predicate: (String) -> Bool,
             completion: ([String]) -> Void) -> [String] {
    
    var accum : [String] = []
    for element in sequence{
        if predicate(element){
            accum.append(element)
        }
    }
    completion(accum)
    return accum
}


// MARK: - Exercise 7: wordsInUppercaseFrom
/// Filtra e imprime strings que están completamente en mayúsculas
///
/// - Parameter sequence: Un array de strings (`[String]`) a filtrar
///
/// - Returns: Un array de strings (`[String]`) que están completamente en mayúsculas
///
/// La función imprime el resultado después de 3 segundos, mostrando cada palabra
/// en minúsculas
///
/// Ejemplo de uso:
/// ```swift
/// let words = ["HOLA", "Mundo", "SWIFT", "programming"]
/// let result = wordsInUppercaseFrom(sequence: words)
/// // Después de 3 segundos imprime:
/// // Las cadenas que estaban en mayúsculas eran:
/// // hola
/// // swift
/// ```
func wordsInUppercaseFrom(sequence: [String]) -> [String] {
    select2(
        sequence: sequence,
        predicate: { $0.allSatisfy { $0.isUppercase } },
        completion: { uppercaseWords in
            // Esperar 3 segundos antes de imprimir
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                print("Las cadenas que estaban en mayúsculas eran:")
                for word in uppercaseWords {
                    print(word.lowercased()) // Imprimir en minúsculas
                }
            }
        }
    )
}



