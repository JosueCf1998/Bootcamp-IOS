//
//  PagarViewController.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 8/12/22.
//

import UIKit

class PagarViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPagarLabel: UILabel!

    var listaFinal:[DescripcionCompra] = []
    var listaCupones:[DescripcionCupones] = []
    var listaDireccion:[DescripcionLocal] = []
    
    var listaRecibo: [DescripcionRecibo] = []
    var listaReciboProducto: [DescripcionReciboProducto] = []
    
    var totalPagar:Double = 0.00
    var totalPagarDescuento:Double = 0.00
    var tipoPago: Int = 0
    var codigoCupon: String = ""
    
    var codigoUser: String = "USER-NTTDATA02"
    var cantidadProducto: Int = 0
    var costoProducto: Double = 0.00
    var cuponProducto:String = "No"
    var descuentoProducto:Int = 0
    var metodoPago:String = "Efectivo"
    
    
    @IBAction func hacerPedidoButton(_ sender: UIButton) {
        //let customImage =  CustomPagarTableViewCell()
        if(listaFinal.count == 0){
            mostrarAlerta(title: "No hay productos ingresados!", message: "Agregue productos para generar un ticket de venta")
            return
        }
        let now = Date()
        let dtFormatter = DateFormatter()
        dtFormatter.dateStyle = .short
        dtFormatter.timeStyle = .short
        let fechaCompra = dtFormatter.string(from: now)
        
        let listaRec = ContenedorTabBarController()
        listaRecibo = listaRec.listaRecibo
        
        var nuevoRecibo = listaRecibo[0].codigoRecibo
        var i = 0
        listaRecibo.forEach { e in
            if (listaRecibo[i].codigoRecibo >= nuevoRecibo) {
                nuevoRecibo = listaRecibo[i].codigoRecibo + 1
            }
            i += 1
        }
        listaRecibo.append(
            DescripcionRecibo(
                codigoRecibo: nuevoRecibo,
                cantidadProductos: cantidadProducto,
                costoProducto: costoProducto,
                precioFinal: totalPagarDescuento,
                ModoPago: metodoPago,
                codigoUser: codigoUser,
                descuentoCupon: descuentoProducto,
                fechaCompra: fechaCompra
            )
        )
        guard let detalleViewController = storyboard?.instantiateViewController(withIdentifier: "ReciboPagadoViewController") as? ReciboPagadoViewController else {return}
        detalleViewController.modalPresentationStyle = .fullScreen
        detalleViewController.numeroRecibo = nuevoRecibo
        present(detalleViewController, animated: true)
        
        listaRec.listaRecibo = listaRecibo
        print(listaRecibo)
    }
    
    @IBAction func metodoPagoSegmentedControl(_ sender: UISegmentedControl) {
    }
    
    @IBAction func verProductosButton(_ sender: UIButton) {
        let misProductosViewController = MisProductosViewController()
        misProductosViewController.listaPorComprar = listaFinal
        //present(misProductosViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        totalPagarDescuento = totalPagar
        totalPagarLabel.text = "S/. \(String(totalPagar.redondear(numeroDeDecimales: 2)))"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarProductos" {
            let pagarViewController = segue.destination as? MisProductosViewController
            pagarViewController?.listaPorComprar = listaFinal
        }
    }
    
}

extension PagarViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tabbar = ContenedorTabBarController()
        listaDireccion = tabbar.listaDireccionLocal
        cantidadProducto = 0
        listaFinal.forEach { e in
            cantidadProducto += e.cantidad
        }
        costoProducto = totalPagar
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customPagar", for: indexPath) as? CustomPagarTableViewCell{
            cell.direccionLabel.text = listaDireccion[0].direccion
            cell.imagenDireccionImageView.image = UIImage(named: listaDireccion[0].ubicacionImagen)
            cell.codigoCuponTextField.text = codigoCupon
            
            cell.costoProductoLabel.text = "S/. \(String(costoProducto.redondear(numeroDeDecimales: 2)))"
            cell.cantidadProductoLabel.text = String(cantidadProducto)
            cell.cuponProductoLabel.text = cuponProducto
            cell.descuentoProductoLabel.text = "\(descuentoProducto) %"
            cell.metodoPagoLabel.text = metodoPago
            
//            cell.indexCell = indexPath.row
            cell.delegate = self
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
}

extension PagarViewController {
    func mostrarAlerta(title: String, message: String) {
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let guiaOk = UIAlertAction(title: "Ok", style: .default) //{ (action) in icon.tintColor = .red}
        
        /*let cancelar = UIAlertAction(title: "Cancelar", style: .default, handler: {(action) in self.totalPagarLabel.text  = "" })
        */
        
        alertaGuia.addAction(guiaOk)
        //alertaGuia.addAction(cancelar)
        present(alertaGuia, animated: true, completion: nil)

    }
}

extension PagarViewController: CustomPagarTableViewCellDelegate {
    func customPagarTableView(_ tableViewCell: CustomPagarTableViewCell, didValidate isValid: Bool, icon: UIImageView) {
        var val:Int = 0
        let tab = tableViewCell
        let codigo = tab.codigoCuponTextField.text
        if(codigo == ""){
            mostrarAlerta(title: "Código Vacio!", message: "Ingrese un código de cupón")
            return
        }
        
        let tabbar = ContenedorTabBarController()
        listaCupones = tabbar.listaCupones
        listaCupones.forEach { e in
            if(e.codigoCupon == codigo) {
                val = 1
                icon.tintColor = .green
                icon.image = UIImage(systemName: "checkmark.circle.fill")
                cuponProducto = "Si"
                descuentoProducto = e.porcentDescuento
                codigoCupon = e.codigoCupon
                
                totalPagarDescuento = totalPagar - ((Double(descuentoProducto) * 0.01) * totalPagar)
                totalPagarLabel.text = "S/. \(String(totalPagarDescuento.redondear(numeroDeDecimales: 2)))"
                tab.codigoCuponTextField.isUserInteractionEnabled = false
                tableView.reloadData()
            }
        }
        if(val == 0){
            mostrarAlerta(title: "Código Incorrecto!", message: "Ingrese un código de cupón valido")
            return
        }
    }
}

