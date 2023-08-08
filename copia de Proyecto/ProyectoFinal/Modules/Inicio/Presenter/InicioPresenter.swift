//
//  InicioPresenter.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

protocol InicioPresenterProtocol {
    
}

class InicioPresenter {
    var view: InicioViewProtocol?
    var router: InicioRouterProtocol?
    var interactor: InicioInteractorProtocol?
}

extension InicioPresenter: InicioPresenterProtocol {
    
}

