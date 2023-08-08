//
//  CustomInicioTableViewCell.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 8/12/22.
//

import UIKit


class CustomInicioTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subtituloLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    
    
    weak var delegate: CustomInicioTableViewCellDelegate?
    
    var indexCell: Int = 0
    
    @IBAction func agregarFavoritoButton(_ sender: UIButton) {
        delegate?.agregarFavorito(cell: self, index: indexCell)

    }
    @IBAction func agregarCarritoButton(_ sender: UIButton) {
        delegate?.agregarCarrito(cell: self, index: indexCell)

    }
}

