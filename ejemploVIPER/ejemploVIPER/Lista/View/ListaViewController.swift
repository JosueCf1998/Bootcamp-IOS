//
//  ListaViewController.swift
//  ejemploVIPER
//
//  Created by Maximo Josue Coronel Flores on 8/12/22.
//

import UIKit

protocol ListaViewProtocol {
    func mostrar(_numero:Int) 
}

class ListaViewController: UIViewController {

    var presenter:ListaPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getData()
        
        presenter?.presentErrorView()
        
    }
}

extension ListaViewController: ListaViewProtocol {
    func mostrar(_numero:Int) {
        //mostrar numero recibido
    }
}
