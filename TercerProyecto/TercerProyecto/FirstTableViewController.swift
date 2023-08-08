//
//  FirstTableViewController.swift
//  TercerProyecto
//
//  Created by Maximo Josue Coronel Flores on 1/12/22.
//

import UIKit

class FirstTableViewController: UITableViewController, UINavigationControllerDelegate{

    let people = [
        Person(name: "Josue", lastname: "Coronel"),
        Person(name: "Josue", lastname: "Coronel")
    ]

    @IBAction func addButton(_ sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell {
            
            let person = people[indexPath.row]
            cell.delegate = self
            return cell
        }
        else {
            return UITableViewCell()
        }
        */
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        
        let person  = people[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    
}

extension FirstTableViewController {
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        let destination = nav?.viewControllers.first as? SecondTableViewController
        
        //Paso3:
        destination?.delegate = self
    }
}

//Paso1: Adoptar Protocolo
extension FirstTableViewController: NewViewControllerDelegate {
    //Implementar Metodo
    func newViewController(_ viewController: SecondTableViewController, didCreatePerson newPerson: Person) {
        print(newPerson.name)
        //people.append(newPerson)
        tableView.reloadData()
    }

}
