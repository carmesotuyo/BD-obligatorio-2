# Base de Datos 1
## Obligatorio 2
| Carmela Sotuyo (186554) -  Fernando Spillere (274924) |
|------|
| Grupo M3A - AN |
| Docentes: Juan Manuel Rodríguez Picón - Renso Sánchez |
| 23 de junio de 2022 |
| Licenciatura en Sistemas |
| Universidad ORT Uruguay |

## Ejercicio 1
### Script SQL
```
agregar script final
```
### Resultado obtenido

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

### Algebra relacional
  
### Justificación

## Ejercicio 4
### Script SQL
```
agregar script final
```
### Resultado obtenido

### Algebra relacional
  
### Justificación

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
