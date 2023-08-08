//
//  InicioInteractor.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import Foundation


class InicioInteractor: InicioInteractorProtocol {
    var presenter: InicioPresenterProtocol
    
    var api: RemoteRespository?
    
    required init(presenter: InicioPresenterProtocol, api: RemoteRespository) {
        self.presenter = presenter
        self.api = api
    }
}
