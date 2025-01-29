import Foundation

// MARK: - Exercise 1: sumAll
/// Calcula la suma de todos los elementos en un array de números enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a sumar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los elementos del array.
/// Si el array está vacío, retorna 0 ya que es el elemento neutro de la suma.
///
/// # Implementación
/// Utiliza un bucle for para iterar sobre cada elemento y mantiene un acumulador
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5]
/// let result = sumAll(sequence: numbers)
/// print(result) // Output: 15
///
/// let empty = [Int]()
/// let resultEmpty = sumAll(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumAll(_ numArray: [Int]) -> Int{
    var result = 0
    
    guard !numArray.isEmpty else {
        return result
    }
    
    for number in numArray {
        result += number
    }
    
    return result
}

func sumAllWithCondition(_ numArray: [Int], conditionFunction: (Int) -> Bool) -> Int{
    var result = 0
    
    guard !numArray.isEmpty else {
        return result
    }
    
    for number in numArray {
        if conditionFunction(number) {
            result += number
        }
    }
    
    return result
}


// MARK: - Exercise 2: multiplyAll
/// Calcula el producto de todos los elementos en un array de números enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a multiplicar
///
/// - Returns: Un entero (`Int`) que representa el producto de todos los elementos del array.
/// Si el array está vacío, retorna 1 ya que es el elemento neutro de la multiplicación.
///
/// # Implementación
/// Utiliza un bucle for para iterar sobre cada elemento y mantiene un acumulador del producto
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [2, 3, 4]
/// let result = multiplyAll(sequence: numbers)
/// print(result) // Output: 24
///
/// let empty = [Int]()
/// let resultEmpty = multiplyAll(sequence: empty)
/// print(resultEmpty) // Output: 1
/// ```
func multiplyAll(_ numArray: [Int]) -> Int {
    var result = 1
    
    guard !numArray.isEmpty else {
        return result
    }
    
    for number in numArray {
        result *= number
    }
    
    return result
}

// MARK: - Exercise 3: compress
/// Tipo alias que representa una función que combina dos enteros y produce un resultado entero. Debe llamarse IntCombiner
typealias IntCombiner = (Int, Int) -> Int

/// Reduce un array de enteros a un único valor mediante una operación de combinación especificada como último parámetro
///
/// - Parameters:
///   - sequence: Un array de enteros (`[Int]`) que se desea comprimir
///   - initialValue: El valor inicial (`Int`) que se usará como punto de partida para la combinación
///   - combinationOperation: Una función del tipo `IntCombiner` que define cómo combinar dos enteros.
///     Esta función toma dos parámetros enteros y devuelve un entero como resultado
///
/// - Returns: Un entero (`Int`) que representa el resultado de aplicar secuencialmente
///   la operación de combinación a todos los elementos del array
///
/// # Implementación
/// La función utiliza un acumulador que comienza con el valor inicial y aplica
/// la operación de combinación con cada elemento del array secuencialmente
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
///
/// // Ejemplo de suma
/// let sum = compress(sequence: numbers,
///                   initialValue: 0,
///                   combinationOperation: { $0 + $1 })
/// print(sum) // Output: 10
///
/// // Ejemplo de multiplicación
/// let product = compress(sequence: numbers,
///                       initialValue: 1,
///                       combinationOperation: { $0 * $1 })
/// print(product) // Output: 24
///
/// // Ejemplo con función nombrada
/// func max(_ a: Int, _ b: Int) -> Int { return a > b ? a : b }
/// let maximum = compress(sequence: numbers,
///                       initialValue: Int.min,
///                       combinationOperation: max)
/// print(maximum) // Output: 4
/// ```
func compress(sequence: [Int], initialValue: Int, combinationOperation: IntCombiner) -> Int {
    var result = initialValue
    
    guard !sequence.isEmpty else {
        return result
    }
    
    for number in sequence {
        result = combinationOperation(result, number)
    }
    
    return result
}

// MARK: Exercise 4: sumWithCompress
/// Calcula la suma de todos los elementos en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a sumar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los elementos del array.
/// Si el array está vacío, retorna 0 (el valor inicial)
///
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5]
/// let result = sumWithCompress(sequence: numbers)
/// print(result) // Output: 15
///
/// let empty = [Int]()
/// let resultEmpty = sumWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumWithCompress(sequence: [Int]) -> Int {
    guard !sequence.isEmpty else {
        return 0
    }
    
    return sumAll(sequence)
}


// MARK: Exercise 5: multiplyWithCompress
/// Calcula el producto de todos los elementos en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a multiplicar
///
/// - Returns: Un entero (`Int`) que representa el producto de todos los elementos del array.
/// Si el array está vacío, retorna 1 (el valor inicial, elemento neutro de la multiplicación)
///
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [2, 3, 4]
/// let result = multiplyWithCompress(sequence: numbers)
/// print(result) // Output: 24
///
/// let empty = [Int]()
/// let resultEmpty = multiplyWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 1
/// ```
func multiplyWithCompress(sequence: [Int]) -> Int {
    guard !sequence.isEmpty else {
        return 0
    }
    
    return multiplyAll(sequence)
}

// MARK: Exercise 6: sumEvenWithCompress
/// Calcula la suma de todos los números pares en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa la suma de todos los números pares del array.
/// Si el array está vacío o no contiene números pares, retorna 0
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5, 6]
/// let result = sumEvenWithCompress(sequence: numbers)
/// print(result) // Output: 12 (2 + 4 + 6)
///
/// let noEvens = [1, 3, 5, 7]
/// let resultNoEvens = sumEvenWithCompress(sequence: noEvens)
/// print(resultNoEvens) // Output: 0
///
/// let empty = [Int]()
/// let resultEmpty = sumEvenWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumEvenWithCompress(_ sequence: [Int]) -> Int {
    var result = 0
    guard !sequence.isEmpty else {
        return result
    }
    
    for number in sequence {
        if number % 2 == 0 {
            result += number
        }
    }
    
    return result
}
let numbers = [1,2,3,4,5,6]
let result1 = sumAllWithCondition(numbers) { number in
    number % 2 == 0
}
print(result1)


// MARK: Exercise 7: sumEvensSubtractOddsWithCompress
/// Calcula la diferencia entre la suma de números pares y la suma de números impares en un array de enteros
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa el resultado de sumar todos los números pares
/// y restar todos los números impares del array. Si el array está vacío, retorna 0
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
/// let result = sumEvensSubtractOddsWithCompress(sequence: numbers)
/// print(result) // Output: 2 ((2 + 4) - (1 + 3))
///
/// let onlyEvens = [2, 4, 6]
/// let resultEvens = sumEvensSubtractOddsWithCompress(sequence: onlyEvens)
/// print(resultEvens) // Output: 12
///
/// let onlyOdds = [1, 3, 5]
/// let resultOdds = sumEvensSubtractOddsWithCompress(sequence: onlyOdds)
/// print(resultOdds) // Output: -9
///
/// let empty = [Int]()
/// let resultEmpty = sumEvensSubtractOddsWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func sumEvensSubtractOddsWithCompress(_ sequence: [Int]) -> Int {
    var result = 0
    guard !sequence.isEmpty else {
        return result
    }
    
    for number in sequence {
        if number % 2 == 0 {
            result += number
        }
        else {
            result -= number
        }
    }
    
    return result
}


// MARK: Exercise 8: maxElementWithCompress
/// Encuentra el elemento más grande en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa el valor máximo encontrado en el array.
/// Si el array está vacío, retorna `Int.min` (el valor mínimo posible para un Int)
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 5, 2, 8, 3]
/// let result = maxElementWithCompress(sequence: numbers)
/// print(result) // Output: 8
///
/// let negatives = [-5, -2, -8, -1]
/// let resultNeg = maxElementWithCompress(sequence: negatives)
/// print(resultNeg) // Output: -1
///
/// let empty = [Int]()
/// let resultEmpty = maxElementWithCompress(sequence: empty)
/// print(resultEmpty) // Output: Int.min
///
/// let singleElement = [42]
/// let resultSingle = maxElementWithCompress(sequence: singleElement)
/// print(resultSingle) // Output: 42
/// ```
func maxElementWithCompress(_ sequence: [Int]) -> Int {
    guard let result = sequence.max() else {
        return Int.min
    }
    
    return result
}


// MARK: Exercise 9: minElementWithCompress
/// Encuentra el elemento más pequeño en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa el valor mínimo encontrado en el array.
/// Si el array está vacío, retorna `Int.max` (el valor máximo posible para un Int)
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [3, 1, 5, 2, 8]
/// let result = minElementWithCompress(sequence: numbers)
/// print(result) // Output: 1
///
/// let negatives = [-5, -2, -8, -1]
/// let resultNeg = minElementWithCompress(sequence: negatives)
/// print(resultNeg) // Output: -8
///
/// let empty = [Int]()
/// let resultEmpty = minElementWithCompress(sequence: empty)
/// print(resultEmpty) // Output: Int.max
///
/// let singleElement = [42]
/// let resultSingle = minElementWithCompress(sequence: singleElement)
/// print(resultSingle) // Output: 42
/// ```
func minElementWithCompress(_ sequence: [Int]) -> Int {
    guard let result = sequence.min() else {
        return Int.max
    }
    
    return result
}



// MARK: - Exercise 10: positiveNumbersCountWithCompress
/// Cuenta la cantidad de números positivos en un array de enteros utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un entero (`Int`) que representa la cantidad de números positivos (mayores que 0)
/// encontrados en el array. Si el array está vacío, retorna 0
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [-1, 0, 3, -4, 5, 6]
/// let result = positiveNumbersCountWithCompress(sequence: numbers)
/// print(result) // Output: 3 (cuenta 3, 5, 6)
///
/// let allNegative = [-1, -2, -3]
/// let resultNeg = positiveNumbersCountWithCompress(sequence: allNegative)
/// print(resultNeg) // Output: 0
///
/// let withZero = [0, 0, 0]
/// let resultZero = positiveNumbersCountWithCompress(sequence: withZero)
/// print(resultZero) // Output: 0 (el cero no se considera positivo)
///
/// let empty = [Int]()
/// let resultEmpty = positiveNumbersCountWithCompress(sequence: empty)
/// print(resultEmpty) // Output: 0
/// ```
func positiveNumbresWithCompress(_ sequence: [Int]) -> Int {
    var count = 0
    guard !sequence.isEmpty else {
        return count
    }
    
    for number in sequence {
        if number > 0 {
            count += 1
        }
    }
    
    return count
}



// MARK: - Exercise 11: allEvensWithCompress
/// Verifica si todos los números en un array de enteros son pares utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un booleano (`Bool`) que indica:
///   - `true` si todos los números en el array son pares
///   - `false` si hay al menos un número impar o si el array está vacío
///
/// La función funciona contando los números pares y comparando este contador
/// con el tamaño total del array. Si son iguales, significa que todos son pares.
///
/// Ejemplo de uso:
/// ```swift
/// let allEven = [2, 4, 6, 8]
/// let result1 = allEvensWithCompress(sequence: allEven)
/// print(result1) // Output: true
///
/// let someOdd = [2, 4, 5, 6]
/// let result2 = allEvensWithCompress(sequence: someOdd)
/// print(result2) // Output: false
///
/// let empty = [Int]()
/// let result3 = allEvensWithCompress(sequence: empty)
/// print(result3) // Output: false
///
/// let singleOdd = [3]
/// let result4 = allEvensWithCompress(sequence: singleOdd)
/// print(result4) // Output: false
///
/// let singleEven = [2]
/// let result5 = allEvensWithCompress(sequence: singleEven)
/// print(result5) // Output: true
/// ```
func allEvenWithCompress(_ sequence: [Int]) -> Bool {
    var result = true
    
    guard !sequence.isEmpty else {
        result = false
        return result
    }
    
    for number in sequence {
        if number % 2 != 0 {
            result = false
            break
        }
    }
    
    return result
}



// MARK: - Exercise 12: allMultiplesOfThreeWithCompress
/// Verifica si todos los números en un array de enteros son múltiplos de 3 utilizando la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Un booleano (`Bool`) que indica:
///   - `true` si todos los números en el array son múltiplos de 3
///   - `false` si hay al menos un número que no es múltiplo de 3 o si el array está vacío
///
/// La función funciona contando los números que son múltiplos de 3 y comparando este contador
/// con el tamaño total del array. Si son iguales, significa que todos son múltiplos de 3.
///
/// Ejemplo de uso:
/// ```swift
/// let allMultiples = [3, 6, 9, 12]
/// let result1 = allMultiplesOfThreeWithCompress(sequence: allMultiples)
/// print(result1) // Output: true
///
/// let someNotMultiples = [3, 6, 7, 9]
/// let result2 = allMultiplesOfThreeWithCompress(sequence: someNotMultiples)
/// print(result2) // Output: false
///
/// let empty = [Int]()
/// let result3 = allMultiplesOfThreeWithCompress(sequence: empty)
/// print(result3) // Output: false
///
/// let singleNotMultiple = [4]
/// let result4 = allMultiplesOfThreeWithCompress(sequence: singleNotMultiple)
/// print(result4) // Output: false
///
/// let singleMultiple = [6]
/// let result5 = allMultiplesOfThreeWithCompress(sequence: singleMultiple)
/// print(result5) // Output: true
/// ```
func allMultiplesOfThreeWithCompress(_ sequence: [Int]) -> Bool {
    var result = true
    
    guard !sequence.isEmpty else {
        result = false
        return result
    }
    
    for number in sequence {
        if number % 3 != 0 {
            result = false
            break
        }
    }
    
    return result
}



// MARK: - Exercise 13: sumAllEvensAndOddsWithCompress
/// Calcula simultáneamente la suma de los números pares e impares en un array de enteros
/// utilizando dos llamadas a la función `compress`
///
/// - Parameter sequence: Un array de enteros (`[Int]`) que contiene los números a evaluar
///
/// - Returns: Una tupla de dos enteros donde:
///   - `evens`: La suma de todos los números pares
///   - `odds`: La suma de todos los números impares
///   Si el array está vacío, retorna (0, 0)
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4, 5, 6]
/// let result = sumAllEvensAndOddsWithCompress(sequence: numbers)
/// print(result.evens) // Output: 12 (2 + 4 + 6)
/// print(result.odds)  // Output: 9 (1 + 3 + 5)
///
/// let onlyEvens = [2, 4, 6]
/// let resultEvens = sumAllEvensAndOddsWithCompress(sequence: onlyEvens)
/// print(resultEvens) // Output: (evens: 12, odds: 0)
///
/// let onlyOdds = [1, 3, 5]
/// let resultOdds = sumAllEvensAndOddsWithCompress(sequence: onlyOdds)
/// print(resultOdds) // Output: (evens: 0, odds: 9)
///
/// let empty = [Int]()
/// let resultEmpty = sumAllEvensAndOddsWithCompress(sequence: empty)
/// print(resultEmpty) // Output: (evens: 0, odds: 0)
/// ```
func sumAllEvensAndOddsWithCompress(_ sequence: [Int]) -> (evens: Int, odds: Int) {
    var evens = 0
    var odds = 0
    guard !sequence.isEmpty else {
        return (evens, odds)
    }
    
    for number in sequence {
        if number % 2 == 0 {
            evens += number
        }
        else {
            odds += number
        }
    }
    
    return (evens, odds)
}


// MARK: - Exercise 14: compress without initial value
/// Modificación de la función compress sin valor inicial que combina los elementos de un array de enteros usando una operación específica
///
/// - Parameters:
///   - sequence: Un array de enteros (`[Int]`) que contiene los números a combinar
///   - combinationOperation: Una función que toma dos enteros y retorna un entero,
///     definiendo cómo se combinarán los elementos
///
/// - Returns: Un entero opcional (`Int?`) que representa:
///   - El resultado de combinar todos los elementos según la operación especificada
///   - `nil` si el array está vacío
///
/// - Warning: Esta versión de `compress` difiere de la original en que no requiere un valor inicial
///
/// Ejemplo de uso:
/// ```swift
/// let numbers = [1, 2, 3, 4]
///
/// // Suma todos los elementos
/// let sum = compress(sequence: numbers) { $0 + $1 }
/// print(sum) // Output: Optional(10)
///
/// // Encuentra el máximo
/// let maximum = compress(sequence: numbers) { max($0, $1) }
/// print(maximum) // Output: Optional(4)
///
/// // Multiplica todos los elementos
/// let product = compress(sequence: numbers) { $0 * $1 }
/// print(product) // Output: Optional(24)
///
/// let empty = [Int]()
/// let resultEmpty = compress(sequence: empty) { $0 + $1 }
/// print(resultEmpty) // Output: nil
///
/// let singleElement = [5]
/// let resultSingle = compress(sequence: singleElement) { $0 + $1 }
/// print(resultSingle) // Output: Optional(5)
/// ```
func compressFinal(_ sequence: [Int], combinationOperation: IntCombiner) -> Int? {
    
    
    guard !sequence.isEmpty else {
        return nil
    }
    var result = sequence[0]
    
    for number in sequence[1...sequence.count-1] {
        result = combinationOperation(result, number)
    }
    
    return result
}

let singleElement = [1,2,3,4,7]
let resultSingle: Int? = compressFinal(singleElement) { $0 + $1}
print(resultSingle)
