//
//  CarritoEntity.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import Foundation

struct DescripcionCompra{
    let codigo: String
    let titulo: String
    let precio: Double
    let imagen: String
    var cantidad: Int
}

struct DescripcionCupones{
    let codigoCupon:String
    let porcentDescuento: Int
    let imagenCupon: String
}

struct DescripcionLocal {
    let direccion:String
    let ubicacionImagen: String
}

struct DescripcionRecibo {
    let codigoRecibo:Int
    let cantidadProductos: Int
    let costoProducto:Double
    let precioFinal: Double
    let ModoPago:String
    let codigoUser: String
    let descuentoCupon: Int
    let fechaCompra: String
}

struct DescripcionReciboProducto {
    let codigoRecibo:String
    let codigoProducto: String
    let cantidad: Int
    let precioProducto: Double
}
