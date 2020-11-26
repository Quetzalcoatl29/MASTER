# **Apuntes Programación Avanzada**

# Paradigmas de Programacion:
- Definciión :
 Me otorga la visión , métodos y estilo en la construcción de programas y subprogramas.
- Aplicación /Ejemplo: Estructura los metodos para llevar a cabo el computo
 ejemplo python es multiparadigma.
- Conclusión : Diferentes paradigmas resultan en diferentes estilos, formas de programar
 y pensar la solucón de los problemas planteados( es el Know how) .
Existen dos tipos de paradigmas imperativo y declarativo , en el primero se coenitnen la 
OOP,estructurados y procedimentales (SE describen paso a paso variables mutables ), por lo que sus dos caracteristicas pricnipales serian la existencia de un estado modificable y la existencia de senetencian de control de ejecucion del programa.
En el decalarativo se tienen lo funcional , logico (proposiciones y afirmaciones declaradas estado de variables mutable)
# Lenguaje de Programación.
- Definición : 
 Diseñado para comuicarse (computadora-humano) , es una conveción (notacion) que debe
ser entendible por la maquina y por el humano.
-Aplicación / Ejemplo:
 Es una convecion ( algo concreto) , historicamente primero fueron los lenguajes de maquina 40s - 50 s
Luego  ensmablador finales del 50 , luego alto nivel con Fortran y cobol que tienen sub categorias: orientado a procedimientos, orientado a problemas,orientado al enfasisi de la funcion o el objeto , 4generacion proposito especial (sql...)

# OOP
Toma las mejores ideas y caracteristicas del paradigma de programacion estrucuturada y las combina en nuevos conceptos.
(Los datos contorlan el acceso al codigo), ya que se definen la data y las rutinas que son permitadas para afectar o
actuar en esa data.Por lo que el tipo de dato definen en que orde y que tipo de operacione spueder ser aplicadas.
- **Encapsulamiento**:
 Mecanismo para enlazar juntos el codigo y la data que este manipula y mantenerlos protegidos a ambos de interferencias o modificaciones externas y un mal uso.El objeto es el artefacto que permite el encapsulamiento.En java la unidad basica de encapsulamiento es el objeto.
- **Polimorfismo**:
 Es posible diseñar una interfaz generica a un grupo de tareas relacionadas, el polimorfismo ayuda a reducir complejidad al permitir qque la misma interface ser usada especificamente una accion (metodo) general de una clase.
overload es el polimorfismo en java.
- **Herencia**
-El proceso por el cual un objeto puede adquiriri propiedades de otro objeto defindo previamente,(herarquia).
- **Java como funciona**
https://www3.ntu.edu.sg/home/ehchua/programming/java/J2_Basics.html 
- **Modificadores de acceso**:
 Define como otras partes del programa pueden accesar a los mimebros de la clase.
-public
-private
-protected
- **Fuertemente tipado**
primitivos y orientado a objetos 
primitivos boolean,byte,char,double,float,int,long,short.
-**Declaracion de variables Scopes**
Las variables declaradas en un scope no son visibles al codigo que eata afuera de ese scoup.
-**Conversion de tipo**.
Los dos tipos son compatibles o el tipo de destino es ma slargo que el tipo de origen,(CASTING)
(target-type)expression
-**Clase**
La clase es una plantilla que define la forma de un objeto.
Java usa especificacion de una clase para contruir objetos, los objetos son instancias de clases, en esecncia la clase son los planos que definen como construir el objeto.
```
class nombre {
    //declara variables
type var 1;
//declarar metodos
type method(parametros){
//cuerpo del metodo
                  }
}
```
 - **Creacion de objetos**
 ```
class Vehicle {
    //declara variables
int passengers ;
int fuelcap;
int mpg;
            }
class vehicledemo{
    public static void main ( String args[]){
        Vehicle minivan =  new Vehicle() ;//usar new para reservar en memoria y crear obj
        int range;
        //asignar valores a los campos
        miniman.passenger =7;
        minivan.fuelcao = 190;
        minivan.mpg = 21;
        
    }
}
```
-**Contructores**
En esencia un cosntructor incializa un objeto cuando es creado, tiene el mismo nombre que la clase y sintanticamente la misma forma que un metodo, s eudan para dar valore sinciales a un objeto.
Sino lo defino explicitamente java los hace por default , cero,null y false.

```
class MiClase {
int x ;
MiClase (){
    x = 10; //constructor
         }
    }
class Demo {
    public static void main (String args[]){
        MiClase t1 = new MiClase();
    }
}
```
-Constructores Parametrizados
```
class MiClase {
int x ;
MiClase (int i){
    x = i; //constructor
         }
    }
class Demo {
    public static void main (String args[]){
     MiClase t1 = new MiClase(10);//valor para el constructor
    }
}
```
-**This**
This hace referencia al objeto actual de la clase, es decir, a una instancia concreta de la clase y nos sirve para usar los métodos y atributos de esa clase desde alguno de sus métodos, para llamar a otro de sus constructores o simplemente para pasarle el objeto completo a algún otro método u objeto.
Aunque normalmente podemos omitir el this cuando hacemos una llamada a un método o atributo de la misma clase ya que el compilador sabe que pertenece a la clase desde la que se usa porque si no ese método o atributo debería de llevar delante el nombre del objeto al que se refiere, si lo usamos el código puede ser un poco más claro y nos evitamos problemas si alguien crea una variable con el mismo nombre que uno de los atributos de la clase, porque en este caso sí que es necesario usar el this para acceder a la variable de la clase ya que la variable local «oculta» a la de clase.

```
public class Archivo {
    private String nombre;
    private String extension;
    private String ruta;
        
    public Archivo(String nombre, String extension) {
        this.nombre = nombre;
        this.extension = extension;
        this.ruta = "";
    }

    public Archivo(String nombre, String extension, String ruta) {
        this(nombre, extension);
        this.ruta = ruta;
    }

    public String getNombre() {
        return nombre;
    }
```
-**Overloading**
-Expresion del polimorfismo.
