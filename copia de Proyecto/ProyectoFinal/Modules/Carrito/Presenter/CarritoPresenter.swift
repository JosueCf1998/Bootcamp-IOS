//
//  CarritoPresenter.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import Foundation

protocol CarritoPresenterProtocol {
    
}

class CarritoPresenter {
    var view: CarritoViewProtocol?
    var router: CarritoRouterProtocol?
    var interactor: CarritoInteractorProtocol?
}

extension CarritoPresenter: CarritoPresenterProtocol {
    
}
