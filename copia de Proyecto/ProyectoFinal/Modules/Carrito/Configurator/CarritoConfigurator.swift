//
//  CarritoConfigurator.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import UIKit
class CarritoConfigurator {
    
    static func build() -> UIViewController {
        
        let presenter = CarritoPresenter()
        
        let api = DataMoksInicio()
        let interactor = CarritoInteractor(presenter: presenter, api: api)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(withIdentifier: "CarritoViewController") as! CarritoViewController
        
        let router = CarritoRouter()
        router.presenter = presenter
        router.view = view
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        view.presenter = presenter
        
        return view
        
    }
    
}

