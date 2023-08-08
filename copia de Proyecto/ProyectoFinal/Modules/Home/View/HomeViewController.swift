//
//  HomeViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?

    @IBAction func presentButton(_ sender: UIButton) {
        presenter?.pasarAOtraVista()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension HomeViewController: HomeViewProtocol {
    
}
