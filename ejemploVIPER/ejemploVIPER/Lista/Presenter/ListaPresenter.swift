//
//  ListaPresenter.swift
//  ejemploVIPER
//
//  Created by Maximo Josue Coronel Flores on 8/12/22.
//

import Foundation

protocol ListaPresenterProtocol {
    func getData()
    func presentErrorView()
}

class ListaPresenter: ListaPresenterProtocol{
    
    var view: ListaViewProtocol?
    var router: ListarRouter?
    
    func getData(){
        //Se hizo muchas cosas
        view?.mostrar(4)
    }
    
    func presentErrorView(){}
}
