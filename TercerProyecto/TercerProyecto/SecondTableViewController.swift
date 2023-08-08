//
//  SecondTableViewController.swift
//  TercerProyecto
//
//  Created by Maximo Josue Coronel Flores on 1/12/22.
//

import UIKit

//Paso1: Crear las interface (Protocolo).

protocol NewViewControllerDelegate{
    func newViewController(_ viewController: SecondTableViewController, didCreatePerson newPerson:Person)
    //Todos los metodos/proiedades/constructores.
}

//
class SecondTableViewController: UITableViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    //Paso2: Crear la propiedad
    var delegate: NewViewControllerDelegate?
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        //Asignacion de las variables que enviaremos
        let name = nameTextField.text
        let lastname = lastNameTextField.text
        
        //validar que los datos no sean nulos ni vengan vacios.
        guard let n = name, !n.isEmpty else {return}
        guard let l = lastname, !l.isEmpty else {return}
        
        let newPerson = Person(name: n, lastname: l)
        delegate?.newViewController(self, didCreatePerson: newPerson)
        
        dismiss(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.placeholder = "Nombres"
        lastNameTextField.placeholder = "Apellidos"
    }

    

}
