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

## Ejercicio 1
### Script SQL
```
agregar script final
```
### Resultado obtenido
opcion 1
![Captura de Pantalla 2022-06-14 a la(s) 10 30 52](https://user-images.githubusercontent.com/101828758/173589297-54e6521e-9f6a-4d94-8735-d9ec36933a3e.png)
opcion 2
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

### Algebra relacional

### Justificación

## Ejercicio 6
### Script SQL
```
agregar script final
```
### Resultado obtenido

### Algebra relacional

### Justificación

## Ejercicio 7
### Script SQL
```
agregar script final
```
### Resultado obtenido

### Algebra relacional

### Justificación

## Ejercicio 8
### Script SQL
```
agregar script final
```
### Resultado obtenido

### Algebra relacional

### Justificación

## Ejercicio 9
### Script SQL
```
agregar script final
```
### Resultado obtenido

### Algebra relacional

### Justificación

## Ejercicio 10
### Script SQL
```
agregar script final
```
### Resultado obtenido

### Algebra relacional

### Justificación
