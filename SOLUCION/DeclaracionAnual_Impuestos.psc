Algoritmo DeclaracionAnual_Impuestos

	// Definir todas las variables, matrices y vectores
	Definir categoria Como Cadena
	Dimension categoria[6] 
	categoria[0]= "Vivienda"
	categoria[1] = "Educación"
	categoria[2]= "Alimentación"
	categoria[3]= "Vestimenta"
	categoria[4]= "Salud"
	categoria[5]="Turismo"
	
	Definir iess Como Real
	Definir maxDeductRate Como Real
	maxDeductRate = 0.18
	
    Dimension facturas[12, 6]
    Dimension sueldos[12]
	totalIngresos = 0
    totalDeducciones = 0
    impExcedentePagar = 0
	
	// Iniciar programa obteniendo datos:
	Escribir "Ingresa tu nombre: "
	leer nombre 
	totalIngresos = ingresarSueldos(sueldos, iess)
	//totalDeducciones = ingresarFacturas(facturas, categoria, maxDeductRate)
	totalDeducciones = 5352.97
	// Procesar deducciones
	Si (totalIngresos < 0 o totalDeducciones < 0) Entonces
        Escribir "Los ingresos y las deducciones no pueden ser negativos."
        
    FinSi
	
    
    baseImponible = totalIngresos - totalDeducciones
    calcularImpuesto(baseImponible, impBasico, impExcedente, impExcedentePagar, impTotal) 
	
    
    generarDeclaracion(nombre, totalIngresos, totalDeducciones, baseImponible,impExcedentePagar, impExcedente, iess)
	

	
	
FinAlgoritmo


Funcion totalIngresos = ingresarSueldos(sueldos, iess Por Referencia)
    
    Para mes <- 0 Hasta 11 Con Paso 1 Hacer
        Escribir "Ingrese su sueldo del mes ", mes+1, ": "
        Leer sueldos[mes]
        totalIngresos = totalIngresos + sueldos[mes]
    Fin Para
	iess = totalIngresos*0.1145
	// El total de Ingresos en la Declaracion de Impuestos, es considerado como los Ingresos - el aporte al Iess.
	totalIngresos= totalIngresos-iess
FinFuncion

Funcion totalDeducciones = ingresarFacturas(facturas, categoria, maxDeductRate)
    totalDeducciones = 0
    Para mes <- 0 Hasta 11 Con Paso 1 Hacer
        Para cat <- 0 Hasta 5 Con Paso 1 Hacer
            Escribir "Ingrese el total en costo de facturas de ", categoria[cat], " del mes ", mes+1, ": "
            Leer facturas[mes, cat]
            totalDeducciones = totalDeducciones + facturas[mes, cat]
        Fin Para
    Fin Para
	// Las deducciones no pueden superar mas del Limite de Gastos Personales (5352.97$ para 2023), de hacerlo, el nuevo maximo es el limite de GP.
	Si (totalDeducciones > 5352.97)
		totalDeducciones = 5352.97
	FinSi
	// La deduccion es elaborada en respecto al 18% del Limite de Gastos Personales
	totalDeducciones = totalDeducciones * maxDeductRate
FinFuncion

Funcion generarDeclaracion(nombre, totalIngresos, totalDeducciones, baseImponible, impExcedentePagar, impExcedente, iess)
	Escribir "Estimado/a", nombre
	Escribir "Total de ingresos: ", totalIngresos
    Escribir "Total de deducciones: ", totalDeducciones
	Escribir "-------------------------------------------------"
	Escribir "Sus ingresos netos son: ", baseImponible
	Escribir "*"
    Escribir "Porcentaje que usted pagara de impuesto: ", impExcedente
	Escribir "-------------------------------------------------"
    Escribir "Impuesto de Fraccion Excedente a pagar: ", impExcedentePagar
	Escribir "Impuesto de Fraccion Basica a pagar: ", impBasico
	Escribir ""
	Escribir "Total de Impuesto a pagar: ",impTotal
	Escribir "-------------------------------------------------"
	Escribir "Informacion adicional:"
	Escribir "Aporte al IESS: ",iess
	
FinFuncion

SubProceso calcularImpuesto(baseImponible, impBasico Por Referencia, impExcedente Por Referencia, impExcedentePagar Por Referencia, impTotal Por Referencia)
	Si (baseImponible>0 Y baseImponible<=11722) Entonces
		impBasico = 0
		impExcedente=0
	SiNo Si (baseImponible>11722 Y baseImponible<=14930) Entonces
			impBasico = 0
			impExcedente=0.05
		SiNo Si (baseImponible>14930 Y baseImponible<=19385) Entonces
				impBasico = 160
				impExcedente=0.1
			SiNo Si (baseImponible>19385 Y baseImponible<=25638) Entonces
					impBasico = 606
					impExcedente=0.12

				SiNo Si (baseImponible>25638 Y baseImponible<=33738) Entonces
						impBasico = 1356
						impExcedente=0.15

					SiNo Si (baseImponible>33738 Y baseImponible<=44721) Entonces
							impBasico = 2571
							impExcedente=0.2
						SiNo Si (baseImponible>44721 Y baseImponible<=59537) Entonces
								impBasico = 4768
								impExcedente=0.25
							SiNo Si (baseImponible>59537 Y baseImponible<=79388) Entonces
									impBasico = 8472
									impExcedente=0.3
								SiNo Si (baseImponible>79388 Y baseImponible<=105580) Entonces
										impBasico = 14427
										impExcedente=0.35
									SiNo Si (baseImponible>105580) Entonces
											impBasico = 23594
											impExcedente=0.37
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
	impExcedentePagar= baseImponible*impExcedente
	impTotal = impBasico+impExcedentePagar
FinSubProceso
	
