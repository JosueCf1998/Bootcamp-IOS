//
//  Networking.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import Foundation

protocol RemoteRespository {
    func fetchData() -> [DataResponse]
}

class DataMoksInicio: RemoteRespository {
    func fetchData() -> [DataResponse] {
        
        let resource = "dataInicio"
        if let url = Bundle.main.url(forResource: resource, withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                
                // API real
                let decoder = JSONDecoder()
                let result = try decoder.decode([DataResponse].self, from: data)
                return result
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        
        return []
    }
}
