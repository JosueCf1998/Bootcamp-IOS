//
//  MisProductosViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 15/12/22.
//

import UIKit

class MisProductosViewController: UIViewController {

    var listaPorComprar:[DescripcionCompra] = []
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.reloadData()
    }
}

extension MisProductosViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPorComprar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customMisProductos", for: indexPath) as? CustomComprarTableViewCell{
            let lista = listaPorComprar[indexPath.row]
            //cell.setup(lista: lista)
            cell.tituloLabel.text = lista.titulo
            cell.pagarLabel.text = "S/. \(String(lista.precio.redondear(numeroDeDecimales: 2)))"
            cell.cantidadLabel.text = String(lista.cantidad)
            cell.fotoImageView.image = UIImage(named: lista.imagen)
            cell.indexCell = indexPath.row
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
}
