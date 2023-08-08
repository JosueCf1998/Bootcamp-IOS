//
//  HomeRouter.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import UIKit

class HomeRouter {
    var view: UIViewController?
}

extension HomeRouter: HomeRouterProtocol {
    func mostrarOtraVista() {
        let InicioConfigurator = Configurator.build()
        //let InicioConfigurator = ContenedorTabBarController()
        view?.navigationController?.pushViewController(InicioConfigurator, animated: true)
    }
}
