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
	totalDeducciones = ingresarFacturas(facturas, categoria)
	Si (totalIngresos < 0 o totalDeducciones < 0) Entonces
        Escribir "Los ingresos y las deducciones no pueden ser negativos."
        
    FinSi
	
    
    baseImponible = totalIngresos - totalDeducciones
    calcularImpuesto(baseImponible, rangoDeducible, impuestoAPagar) 
	
    
    generarDeclaracion(nombre, totalIngresos, totalDeducciones, baseImponible,impuestoAPagar, rangoDeducible)
	

	
	
FinAlgoritmo


Funcion totalIngresos = ingresarSueldos(sueldos)
    
    Para mes <- 0 Hasta 11 Con Paso 1 Hacer
        Escribir "Ingrese su sueldo del mes ", mes+1, ": "
        Leer sueldos[mes]
        totalIngresos = totalIngresos + sueldos[mes]
    Fin Para
FinFuncion

Funcion totalDeducciones = ingresarFacturas(facturas, categoria)
    totalDeducciones = 0
    Para mes <- 0 Hasta 11 Con Paso 1 Hacer
        Para cat <- 0 Hasta 5 Con Paso 1 Hacer
            Escribir "Ingrese el total en costo de facturas de ", categoria[cat], " del mes ", mes+1, ": "
            Leer facturas[mes, cat]
            totalDeducciones = totalDeducciones + facturas[mes, cat]
        Fin Para
    Fin Para
FinFuncion

Funcion generarDeclaracion(nombre, totalIngresos, totalDeducciones, baseImponible, impuestoAPagar, rangoDeducible)
	Escribir "Querido/a", nombre
	Escribir "Total de ingresos: ", totalIngresos
    Escribir "Total de deducciones: ", totalDeducciones
	Escribir "-------------------------------------------------"
	Escribir "Por ende usted sera impuesto en: ", baseImponible
	Escribir "*"
    Escribir "Porcentaje que usted pagara de impuesto: ", rangoDeducible
	Escribir "-------------------------------------------------"
    Escribir "Impuesto a pagar: ", impuestoAPagar
	
FinFuncion

SubProceso calcularImpuesto(baseImponible, rangoDeducible Por Referencia, impuestoAPagar Por Referencia)
	Si (baseImponible>0 Y baseImponible<=11722) Entonces
		rangoDeducible=0
	SiNo Si (baseImponible>11722 Y baseImponible<=14930) Entonces
			rangoDeducible=0.05
		SiNo Si (baseImponible>14930 Y baseImponible<=19385) Entonces
				rangoDeducible=0.1
			SiNo Si (baseImponible>19385 Y baseImponible<=25638) Entonces
					rangoDeducible=0.12

				SiNo Si (baseImponible>25638 Y baseImponible<=33738) Entonces
						rangoDeducible=0.15

					SiNo Si (baseImponible>33738 Y baseImponible<=44721) Entonces
							rangoDeducible=0.2
						SiNo Si (baseImponible>44721 Y baseImponible<=59537) Entonces
								rangoDeducible=0.25
							SiNo Si (baseImponible>59537 Y baseImponible<=79388) Entonces
									rangoDeducible=0.3
								SiNo Si (baseImponible>79388 Y baseImponible<=105580) Entonces
										rangoDeducible=0.35
									SiNo Si (baseImponible>105580) Entonces
											rangoDeducible=0.37
										FinSi
									FinSi
								FinSi
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi
	impuestoAPagar= baseImponible*rangoDeducible
FinSubProceso
	
