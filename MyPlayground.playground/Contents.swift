
// COMENTARIOS UNA LINEA
/* MUCHOS COMENTARIOS*/

//VARIABLES
var var1 : String = "nombre"
var var2 = "nombre"
var var3 = ""
var3 = "Juan"
print(var3)
var3 = "Josue"
print(var3)

var numero:Int = 23
var numero2 = 23
print(numero)

var doble:Double = 34.2
print(doble)

var bolean:Bool = true
var bolean2 = false
print(bolean2)

//CONSTANTES
let num = 12
print(num)
let pi = 3.1416
print(pi)
//pi = 3.1415 //ERROR pi es una constante

//OPCIONALES
var edad:Int? = nil
edad = 23
print(edad ?? "No se ha ingresado la edad")

//OPTIONAL BINDING (Forma desplegada de los Opcionales)
if let age = edad{
    print(age)
}else{
    print("No tiene valor")
}

//CASTING
let num1 = "2reg"
let num2 = 3
let res = Int(num1) ?? 0 + num2
print(res)

let numDouble:Double = 123.178945
let numFloat:Float = 23.156
let res2 = numDouble + Double(numFloat)
print(res2)
let res3 = Float(numDouble) + numFloat
print(res3)

//CONCATENACION
let helloworld = "Hola como estas"
let nombre = "Pedro"
let nombre2 = "Sandra"
let nombre3 = "Angelica"
print(helloworld + " " + nombre)
print("Hola como estas", nombre2)
print("Hola como estas \(nombre3)")



