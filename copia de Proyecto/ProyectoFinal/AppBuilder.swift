//
//  AppBuilder.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//


import UIKit

class AppBuilder {
    static func build() -> UIViewController {
        let homeViewController = HomeConfigurator.make()
        return homeViewController
    }
}
