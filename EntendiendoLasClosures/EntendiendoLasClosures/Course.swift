//
//  Course.swift
//  EntendiendoLasClosures
//
//  Created by Ismael Sabri Pérez on 28/1/25.
//

import Foundation

struct Course {
    var students: [Student]
    
    // Función para añadir al estudiante al curso. El centro no ha decidido aún las condiciones que deben cumplir los estudiantes para formar parte del curso, por lo que lo dirán más adelante.
    
    mutating func addStudent(_ student: Student, _ conditionToAdd: (Student) -> Bool) {
        
        if conditionToAdd(student) {
            students.append(student)
        }
        
    }
}
