import Cocoa

/*
 
Declara variables y constantes que almacenen la información de un estudiante (nombre, edad, promedio de notas, inscripción).
Calcula y almacena el nuevo promedio del curso sumando un nuevo examen (por ejemplo, 90) a la lista de promedios existentes.
Crea un mensaje que combine el nombre del estudiante, su edad y su nuevo promedio.
Declara una variable para indicar si el estudiante cumplió o no con el requisito mínimo de promedio (por ejemplo, 75).
Crea un mensaje final que indique si el estudiante está "Aprobado" o "Suspenso" basado en el promedio.
 */


let name = "Jan"

let age = 25

let grades = [100, 90, 70, 75, 100]

var sum = 0
for grade in grades
{
    sum += grade
}



let average = sum / grades.count

let hasPassed = average > 75

let message = "Student: \(name), age: \(age), average: \(average), passed?: \(hasPassed)"

print(message)
