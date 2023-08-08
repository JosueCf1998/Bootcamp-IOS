//
//  CarritoInteractor.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import Foundation


class CarritoInteractor: CarritoInteractorProtocol {
    var presenter: CarritoPresenterProtocol
    
    var api: RemoteRespository?
    
    required init(presenter: CarritoPresenterProtocol, api: RemoteRespository) {
        self.presenter = presenter
        self.api = api
    }
}

