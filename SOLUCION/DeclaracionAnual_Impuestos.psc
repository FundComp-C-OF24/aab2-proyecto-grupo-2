Algoritmo DeclaracionAnual_Impuestos
	Escribir "Ingresa tu nombre: "
	leer nombre 
	Definir categoria Como Cadena
	Dimension categoria[6] 
	categoria[0]= "Vivienda"
	categoria[1] = "Educación"
	categoria[2]= "Alimentación"
	categoria[3]= "Vestimenta"
	categoria[4]= "Salud"
	categoria[5]="Turismo"
	
    Dimension facturas[12, 6]
    Dimension sueldos[12]
	totalIngresos = 0
    totalDeducciones = 0
    impuestoAPagar = 0
	
	totalIngresos = ingresarSueldos(sueldos)
	totalDeducciones = ingresarFacturas(facturas, categorias)
	Si totalIngresos < 0 o totalDeducciones < 0 Entonces
        Escribir "Los ingresos y las deducciones no pueden ser negativos."
        
    FinSi
	
    
    baseImponible = totalIngresos - totalDeducciones
    impuestoAPagar = calcularImpuesto(baseImponible) 
	
    
    generarDeclaracion(totalIngresos, totalDeducciones, baseImponible, impuestoAPagar)
	
FinAlgoritmo
	
	Dimension datosUsuario(numeroParametros, 1)
	pedirDatosUsuario(datosUsuario)
	generarFactura(nombre, datosUsuario)
	
FinAlgoritmo


Funcion totalIngresos = ingresarSueldos(sueldos)
    
    Para mes <- 1 Hasta 12 Con Paso 1 Hacer
        Escribir "Ingrese su sueldo del mes ", mes, ": "
        Leer sueldos[mes]
        totalIngresos = totalIngresos + sueldos[mes]
    Fin Para
Fin Funcion

Funcion totalDeducciones = ingresarFacturas(facturas, categorias)
    totalDeducciones = 0
    Para mes <- 1 Hasta 12 Con Paso 1 Hacer
        Para cat <- 1 Hasta 6 Con Paso 1 Hacer
            Escribir "Ingrese el total de facturas de ", categorias[cat], " del mes ", mes, ": "
            Leer facturas[mes, cat]
            totalDeducciones = totalDeducciones + facturas[mes, cat]
        Fin Para
    Fin Para
Fin Funcion

Funcion generarDeclaracion(totalIngresos, totalDeducciones, baseImponible, impuestoAPagar)
    Escribir "Total de ingresos: ", totalIngresos
    Escribir "Total de deducciones: ", totalDeducciones
    Escribir "Base imponible: ", baseImponible
    Escribir "Impuesto a pagar: ", impuestoAPagar
Fin Funcion

SubProceso pedirDatosUsuario(datosUsuario Por Referencia)
	Escribir "Ingrese el costo por Vivienda:"
	Escribir "Ingrese parametro 2:"
	Escribir "Ingrese parametro 3:"
	Escribir "Ingrese parametro 4:"
	Escribir "Ingrese parametro 5:"
	Escribir "Ingrese parametro 6:"
	FinFuncion
	
	SubProceso generarFactura(nombre, datosUsuario Por Referencia)
		
		datosUsuario = datosUsuario
		
	FinSubProceso