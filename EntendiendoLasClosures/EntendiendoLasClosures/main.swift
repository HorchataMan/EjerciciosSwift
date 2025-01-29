//
//  main.swift
//  EntendiendoLasClosures
//
//  Created by Ismael Sabri Pérez on 28/1/25.
//

import Foundation

// La condición para que los estudiantes puedan formar parte del curso es que sean mayores de edad. Sin embargo, esto lo ha decidido el centro después de que se escribiesen los structs Course y Student.

// Añadir aquí a un estudiante llamado "Ismael" con 24 años al curso. Debe cumplir la condición
func main() {
    var course = Course(students: [])
    
    let isma = Student(name: "Isma", age: 30)
    
    course.addStudent(isma) { student in
        return student.age > 18
    }
}

main()
