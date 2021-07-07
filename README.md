# Instrucciones


Se debe realizar un proyecto que exponga un servicio REST los datos de entrada están contenidos en la clase InfoRQ.java (Adjunta).

El proyecto deberá emular un servicio de compra de gasolina. Los campos contenidos en InfoRQ.java deberán ser todos obligatorios, dichos campos deberán tener validaciones de primer nivel (Ej: amount: debe ser mayor a 1 peso, no puede estar vacío. name: no puede ser vacío ni nulo… las validaciones las decide el desarrollador para el usuario final)

El proyecto deberá ser modular, por lo que debe considerar capas, las capas también quedan a su consideración del desarrollador.

La información a obtener de las gasolinerías se encuentra en el servicio REST expuesto en la ruta: https://api.datos.gob.mx/v1/precio.gasolina.publico  por lo cual se deberá realizar una consulta a este servicio y encontrar el número que coincida con el dato introducido en gasStation (_id). Se deberá complementar la información de entrada, con la información obtenida en el servicio, y guardarla en una BD, (MySQL para facilitar la creación o cualquier base de datos libre que sea de su agrado)


Consideraciones
gasType (1: Magna, 2 Premium)
gasStation (Número de estación obtenida desde el servicio externo _id)
El deploy se realizará en un Servidor de Aplicaciones (Wildfly, JBoss, Glassfish... etc)
Se puede usar cualquier framework
Subir el código del proyecto a GIT para ser descargado.
No usar SpringBoot (Solo SpringBoot no está permitido, todas lo dem´s de spring puede ser usado)
Adicional: Generar un pequeño manual técnico de instalación, esto no es necesario sino deseable.

Request Ejemplo InfoRQ.java:
{
"email" : "info@srpago.com",
"name" : "Juan",
"lastName" : "Perez",
"cardNumber" : "4242424242424242",
"expirationDateYear" : 2020,
"expirationDateMonth" : 12,
"gasType" :1,
"amount" : 350.00,
"gasStation" : “587fbd68edfe99480a072f15”,
"sellerName" : "Pedro Perez"
}

Response Ejemplo:
{
"success" : true,
“message” : “Informacion correcta”
“error” : null
}

#Instalación

.- Ejecutar en MySQl: create database db_gasolinera;

.- Descarga versión de grails 2.5.0 https://grails.org/download.html

.- Guardar en carpeta ej: C:\grails

.- Descomprimir archivo

.- Crear GRAILS_HOME en variables de sistema, path ej. : C:\grails\grails-2.5.0

.- Abrir proyecto y ejecutar en consola: grails run-app


