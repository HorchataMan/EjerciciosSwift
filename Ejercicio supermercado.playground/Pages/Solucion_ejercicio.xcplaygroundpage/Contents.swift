//1. Declaracion de variables

let supermarketName: String = "Supermercado Mamastrozo"
let address: String = "Ben Dover Street #69"
let operationalYears: Int = 9
let reviews: Float = 5.0
let isOpen: Bool = true

//2. Array

var inventory: [String] = ["Apples", "Bananas", "Milk", "Eggs", "Bread"]
inventory.append("Sweets")

print("There's \(inventory.count) products available!")

//3. Sets

var frequentBuyers: Set<String> = ["Wbob", "Alice", "Charlie"]
frequentBuyers.insert("Diana")
frequentBuyers.remove("Charlie")

print("Is Alice still a frequent buyer?: \(frequentBuyers.contains("Alice"))")


//4. Tuples

let weeklyOffer = (product: "FLBDSMDFR", og_price: 1000.0, discount: 15)

let discountedPrice = weeklyOffer.og_price * (Double(100 - weeklyOffer.discount)/100)

print("Weekly Offer: \(weeklyOffer.product) for just $\(discountedPrice) !!")

//5. Dictionaries

var salesRecord: [String:Int] = ["Apples":50, "Bananas":30, "Milk":20, "Eggs":10]

//Aqui tengo una duda sobre como esta planteado el problema, pero lo haré como creo de todos modos

salesRecord["Apples"]! += 5
salesRecord["Eggs"] = nil //Aqui tambien podria ser = 0, pero esta esta raro si se supone que se vendieron todos

print(salesRecord) //Normalmente por sencillez lo haria asi, pero lo hare como creo que lo quiere

for (product, quantity) in salesRecord
{
    print("\(quantity) \(product) sold!")
}
