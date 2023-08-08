//
//  Configurator.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import UIKit
class Configurator {
    
    static func build() -> UIViewController {
        let tabBarController = UITabBarController()
        
        let inicioViewController = InicioConfigurator.build()
        let carritoViewController = CarritoConfigurator.build()
        
        tabBarController.setViewControllers([
            inicioViewController,
            carritoViewController
        ], animated: true)

        return tabBarController
    }
    
}
