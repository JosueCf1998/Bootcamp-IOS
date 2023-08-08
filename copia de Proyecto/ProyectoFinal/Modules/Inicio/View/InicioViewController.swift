//
//  InicioViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 6/12/22.
//

import UIKit

class InicioViewController: UIViewController{
    
    
    var presenter: InicioPresenterProtocol?
    
    private var dataInicio: [Descripcion]?
    var listaInicio:[Descripcion] = []
    
    var listaFavorito:[Descripcion] = []
    var listaCarrito:[DescripcionCompra] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewWillDisappear(_ animated: Bool) {
        //let tabbar = tabBarController as! ContenedorTabBarController
        //tabbar.listaCarrito = listaCarrito
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //let tabbar = tabBarController as! ContenedorTabBarController
        //listaCarrito = tabbar.listaCarrito
        //listaInicio = tabbar.listaInicio
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension InicioViewController: InicioViewProtocol {
    func showData(_ dataInicio: [Descripcion]) {
        self.dataInicio = dataInicio
        tableView.reloadData()
    }
    
    
}

extension InicioViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaInicio.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as? CustomInicioTableViewCell{
            let lista = listaInicio[indexPath.row]
            //cell.setup(lista: lista)
            cell.tituloLabel.text = lista.titulo
            cell.subtituloLabel.text = lista.subTitulo
            cell.precioLabel.text = String(lista.precio)
            cell.fotoImageView?.image = UIImage(named: lista.imagen)
            
            cell.indexCell = indexPath.row
            cell.delegate = self
            return cell
        }else{
            return UITableViewCell()
        }

    }
}

extension InicioViewController: CustomInicioTableViewCellDelegate{
    func agregarFavorito(cell: CustomInicioTableViewCell,index: Int) {
        tableView.reloadData()
    }
    
    func agregarCarrito(cell: CustomInicioTableViewCell, index: Int) {
        let lista = listaInicio[index]
        if(listaCarrito.count > 0){
            var i = 0
            var val = 0
            listaCarrito.forEach { e in
                if(e.codigo == lista.codigo){
                    let cantidad = e.cantidad
                    listaCarrito[i].cantidad = cantidad + 1
                    val = 1
                }
                i=i+1
            }
        
            if val == 0 {
                let listaTemp = [DescripcionCompra(codigo: lista.codigo,titulo: lista.titulo, precio: Double(lista.precio), imagen: lista.imagen, cantidad: 1
                                                  )
                ]
                listaCarrito += listaTemp
            }
        }else {
            let listaTemp = [DescripcionCompra(codigo: lista.codigo,titulo: lista.titulo, precio: Double(lista.precio), imagen: lista.imagen, cantidad: 1
            )
            ]
            listaCarrito += listaTemp
        }
        tableView.reloadData()
    }
}
