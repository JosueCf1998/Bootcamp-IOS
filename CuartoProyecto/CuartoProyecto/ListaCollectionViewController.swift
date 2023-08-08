//
//  ListaCollectionViewController.swift
//  CuartoProyecto
//
//  Created by Maximo Josue Coronel Flores on 3/12/22.
//

import UIKit

private let reuseIdentifier = "Cell"

/*
protocol FrutaLista{
    "nombre": String
}
*/

class ListaCollectionViewController: UICollectionViewController {
    
    let fruta : [String] = ["Manzana", "Piña", "Platano", "Sandia", "Pera", "Fresa",
                 "Manzana", "Piña", "Platano", "Sandia", "Pera", "Fresa",
                 "Manzana", "Piña", "Platano", "Sandia", "Pera", "Fresa",
                 "Manzana", "Piña", "Platano", "Sandia", "Pera", "Fresa"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return fruta.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell
    
        // Configure the cell
        cell?.textLabel.text = fruta[indexPath.row]
        
        return cell!
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
        
        /* LLAMAR A UNA ESCENA DE OTRO STORYBOARD
        let viewController = storyboard?.instantiateViewController(withIdentifier: "Escena15")
        
        let myStoryboard = UIStoryboard(name: "StoryBoard2", bundle: nil)
        let viewC = myStoryboard.instantiateViewController(withIdentifier: "Escena15")
        
        navigationController?.pushViewController(viewController!, animated: true)
         */
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension ListaCollectionViewController{
    
}
