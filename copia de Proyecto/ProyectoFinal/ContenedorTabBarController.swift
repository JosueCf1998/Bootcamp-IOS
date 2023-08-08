//
//  ContenedorTabBarController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 8/12/22.
//

import UIKit

class ContenedorTabBarController: UITabBarController {
    
    var listaInicio = [
        Descripcion(
            codigo: "P0001",
            titulo: "Pastel de Chocolate",
            subTitulo: "Chocale con Mani",
            descripcion: "Muy Rico1",
            precio: 40.1,
            imagen: "pastel-chocolate"
        ),
        Descripcion(
            codigo: "P0002",
            titulo: "Pastel de Fresa",
            subTitulo: "Fresa con Vainilla",
            descripcion: "Muy Rico2",
            precio: 40.2,
            imagen: "pastel-fresa"
        ),
        Descripcion(
            codigo: "P0003",
            titulo: "Pastel de Lucuma",
            subTitulo: "Lucma con Pasas",
            descripcion: "Muy Rico3",
            precio: 40.3,
            imagen: "pastel-lucuma"
        ),
        Descripcion(
            codigo: "P0004",
            titulo: "Pastel de Frutos Rojos",
            subTitulo: "Con Pecanas",
            descripcion: "Muy Rico4",
            precio: 40.4,
            imagen: "pastel-frutos-rojos"
        )
    ]
    
    var listaCarrito:[DescripcionCompra] = []
    
    var listaCupones = [
        DescripcionCupones(
            codigoCupon: "NTTDATA01",
            porcentDescuento: 10,
            imagenCupon: "cupon-10"
        ),
        DescripcionCupones(
            codigoCupon: "NTTDATA02",
            porcentDescuento: 20,
            imagenCupon: "cupon-20"
        ),
        DescripcionCupones(
            codigoCupon: "NTTDATA03",
            porcentDescuento: 30,
            imagenCupon: "cupon-30"
        ),
    ]
    
    var listaDireccionLocal = [
    DescripcionLocal(
        direccion: "Jr, Daniel Garces 404, San Juan de Miraflores",
        ubicacionImagen: "ubicacion-local")
    ]
    
    var listaRecibo = [
        DescripcionRecibo(
            codigoRecibo: 20501001,
            cantidadProductos: 2,
            costoProducto: 80.00,
            precioFinal: 80.00,
            ModoPago: "Efectivo",
            codigoUser: "USER-NTTDATA01",
            descuentoCupon: 0,
            fechaCompra: "12/15/22, 2:42 p.m."
        )
    ]
    
    var listaReciboProducto: [DescripcionReciboProducto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
