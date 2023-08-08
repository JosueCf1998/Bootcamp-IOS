//
//  HomePresenter.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import Foundation

class HomePresenter {
    var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
}

extension HomePresenter: HomePresenterProtocol {
    func pasarAOtraVista() {
        router?.mostrarOtraVista()
    }
    
}
