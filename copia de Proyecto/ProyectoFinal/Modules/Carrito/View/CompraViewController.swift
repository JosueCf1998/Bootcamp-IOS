//
//  CompraViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 6/12/22.
//

import UIKit

class CarritoViewController: UIViewController{
    
    
    var presenter: CarritoPresenterProtocol?
    
    
    var listaPorComprar:[DescripcionCompra] = []
    var subTotalLabel:Double = 0.00
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pagarTotalLabel: UILabel!
    
    
    @IBAction func comprarButton(_ sender: UIButton) {
    }
    
    @IBAction func borrarTodoButton(_ sender: UIButton) {
        listaPorComprar = []
        pagarTotalLabel.text = "S/. \(subTotalLabel)"
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        pagarTotalLabel.text = "S/. \(subTotalLabel)"
        //let tabbar = tabBarController as! ContenedorTabBarController
        //listaPorComprar = tabbar.listaCarrito
        tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        //let tabbar = tabBarController as! ContenedorTabBarController
        //tabbar.listaCarrito = listaPorComprar
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarPagar" {
            let pagarViewController = segue.destination as? PagarViewController
            let listaCompra = listaPorComprar
            pagarViewController?.listaFinal.append(contentsOf: listaCompra)
            let valor = calcularTotal()
            pagarViewController?.totalPagar = valor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension CarritoViewController: CarritoViewProtocol {
    
}


extension CarritoViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPorComprar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let valor = calcularTotal()
        pagarTotalLabel.text =  "S/. \(String(valor.redondear(numeroDeDecimales: 2)))"
        //let indice = indexPath.row
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCompra", for: indexPath) as? CustomComprarTableViewCell{
            let lista = listaPorComprar[indexPath.row]
            //cell.setup(lista: lista)
            cell.tituloLabel.text = lista.titulo
            cell.pagarLabel.text = "S/. \(String(lista.precio.redondear(numeroDeDecimales: 2)))"
            cell.cantidadLabel.text = String(lista.cantidad)
            cell.fotoImageView.image = UIImage(named: lista.imagen)
            cell.indexCell = indexPath.row
            cell.delegate = self
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
}

extension CarritoViewController: CustomComprarTableViewCellDelegate{
    func agregarProducto(cell: CustomComprarTableViewCell,index: Int) {
        var cantidadResult = listaPorComprar[index].cantidad
        cantidadResult = cantidadResult + 1
        listaPorComprar[index].cantidad = cantidadResult
        let valor = calcularTotal()
        pagarTotalLabel.text =  "S/. \(String(valor))"
        tableView.reloadData()
    }
    
    func eliminarProducto(cell: CustomComprarTableViewCell, index: Int) {
        var cantidadResult = listaPorComprar[index].cantidad
        cantidadResult = cantidadResult - 1
        listaPorComprar[index].cantidad = cantidadResult
        if(cantidadResult == 0){
            listaPorComprar.remove(at: index)
        }
        let valor = calcularTotal()
        pagarTotalLabel.text =  "S/. \(String(valor))"
        tableView.reloadData()
    }
    func calcularTotal() -> Double{
        var totalPagar:Double = 0.00
        listaPorComprar.forEach { e in
            let Monto = Double(e.cantidad) * e.precio
            totalPagar = totalPagar + Monto
        }
        return totalPagar
    }
}

extension Double {
    func redondear(numeroDeDecimales: Int) -> String {
        let formateador = NumberFormatter()
        formateador.maximumFractionDigits = numeroDeDecimales
        formateador.roundingMode = .down
        return formateador.string(from: NSNumber(value: self)) ?? ""
    }
}

