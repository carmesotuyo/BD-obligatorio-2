--Ejercicio 1
select distinct(u.email), u.nickname
from USUARIO u, CONTENIDO cont
where u.email = cont.emailUsuario
and cont.fechaEmision >= DATE '2022-05-01'
and cont.fechaEmision <= DATE '2022-05-31'
and cont.emailUsuario in (  (select c.emailUsuario from CONTENIDO c 
                            inner join CATEGORIA cat
                            on c.codCategoria = cat.codCategoria
                            and cat.nombreCategoria = 'Musica'

                            union

                            select c.emailUsuario from CONTENIDO c 
                            inner join CATEGORIA cat
                            on c.codCategoria = cat.codCategoria
                            and cat.nombreCategoria = 'Fortnite')

                            minus

                            (select c.emailUsuario from CONTENIDO c 
                            inner join CATEGORIA cat
                            on c.codCategoria = cat.codCategoria
                            and cat.nombreCategoria = 'Musica'

                            intersect

                            select c.emailUsuario from CONTENIDO c 
                            inner join CATEGORIA cat
                            on c.codCategoria = cat.codCategoria
                            and cat.nombreCategoria = 'Fortnite') 
                        );
--opcion 2:
select distinct(u.email), u.nickname
from USUARIO u
where u.email in (  (select c.emailUsuario from CONTENIDO c 
                            inner join CATEGORIA cat
                            on c.codCategoria = cat.codCategoria
                            and cat.nombreCategoria = 'Musica'
                            and c.fechaEmision >= DATE '2022-05-01'
                            and c.fechaEmision <= DATE '2022-05-31'

                            union

                            select c.emailUsuario from CONTENIDO c 
                            inner join CATEGORIA cat
                            on c.codCategoria = cat.codCategoria
                            and cat.nombreCategoria = 'Fortnite'
                            and c.fechaEmision >= DATE '2022-05-01'
                            and c.fechaEmision <= DATE '2022-05-31')

                            minus

                            (select c.emailUsuario from CONTENIDO c 
                            inner join CATEGORIA cat
                            on c.codCategoria = cat.codCategoria
                            and cat.nombreCategoria = 'Musica'
                            and c.fechaEmision >= DATE '2022-05-01'
                            and c.fechaEmision <= DATE '2022-05-31'

                            intersect

                            select c.emailUsuario from CONTENIDO c 
                            inner join CATEGORIA cat
                            on c.codCategoria = cat.codCategoria
                            and cat.nombreCategoria = 'Fortnite'
                            and c.fechaEmision >= DATE '2022-05-01'
                            and c.fechaEmision <= DATE '2022-05-31') 
                        );

--Ejercicio 2
select cont.titulo 
from CONTENIDO cont, CATEGORIA cat, VISUALIZACION v
where cat.nombreCategoria = 'Musica'
and cont.codCategoria = cat.codCategoria
and cont.dominio = 'PRIVADO'
and cont.codContenido = v.codContenido
and v.fecha >= DATE '2022-05-01'
and v.fecha <= DATE '2022-05-31'
and cont.emailUsuario <> v.emailUsuario;

--Ejercicio 3
select cont.titulo, u.email, u.nickname
from CATEGORIA cat, CONTENIDO cont, USUARIO U
where cat.nombreCategoria = 'LoL'
and cat.codCategoria = cont.codCategoria
and cont.emailUsuario = u.email
and cont.dominio = 'PUBLICO'
and cont.codContenido in (  select distinct (codContenido) 
                            from VISUALIZACION              )
and cont.fechaEmision in (  select min(fechaEmision)
                            from CONTENIDO con, CATEGORIA ca
                            where ca.nombreCategoria = 'LoL'
                            and ca.codCategoria = con.codCategoria
                            and con.dominio = 'PUBLICO'
                            and con.codContenido in (   select distinct (codContenido) 
                                                        from VISUALIZACION)             );
																												
--Ejercicio 4

--Ejercicio 5

--Ejercicio 6

--Ejercicio 7

--Ejercicio 8

--Ejercicio 9

--Ejercicio 10
