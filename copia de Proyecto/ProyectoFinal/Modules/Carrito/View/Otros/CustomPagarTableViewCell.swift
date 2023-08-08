//
//  CustomPagarTableViewCell.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 12/12/22.
//

import UIKit

protocol CustomPagarTableViewCellDelegate {
    func customPagarTableView(_ tableViewCell: CustomPagarTableViewCell, didValidate isValid: Bool, icon: UIImageView)
}

class CustomPagarTableViewCell: UITableViewCell {

    @IBOutlet weak var direccionLabel: UILabel!
    @IBOutlet weak var imagenDireccionImageView: UIImageView!
    @IBOutlet weak var codigoCuponTextField: UITextField!
    @IBOutlet weak var iconValidadorImageView: UIImageView!
    
    @IBOutlet weak var costoProductoLabel: UILabel!
    @IBOutlet weak var cantidadProductoLabel: UILabel!
    @IBOutlet weak var cuponProductoLabel: UILabel!
    @IBOutlet weak var descuentoProductoLabel: UILabel!
    @IBOutlet weak var metodoPagoLabel: UILabel!
    
    @IBAction func linkButton(_ sender: UIButton) {
        openLink()
    }
    
    var delegate: CustomPagarTableViewCellDelegate?
    
    func setup(descripcionCupones: DescripcionCupones){
        codigoCuponTextField.text = descripcionCupones.codigoCupon
    }
    
    @IBAction func didValidateButtonTap(_ sender: UIButton) {
        delegate?.customPagarTableView(self, didValidate: true, icon: iconValidadorImageView )
    }

    @IBAction func verProductosButton(_ sender: UIButton) {
        
    }
}


extension CustomPagarTableViewCell {
    func openLink(){
        guard let url = URL(string: "https://www.google.com/maps/place/Dely+Pasteleria/@-12.146543,-76.9786765,17.46z/data=!4m5!3m4!1s0x0:0x7c1c0224e031bb9a!8m2!3d-12.1462481!4d-76.9776098"), UIApplication.shared.canOpenURL(url) else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
         
    }
}

