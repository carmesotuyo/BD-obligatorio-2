# Base de Datos 1
## Obligatorio 2
| Carmela Sotuyo (186554) -  Fernando Spillere (274924) |
|------|
| Grupo M3A - AN |
| Docentes: Juan Manuel Rodríguez Picón - Renso Sánchez |
| 23 de junio de 2022 |
| Licenciatura en Sistemas |
| Universidad ORT Uruguay |

# REFERENCIAS PARA NOSOTROS
| simbolo en markdown | significado |
|---|---|
| & larr ; (todo junto) | flechita <- |
| sub entre &lt;&gt; | subindice |
| dos espacios despues de la linea | salto de linea en los de algebra relacional |
| & lt ; y & gt ; (todo junto) | simbolos de &lt; y &gt; |
| & emsp ; (todo junto) | 4 espacios indentados |

## Ejercicio 1
### Script SQL
```
agregar script final
```
### Resultado obtenido
![Captura de Pantalla 2022-06-14 a la(s) 10 31 16](https://user-images.githubusercontent.com/101828758/173589382-d55161fb-a34c-4066-9a91-6552ba2070dc.png)

### Algebra relacional
Musica &larr; Π<sub>codCategoria</sub>(σ<sub>nombreCategoria='Musica'</sub>(CATEGORIA))  
Fortnite &larr; Π<sub>codCategoria</sub>(σ<sub>nombreCategoria='Fortnite'</sub>(CATEGORIA))  
ContenidoMusica &larr; CONTENIDO * Musica  
ContenidoFortnite &larr; CONTENIDO * Fortnite  
MusicaMayo22 &larr; σ<sub>fechaEmision&gt;='2022-05-01' AND fechaEmision&lt;='2022-05-31'</sub>(ContenidoMusica)  
FortniteMayo22 &larr; σ<sub>fechaEmision&gt;='2022-05-01' AND fechaEmision&lt;='2022-05-31'</sub>(ContenidoFortnite)  
UsuariosMusica &larr; Π<sub>emailUsuario</sub>(MusicaMayo22)  
UsuariosFortnite &larr; Π<sub>emailUsuario</sub>(FortniteMayo22)  
UnionUsuariosMyF &larr; UsuariosMusica ∪ UsuariosFortnite  
InterseccionUsuariosMyF &larr; UsuariosMusica ∩ UsuariosFortnite  
UsuariosMoF &larr; UnionUsuariosMyF - InterseccionUsuariosMyF  
Π<sub>email, nickname </sub>(UsuariosMoF)

### Justificación
Los usuarios que compartieron contenido de una u otra categoría, pero no ambas, son aquellos contenidos que pertenecen a la unión menos la intersección de ambas categorías. De eso se seleccionan los email de usuarios que coinciden con el contenido y cuyas fechas corresponden al mes indicado.

## Ejercicio 2
### Script SQL
```
agregar script final
```
### Resultado obtenido
![Captura de Pantalla 2022-06-14 a la(s) 10 31 53](https://user-images.githubusercontent.com/101828758/173589508-a56dbcd6-e4c5-4824-9e02-68fd143bd0ce.png)

### Algebra relacional
Musica &larr; Π<sub>codCategoria</sub>(σ<sub>nombreCategoria = ‘Musica’</sub>(CATEGORIA))  
ContsMusica &larr; CONTENIDO * Musica  
Privados &larr; σ<sub>dominio = ‘Privado’</sub>(Π<sub>codContenido, Titulo, emailUsuario, dominio </sub>(ContsMusica))  
ConVisualizaciones &larr; VISUALIZACIONES ⋈<sub>$1==$4 AND $2&lt;&gt;$6 AND $3&gt;='2022-05-01' AND $3&lt;= '2022-05-31'</sub>Privados  
Π<sub>Titulo </sub> (ConVisualizaciones)
  
### Justificación
Obtenemos el código de la categoría Música y con este los contenidos que corresponden a dicha categoría. De esos filtramos los que son de dominio Privado. Finalmente realizamos un join con la tabla Visualizaciones con las condiciones necesarias de fecha e email. De todo eso proyectamos únicamente el título.
## Ejercicio 3
### Script SQL
```
agregar script final
```
### Resultado obtenido
![Captura de Pantalla 2022-06-14 a la(s) 10 45 08](https://user-images.githubusercontent.com/101828758/173592461-624c26fe-681a-45a3-8b67-dcd5acfa693b.png)

### Algebra relacional
Visualizados &larr; Π<sub>codContenido</sub>(VISUALIZACION)  
LoL &larr; Π<sub>codCategoria</sub>(σ<sub>nombreCategoria = 'LoL'</sub>(CATEGORIA))  
Publicos &larr; σ<sub>dominio = 'PUBLICO'</sub>(CONTENIDO)  
ContsLoLPublicos &larr; Publicos * LoL  
ContsLoLPublicosVis &larr; ContsLoLPublicos * Visualizados  
R1 &larr; ρ<sub>c1</sub>(ContsLoLPublicosVis) ⋈<sub>c1.fechaEmision&lt;c2.fechaEmision</sub> ρ<sub>c2</sub>(ContsLoLPublicosVis)  
FechaMin &larr; Π<sub>c1.fechaEmision</sub>(R1) -  Π<sub>c2.fechaEmision</sub>(R1)  
CumplenTodo &larr; σ<sub>fechaEmision = FechaMin</sub>(ContsLoLPublicosVis)  
ConUsuario &larr; CumplenTodo ⋈<sub>emailUsuario = email</sub> USUARIO  
Π<sub>titulo, email, nickname</sub>(ConUsuario)
### Justificación
Buscamos la fecha mínima (es decir la más antigua) de publicación de contenido que cumpla con las condiciones indicadas (de categoría LoL, dominio público y visualizada al menos una vez). Al obtener esa fecha podemos volver a aplicar los mismos filtros e incluir que la fecha de emisión coincida con la fecha más antigua obtenida.
### Casos de prueba

## Ejercicio 4
### Script SQL
```
agregar script final
```
### Resultado obtenido
![Captura de Pantalla 2022-06-14 a la(s) 12 48 00](https://user-images.githubusercontent.com/101828758/173620585-7df8ae3c-c89d-4473-a2c5-825cd510741b.png)

### Algebra relacional
DonacionesPosFecha &larr; σ<sub>fechaCreacion&gt;'2021-10-10'</sub>(DONACION)  

DonaronAMasDeUno &larr; DonacionesPosFecha d1 ⋈<sub>d1.emailOrigen = d2.emailOrigen AND d1.emailDestino &lt; d2.emailDestino</sub> DonacionesPosFecha d2  
EmailDonadores &larr; Π<sub>d1.emailOrigen</sub>(DonaronAMasDeUno)  

Pendientes &larr; σ<sub>estadoDonacion = 'PENDIENTE'</sub>(DonacionesPosFecha)  
RecibioMasDeUnaDon &larr; Pendientes p1 ⋈<sub>p1.emailOrigen&lt;p2.emailOrigen AND p1.emailDestino=p2.emailDestino</sub> Pendientes p2  
EmailDonado &larr; Π<sub>p2.emailDestino</sub>(RecibioMasDeUnaDon)  

DonadoEsDonador &larr; EmailDonado e1 ⋈<sub>e1.emailDestino = e2.emailOrigen</sub> EmailDonadores e2  
UsuariosQueCumplen &larr; USUARIO u ⋈<sub>u.email = d.emailOrigen</sub> DonadoEsDonador d  
Π<sub>nickname</sub>(UsuariosQueCumplen)  

### Justificación
Obtenemos los usuarios que realizaron donaciones a más de un usuario haciendo un join con la misma tabla, siendo de igual email origen pero distinto email destino. Comparamos el email destino con &lt; en lugar de &lt;&gt; para eliminar las tuplas duplicadas con los datos invertidos. Luego obtenemos los emails de usuarios que recibieron más de una donación de estado Pendiente, y que además se encuentran entre los donantes de la subconsulta anterior. Finalmente hacemos join con Usuario para obtener su nickname.
## Ejercicio 5
### Script SQL
```
agregar script final
```
### Resultado obtenido
![Captura de Pantalla 2022-06-14 a la(s) 17 04 13](https://user-images.githubusercontent.com/101828758/173678690-91fcb678-ef2a-45b7-9bac-8894c50f90ff.png)

### Cálculo relacional de tuplas
{u.email, u.nickname | USUARIO(u) AND (sysdate - u.fechaNac)/365 > 18   
&emsp;&emsp;&emsp;&emsp;AND (∀ cat)(CATEGORIA(cat)&rarr;(∃ c)(CONTENIDO(c)  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;AND c.dominio = 'PUBLICO'  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;AND c.emailUsuario = u.email  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;AND c.codCategoria = cat.codCategoria)  
&emsp;&emsp;&emsp;&emsp;)}
### Justificación
Seleccionamos los usuarios mayores de 18 años y aplicamos un cociente sobre estos, de modo que no exista una categoria de la cual no hayan compartido contenido. Dentro del cociente filtramos el contenido por su dominio.
### Casos de prueba

## Ejercicio 6
### Script SQL
```
agregar script final
```
### Resultado obtenido
![Captura de Pantalla 2022-06-15 a la(s) 10 17 29](https://user-images.githubusercontent.com/101828758/173836382-e367ac8d-868f-4113-a761-d980dd9851bd.png)

### Justificación
Realizamos la union de dos consultas, por un lado aquellas cuyo estado es aprobado y por otro las pendientes. En las pendientes indicamos que la columna de estado diga 'Transacción programada'. En ambas renombramos la columna fechaAcreditación por Fecha. También filtramos en ambas consultas por usuarios cuyo nickname sea de largo mayor o igual a 5 caracteres.
## Ejercicio 7
### Script SQL
```
agregar script final
```
### Resultado obtenido

### Justificación

## Ejercicio 8
### Script SQL
```
agregar script final
```
### Resultado obtenido
![Captura de Pantalla 2022-06-15 a la(s) 12 28 04](https://user-images.githubusercontent.com/101828758/173866180-e56bdd9f-1edb-4783-840a-637b059e2e61.png)

### Justificación
Obtenemos la información pedida de los usuarios que se encuentren entre los máximos visualizadores del mes de abril, y NO se encuentren entre los que alguna vez recibieron donaciones. Para obtener quienes recibieron donaciones seleccionamos el email de los que figuren como emailDestino en alguna donación. Para obtener los que hicieron la mayor cantidad de visualizaciones en abril primero obtenemos ese máximo con las funciones max y count y agrupando los resultados por email de usuario. Luego buscamos los usuarios que hayan realizado visualizaciones en la fecha correspondiente con un join y que además su total de visualizaciones en el mes sea igual al máximo calculado previamente.
### Casos de prueba

## Ejercicio 9
### Script SQL
```
agregar script final
```
### Resultado obtenido
![Captura de Pantalla 2022-06-16 a la(s) 13 34 04](https://user-images.githubusercontent.com/101828758/174121070-48fb0a00-72cf-4082-a455-32237c7d0def.png)

### Justificación
Primero realizamos el filtro de contenido público y fecha que vamos a aplicar en todas las subconsultas. Luego obtenemos el mínimo de contenido publicado de una categoría con la función min sobre el count agrupando por codCategoria. Utilizando la cláusula having encontramos el código de la categoría cuyo count es igual al mínimo calculado previamente. En paralelo obtenemos el máximo de visualizaciones que obtuvo un contenido, de manera similar a la consulta anterior pero utilizando la funócin max, y realizando un join con el contenido para poder aplicar los filtros. Entonces con un contenido con mayor cantidad de visualizaciones perteneciente a la categoria de menor cantidad de contenido subido finalmente obtenemos el codigo de dicha categoria obtenida en las subconsultas anteriores y proyectamos su nombre. También se realiza un join con el contenido para poder aplicar los filtros.
## Ejercicio 10
### Script SQL
```
agregar script final
```
### Resultado obtenido
![Captura de Pantalla 2022-06-18 a la(s) 17 57 32](https://user-images.githubusercontent.com/101828758/174456869-7aedd549-e6f1-476c-a476-fa8907c7ed12.png)

### Justificación
Obtenemos las distintas consultas por separado para contenido Privado y Público, y luego las unimos a través de la función Union. Dentro de cada dominio realizamos distintas consultas para obtener la información necesaria unidas entre sí con Inner Join múltiples. Obtenemos el total de emisiones de dicho dominio, y lo utilizamos para calcular el porcentaje de emisines del usuario. Este porcentaje lo redondeamos con la función round y lo concatenamos con el símbolo de porcentaje utilizando || '%'. A su vez obtenemos el nombre de la categoría más vista con la función max, y realizando un join entre Visualización, Contenido y Categoria para obtener su nombre. A todas estas subconsultas les asignamos el nombre de columna correspondiente y agrupamos los resultados según ellas.
### Casos de prueba
