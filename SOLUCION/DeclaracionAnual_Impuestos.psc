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
	Definir earnsDividends,showTaxTable Como Logico
	
    Dimension facturas[12, 6]
    Dimension sueldos[12]
	totalIngresos = 0
    totalDeducciones = 0
    impExcedentePagar = 0
	año = 2023
	// Iniciar programa obteniendo datos:
	Escribir "Ingresa tu nombre: "
	leer nombre 
	totalIngresos = ingresarSueldos(sueldos, iess)
	totalDeducciones = ingresarFacturas(facturas, categoria, maxDeductRate)
	// Test-line: totalDeducciones = 5352.97
	// Procesar deducciones
	Si (totalIngresos < 0 o totalDeducciones < 0) Entonces
        Escribir "Los ingresos y las deducciones no pueden ser negativos."
        
    FinSi
	
    
    baseImponible = totalIngresos - totalDeducciones
	
	Escribir "Obtiene usted ingresos por pertenecer a alguna sociedad o corporacion que le distribuye dividendos o utilidades? (V o F)"
	Leer earnsDividends
	Si (earnsDividends) Entonces
		Escribir "Cuanto $ en dividendos usted recibe anualmente"
		Leer dividends
		Escribir "Cual es la base impositiva ( en %) que paga su sociedad por distribuir cada dividendo?"
		Leer dividendsTaxRate
	FinSi
	
	retornoImpuestos = dividends * (dividendsTaxRate*0.01)
	
    calcularImpuesto(baseImponible, impBasico, impExcedente, impExcedentePagar, impTotal) 
	
    
    generarDeclaracion(nombre, totalIngresos, totalDeducciones, baseImponible,impExcedentePagar, impExcedente,impBasico, impTotal, iess, retornoImpuestos)
	
	
	Escribir "Desea conocer la tabla de Impuesto a la Renta para Personas Naturales (2023)? ( V o F)"
	Leer showTaxTable
	Si (showTaxTable) Entonces
		taxTable(año)
	FinSi
	
	
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

Funcion generarDeclaracion(nombre, totalIngresos, totalDeducciones, baseImponible, impExcedentePagar, impExcedente, impBasico, impTotal, iess, retornoImpuestos)
	Escribir "Estimado/a ", nombre
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
	Escribir "Credito tributario o devolucion (por dividendos Corporativos): ", retornoImpuestos, "$"
	Escribir "-------------------------------------------------"

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
	impBasico = impBasico
	impTotal = impBasico+impExcedentePagar
FinSubProceso

SubProceso taxTable(año)
	Si (año==2023) Entonces 
	Escribir "Fracción Básica	Exceso hasta	Impuesto Fracción Básica	% Impuesto Fracción Excedente"
	Escribir "$ 0,00	$ 11.722,00	$ 0,00	0%"
	Escribir "$ 11.722,00	$ 14.930,00	$ 0,00	5%"
	Escribir "$ 14.930,00	$ 19.385,00	$ 160,00	10%"
	Escribir "$ 19.385,00	$ 25.638,00	$ 606,00	12%"
	Escribir "$ 25.638,00	$ 33.738,00	$ 1.356,00	15%"
	Escribir "$ 33.738,00	$ 44.721,00	$ 2.571,00	20%"
	Escribir "$ 44.721,00	$ 59.537,00	$ 4.768,00	25%"
	Escribir "$ 59.537,00	$ 79.388,00	$ 8.472,00	30%"
	Escribir "$ 79.388,00	$ 105.580,00 $ 14.427,00	35%"
	Escribir "$ 105.580,00	en adelante	$ 23.594,00	37%"
FinSi

FinSubProceso
