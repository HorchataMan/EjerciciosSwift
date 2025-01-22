
/// Concatena múltiples cadenas usando un separador opcional y permite invertir el orden si se requiere.
///
/// - parameters:
///   - strings: un array de cadenas a combinar (`String`).
///   - separator: un separador opcional que se colocará entre las cadenas. el valor por defecto es `" "`.
///   - shouldReverse: un booleano que indica si el orden de las cadenas pasadas como parámetro deben invertirse antes de ser concatenadas. El valor por defecto es `false`.
///
/// - returns: una sola cadena que combina las cadenas separadas por el separador indicado.
///
/// - note: las cadenas vacías no se incluirán en el resultado final.
///
/// Ejemplo de uso:
/// ```swift
/// let resultado = concatenateStrings(["Swift", "es", "genial"], withSeparator: "-", andReverse: true)
/// print(resultado) // salida: genial-es-Swift
/// ```
func concatenateStrings(_ strings: [String], withSeparator separator: String = " ", shouldReverse: Bool = false) -> String
{
    var result = ""
    
    if !shouldReverse
    {
        for word in strings
        {
            result += word + separator
        }
    }
    else
    {
        for word in strings.reversed()
        {
            result += word + separator
        }
    }
    
    return result
}

let resultado = concatenateStrings(["Swift", "es", "genial"], withSeparator: "-", shouldReverse: true)
print(resultado) // salida: genial-es-Swift


/// Genera un saludo basado en la hora del día y el nombre del usuario.
///
/// - parameters:
///   - name: el nombre del usuario al cual se desea saludar (`String`).
///   - hour: la hora actual, utilizando el formato de 24 horas (`Int`).
///
/// - returns: un saludo personalizado dependiendo de la hora del día. Si la hora no está entre 0 y 23, se retorna un saludo genérico.
///
/// - note: esta función considera las siguientes franjas horarias:
///   * 0 a 11: "Buenos días"
///   * 12 a 17: "Buenas tardes"
///   * 18 a 23: "Buenas noches"
///
/// Ejemplo de uso:
/// ```swift
/// let saludo = generateGreeting(forName: "Ana", atHour: 15)
/// print(saludo) // salida: Buenas tardes, Ana
/// ```
func generateGreeting(forName: String, atHour: Int) -> String
{
    var result = ""
    
    switch atHour {
    case 0...11:
        result = "Buenos dias, \(forName)"
    case 12...17:
        result = "Buenas tardes, \(forName)"
    case 18...23:
        result = "Buenas noches, \(forName)"
    default:
        result = "Buen dia!"
    }
    
    return result
}

let saludo = generateGreeting(forName: "Ana", atHour: 15)
print(saludo) // salida: Buenas tardes, Ana

/// Representa las franjas horarias del día como un enumerado.


/// Genera un saludo basado en la hora del día y el nombre del usuario.
///
/// - parameters:
///   - name: el nombre del usuario al cual se desea saludar (`String`).
///   - hour: la hora actual, utilizando el formato de 24 horas (`Int`).
///
/// - returns: un saludo personalizado dependiendo de la franja horaria. Si la hora no está entre 0 y 23, se retorna un saludo genérico.
///
/// - note: utiliza un `enum` para representar las franjas del día:
///   * `.Morning`: 0 a 11 ("Buenos días")
///   * `.Afternoon`: 12 a 17 ("Buenas tardes")
///   * `.Evening`: 18 a 23 ("Buenas noches")
///   * `.Invalid`: cualquier hora fuera del rango 0-23.
///
/// Ejemplo de uso:
/// ```swift
/// let saludo = generateGreetingWithEnum(forName: "Carlos", atHour: 19)
/// print(saludo) // salida: Buenas noches, Carlos
/// ```
func generateGreetingWithEnum(forName: String, atHour: Int) -> String
{
    var result = ""
    
    switch atHour {
    case 0...11:
        result = "\(TimeOfDay.Morning.rawValue), \(forName)"
    case 12...17:
        result = "\(TimeOfDay.Afternoon.rawValue), \(forName)"
    case 18...23:
        result = "\(TimeOfDay.Evening.rawValue), \(forName)"
    default:
        result = "\(TimeOfDay.Invalid.rawValue)!"
    }
    
    return result
}

let saludo2 = generateGreetingWithEnum(forName: "Carlos", atHour: 19)
print(saludo2) // salida: Buenas noches, Carlos

enum TimeOfDay: String
{
    case Morning = "Buenos dias"
    case Afternoon = "Buenas tardes"
    case Evening = "Buenas noches"
    case Invalid = "Buen dia"
}


/// Convierte un valor monetario de una moneda a otra utilizando una tasa de cambio específica.
///
/// - parameters:
///   - amount: el valor monetario que se desea convertir (`Double`).
///   - sourceCurrency: el código de 3 letras que representa la moneda de origen (`String`).
///   - targetCurrency: el código de 3 letras que representa la moneda destino (`String`).
///   - exchangeRate: la tasa de cambio que se utilizará para realizar la conversión (`Double`).
///
/// - returns: una cadena con el valor convertido y las monedas involucradas. Si la tasa de cambio es inválida (menor o igual a 0), se devuelve un mensaje de error.
///
/// - note: el valor convertido se calcula multiplicando el monto por la tasa de cambio.
///
/// Ejemplo de uso:
/// ```swift
/// let conversion = convertCurrency(100, from: "USD", to: "EUR", withRate: 0.85)
/// print(conversion) // salida: 100.0 USD es equivalente a 85.0 EUR
/// ```
///
/// Ejemplo de error:
/// ```swift
/// let conversion = convertCurrency(100, from: "USD", to: "EUR", withRate: -0.1)
/// print(conversion) // salida: Error: la tasa de cambio debe ser mayor que 0.
/// ```
///
func convertCurrency(_ amount: Double, from: String, to: String, withRate: Double) -> String
{
    guard withRate > 0 else
    {
        return "La tasa de cambio debe ser mayor a 0"
        
    }
    
    return "\(amount) \(from) es equivalente a \(amount*withRate) \(to)"
    
}

let conversion = convertCurrency(100, from: "USD", to: "EUR", withRate: 0.85)
print(conversion) // salida: 100.0 USD es equivalente a 85.0 EUR

/// Calcula el precio total de una compra y aplica un descuento opcional.
///
/// - parameters:
///   - prices: un array de precios de productos (`Double`) para calcular el total.
///   - discount: un porcentaje de descuento opcional que se aplicará sobre el precio total. El valor por defecto es `0`.
///   - shouldLog: un booleano que indica si se debe imprimir el detalle del cálculo en la consola. El valor por defecto es `false`.
///
/// - returns: una tupla con:
///   * `total`: el precio total antes del descuento.
///   * `discountedTotal`: el precio final después de aplicar el descuento.
///
/// - note: si el descuento es mayor al 100%, el precio resultante será negativo.
/// - important: es recomendable pasar precios positivos, ya que los valores negativos no serán válidos.
///
/// Ejemplo de uso:
/// ```swift
/// let compra = calculateTotalPrice(for: [50.0, 60.0], withDiscount: 20, shouldLog: true)
/// print("Total: \(compra.total), Total con descuento: \(compra.discountedTotal)")
/// ```
///
/// Output esperado para el ejemplo anterior:
/// ```
/// Calculando compra: [50.0, 60.0]
/// Descuento aplicado: 20.0%
/// Precio total: 110.0
/// Precio con descuento: 88.0
/// Total: 110.0, Total con descuento: 88.0
/// ```
func calculateTotalPrice(for prices: [Double], withDiscount: Double = 0, shouldLog: Bool = false ) -> (total:Double, discountedTotal: Double)
{
    var sum: Double = 0
    
    for price in prices
    {
        sum += price
    }
    
    let discountedSum = sum * (1 - (withDiscount/100))
    
    if shouldLog
    {
        print("Calculando compra: \(prices)")
        print("Descuento aplicado: \(withDiscount)%")
        print("Precio total: \(sum)")
        print("Precio con descuento: \(discountedSum)")
    }
    
    return (total: sum, discountedTotal: discountedSum)
}

let compra = calculateTotalPrice(for: [50.0, 60.0], withDiscount: 20, shouldLog: true)
print("Total: \(compra.total), Total con descuento: \(compra.discountedTotal)")
