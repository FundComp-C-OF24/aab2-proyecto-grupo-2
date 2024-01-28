Algoritmo proyecto
	Escribir "Ingresa tu nombre: "
	leer nombre 
	numeroParametros = 6
	factura = "" 
	Dimension datosUsuario(numeroParametros, 2)
	pedirDatosUsuario(datosUsuario)
	generarFactura(nombre, datosUsuario, factura)
	
	
	Escribir " --- Su factura es --- "
	Escribir factura 
FinAlgoritmo

Funcion pedirDatosUsuario(datosUsuario Por Referencia)
	datosUsuario[0, 0] = "Sueldo por mes: "
	Escribir "Ingrese su sueldo por mes: (entre $400 y $3000)"
	Leer sueldoMensual
	
	
	Mientras sueldoMensual < 400 o sueldoMensual > 3000 Hacer
		Escribir "El sueldo ingresado es superior a los limites. Intente nuevamente"
		leer sueldoMensual
	Fin Mientras
	
	datosUsuario[0,1] = ConvertirATexto(sueldoMensual)
	
	Escribir "Ingrese parametro 2:"
	Escribir "Ingrese parametro 3:"
	Escribir "Ingrese parametro 4:"
	Escribir "Ingrese parametro 5:"
	Escribir "Ingrese parametro 6:"
	FinFuncion
	
SubProceso generarFactura(nombre, datosUsuario, factura Por Referencia)
		FinSubProceso 
		