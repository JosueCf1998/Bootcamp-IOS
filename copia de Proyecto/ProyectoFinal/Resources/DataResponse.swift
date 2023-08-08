//
//  PetResponse.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import Foundation

struct DataResponse : Decodable {
    let codigo: String
    let titulo: String
    let subTitulo: String
    let descripcion: String
    let precio: Float
    let imagen: String
}
