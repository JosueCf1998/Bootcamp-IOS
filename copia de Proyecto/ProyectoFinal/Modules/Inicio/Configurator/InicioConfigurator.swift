//
//  InicioConfigurator.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import UIKit
class InicioConfigurator {
    
    static func build() -> UIViewController {
        
        let presenter = InicioPresenter()
        
        let api = DataMoksInicio()
        let interactor = InicioInteractor(presenter: presenter, api: api)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(withIdentifier: "InicioViewController") as! InicioViewController
       
        let router = InicioRouter()
        router.presenter = presenter
        router.view = view
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        view.presenter = presenter
        
        return view
        
    }
    
}

