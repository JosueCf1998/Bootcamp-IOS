//
//  InicioProtocols.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//
import Foundation

protocol InicioViewProtocol {
    func showData(_ dataInicio: [Descripcion])
}

protocol InicioInteractorProtocol {
}

protocol InicioRouterProtocol {
}

protocol CustomInicioTableViewCellDelegate:AnyObject {
    func agregarCarrito(cell: CustomInicioTableViewCell, index: Int)
    
    func agregarFavorito(cell:CustomInicioTableViewCell, index: Int)
}


