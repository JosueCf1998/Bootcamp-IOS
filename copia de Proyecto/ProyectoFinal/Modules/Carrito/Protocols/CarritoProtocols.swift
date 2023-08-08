//
//  CarritoProtocols.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import Foundation

protocol CarritoViewProtocol {
}

protocol CarritoInteractorProtocol {
}

protocol CarritoRouterProtocol {
}

protocol CustomComprarTableViewCellDelegate:AnyObject {
    func eliminarProducto(cell: CustomComprarTableViewCell, index: Int)
    
    func agregarProducto(cell:CustomComprarTableViewCell, index: Int)
}
