import UIKit

struct User {
    var nombre:String
    var apellPaterno:String
    var apellMaterno:String
    var fechaNac:String
    var NroDoc:Int
    var sexo:String
    var correo:String
    var hermanos:Int
    var user:String?
    
    init(nombre:String,apellPaterno:String,apellMaterno:String,fechaNac:String,NroDoc:Int,sexo:String,correo:String,hermanos:Int,user:String?=nil){
            self.nombre=nombre
            self.apellPaterno = apellPaterno
            self.apellMaterno = apellMaterno
            self.fechaNac = fechaNac
            self.NroDoc = NroDoc
            self.sexo = sexo
            self.correo = correo
            self.hermanos = hermanos
            self.user = user
        }
}

var allPerson:[User] = [
    User(nombre:"CARLOS JOSE",apellPaterno:"Robles", apellMaterno:"GOMEZ", fechaNac:"06/08/1995", NroDoc:74851245, sexo:"M", correo:"carlos.robles@hotmail.com", hermanos:2),
    User(nombre:"MIGUEL ANGEL",apellPaterno:"QUISPE", apellMaterno:"OTERO", fechaNac:"28/12/1995", NroDoc:79451654, sexo:"M", correo:"miguel.anguel@gmail.com", hermanos:0),
    User(nombre:"KARLA ALEXANDRA",apellPaterno:"FLORES", apellMaterno:"ROSAS", fechaNac:"15/02/1997", NroDoc:77485812, sexo:"F", correo:"Karla.alexandra@hotmail.com", hermanos:1),
    User(nombre:"NICOLAS",apellPaterno:"QUISPE", apellMaterno:"ZEBALLOS", fechaNac:"08/10/1990", NroDoc:71748552, sexo:"M", correo:"nicolas123@gmail.com", hermanos:2),
    User(nombre:"PEDRO ANDRE",apellPaterno:"PICASSO", apellMaterno:"BETANCUR", fechaNac:"17/05/1994", NroDoc:74823157, sexo:"M", correo:"pedroandrepicasso@gmail.com", hermanos:2),
    User(nombre:"FABIOLA MARIA",apellPaterno:"PALACIO", apellMaterno:"VEGA", fechaNac:"02/02/1992", NroDoc:76758254, sexo:"F", correo:"fabi@hotmail.com", hermanos:0)
];

func CalculeYears(fechaNac:String)-> [Int]{
    let fNac = getFech(fecha: fechaNac)
    let calendar = Calendar.current
    let fechOld = calendar.dateComponents([.day, .month, .year], from: fNac)
    let fechNew = calendar.dateComponents([.day, .month, .year], from: Date())
    let res = calendar.dateComponents([.day,.month, .year], from: fechOld, to: fechNew)
    return [res.year ?? 0 , res.month ?? 0, res.day ?? 0]
}


func getFech(fecha:String)->Date{
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "dd/MM/yyyy"
    let f = dateFormat.date(from: fecha)
    return f!
}

func SearchDataPerson(){
 var mayor = [0,0,0]  //yy mm dd
 var menor = [99,99,99]
 var name = ""  //person
 var name1 = ""
    for var item in allPerson {
        var correo = item.correo
        var usuario = correo.components(separatedBy: "@").first
        print("Usuario: ",usuario!)
        item.user = usuario
        print("nombre: " + item.nombre)
        print(" correo: " + item.correo)
        print("--------------------------------")
    }
    
    for item in allPerson {
        // Edad mayor y menor
        let fecha = item.fechaNac
        let year = CalculeYears(fechaNac:fecha)[0]
        let month = CalculeYears(fechaNac:fecha)[1]
        let day = CalculeYears(fechaNac:fecha)[2]
        if mayor[0] < year {
            mayor[0...2] = [year, month, day]
            if mayor[1] < month {
                mayor[1...2] = [month, day]
                mayor[2] = mayor[2] < day ? day: mayor[2]
                name = item.nombre
            }
            name = item.nombre
        }
        
        if menor[0] > year {
            menor[0...2] = [year, month, day]
            if menor[1] > month {
                menor[1...2] = [month, day]
                menor[2] = menor[2] < day ? day: menor[2]
                name = item.nombre
            }
            name1 = item.nombre
        }
    }
    print(name+" es el mayor tiene: ",mayor[0],"años ",mayor[1],"meses y ", mayor[2],"dias")
    print(name1+" es el menor tiene: ",menor[0],"años ",menor[1],"meses y ", menor[2],"dias")
}

func OrdName(persona: User){
    let firstNom = persona.nombre.components(separatedBy: " ").first!
    let nombre = capital(Word:firstNom)
    let paterno = capital(Word: persona.apellPaterno)
    let materno = persona.apellMaterno.prefix(1).capitalized + "."
    
    print(nombre+" "+paterno+" "+materno)
}

func capital(Word:String) -> String{
    let word1 = Word.prefix(1).capitalized
    let word2 = Word.dropFirst().lowercased()
    return word1 + word2
}

let mujeres = allPerson.filter({$0.sexo == "F"})
let hombres = allPerson.filter({$0.sexo == "M"})
let perHerm2 = allPerson.filter({$0.hermanos > 2})
print("Hay ",mujeres.count," mujeres")
print("Hay ",hombres.count," hombres")
print("---------------------------------")
if perHerm2.count != 0 {
    for e in perHerm2 {
        print("Hay ",e.nombre," tiene mas de dos hermanos")
        print("-------------------------------")
    }
}else{
    print("Hay ",perHerm2.count," personas con mas de dos hermanos")
    print("-------------------------------")
}

for item in allPerson {
    OrdName(persona:item)
}
print("--------------------------------")

SearchDataPerson()


