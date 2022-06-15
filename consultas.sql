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
select u.nickname 
from USUARIO u
where u.email in (  select d.emailDestino
                    from DONACION d
                    where d.estadoDonacion = 'PENDIENTE'
                    and d.fechaCreacion > DATE '2021-10-10'
                    and d.emailDestino in ( select distinct(d.emailOrigen)
                                            from DONACION d, DONACION do
                                            where d.emailOrigen = do.emailOrigen
                                            and d.emailDestino < do.emailDestino
                                            and d.fechaCreacion > DATE '2021-10-10'
                                            and do.fechaCreacion > DATE '2021-10-10' )
                    group by d.emailDestino
                    having count(*) > 1 );
--Ejercicio 5
select u.email, u.nickname
from USUARIO u
where (sysdate - u.fechaNac)/365 > 18
and not exists (select 1
                from CATEGORIA cat
                where not exists ( select 1
                                    from CONTENIDO c
                                    where c.dominio = 'PUBLICO'
                                    and c.emailUsuario = u.email
                                    and c.codCategoria = cat.codCategoria) )
--Ejercicio 6
select emailOrigen, emailDestino, fechaAcreditacion Fecha, estadoDonacion
from DONACION, USUARIO u, USUARIO us
where u.email <> us.email
and length(u.nickname) >= 5
and length(us.nickname) >= 5
and u.email = emailOrigen 
and us.email in emailDestino
and estadoDonacion = 'APROBADA'

union

select emailOrigen, emailDestino, fechaAcreditacion Fecha, 'Transacción programada' estadoDonacion
from DONACION, USUARIO u, USUARIO us
where u.email <> us.email
and length(u.nickname) >= 5
and length(us.nickname) >= 5
and u.email = emailOrigen 
and us.email in emailDestino
and estadoDonacion = 'PENDIENTE';
--Ejercicio 7

--Ejercicio 8
select u.nombre, u.fechaNac
from USUARIO u
where u.email in (  select u2.email 
                    from USUARIO u2, VISUALIZACION v2
                    where u2.email = v2.emailUsuario
                    having count(*) = ( select max(count(*)) 
                                        from VISUALIZACION v
                                        where v.fecha >= DATE '2022-04-01'
                                        and v.fecha <= DATE '2022-04-30'
                                        group by v.emailUsuario)
                    group by u2.email   )
and u.email not in (select distinct(u3.email)
                    from USUARIO u3, DONACION d
                    where u3.email = d.emailDestino);
--Ejercicio 9

--Ejercicio 10
