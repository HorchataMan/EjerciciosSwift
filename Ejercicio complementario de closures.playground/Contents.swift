import Cocoa
import Foundation

/*
Ejercicio: Simulación de Proceso de Entrega de Ordenes

Objetivo:
Implementar un sistema que simula el flujo de trabajo de un restaurante para procesar y entregar órdenes utilizando Structs y Closures. Varias entidades (Camarero, Cocinero y Repartidor) interactúan en este sistema y transicionan entre diferentes etapas (preparación y entrega) usando retardos para simular el tiempo requerido para cada operación.

Requisitos:
1. Crear una estructura `Orden` que represente un pedido con propiedades para un identificador único y una descripción de la orden.
2. Implementar un `Camarero`que tiene que hacer el pedido. Se supone que es inmediato
2. Implementar un `Cocinero` que tiene la responsabilidad de preparar pedidos. Cada pedido tarda 5 segundos en completarse
3. Implementar un `Repartidor` que maneja la entrega de pedidos. El repartidor tarda 3 segundos en llevar el pedido
4. Probar el flujo completo con al menos una orden, asegurando que las operaciones de preparación y entrega se ejecutan coherentemente.
5. Cada vez que uno de los trabajadores, sea camarero, cocinero o repartidor, ejecuta su acción, debe imprimirse un mensaje por pantalla. Por ejemplo:

 El camarero hace el pedido Pizza Margherita.
 Cocinero está preparando el pedido Pizza Margherita.
 El pedido Pizza Margherita está listo.
 Repartidor ha recogido el pedido Pizza Margherita.
 El pedido Pizza Margherita ha sido entregado.
 Proceso completado para el pedido: Pizza Margherita
 
Instrucciones:
1. Usa los structs `Orden`, `Camarero`, `Cocinero` y `Repartidor` para modelar el sistema.
*/
struct Order {
    let id: Int
    let description: String
    
    init(id: Int, description: String) {
        self.id = id
        self.description = description
    }
    
}

struct Waiter {
    var orders: [Order] = []
    
    mutating func takeOrder(id: Int, description: String) -> Order{
        let newOrder = Order(id: id, description: description)
        print("Waiter just took the order. id: \(newOrder.id) description: \(newOrder.description)")
        orders.append(newOrder)
        return newOrder
    }
    
    func passOrders() -> [Order] {
        return orders
    }
    
    
}

struct Cook {
    
    func prepareOrder(order: Order) -> Order{
        print("Se esta preparando la orden \(order.id), que consiste en: \(order.description)")
        sleep(5)
        return order
    }
    
    func prepareOrders(orders: [Order]) {
        for order in orders {
            prepareOrder(order: order)
        }
        return
    }
}

struct DeliveryBoy {
    func deliverOrder(order: Order) {
        sleep(3)
        print("Se ha entregado la orden \(order.id), orden: \(order.description)")
    }
}

var waiter = Waiter()

waiter.takeOrder(id: 1, description: "Pito con sal jsjsj")

let cook = Cook()
let deliveryGuy = DeliveryBoy()

deliveryGuy.deliverOrder(order: cook.prepareOrder(order: waiter.passOrders()[0]))

print("Esto era la version vieja ^")

struct WaiterRemaster {
    func takeOrder(id: Int, descripcion: String, onComplete: @escaping (Order) -> Void) {
        let newOrder = Order(id: id, description: descripcion)
        print("Se ha pedido \(newOrder.description) con id: \(newOrder.id)")
        onComplete(newOrder)
        print("El repartidor se fue a mamar pito")
    }
}

struct CookRemaster {
    func prepareOrder(order: Order, onComplete: @escaping (Order) -> Void) {
        print("Se está preparando la orden \(order.id), descripcion: \(order.description)")
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            print("Se terminó de preparar la orden \(order.id), descripcion: \(order.description)")
            onComplete(order)
        }
        
    }
}

struct DeliveryBoyRemaster {
    func deliverOrder(order: Order, onComplete: @escaping (Order) -> Void) {
        print("Se recogió la order \(order.id), descripcion: \(order.description)")
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            print("Se ha entregado la orden \(order.id), descripcion: \(order.description)")
            onComplete(order)
        }
    }
}

let camarero = WaiterRemaster()
let cocinero = CookRemaster()
let repartidor = DeliveryBoyRemaster()

camarero.takeOrder(id: 1, descripcion: "Pizza margarita") {
    cocinero.prepareOrder(order: $0) {
        repartidor.deliverOrder(order: $0) {
            print("Se ha completado la orden \($0.description)")
        }
    }
}
