--Ejercicio 1
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
                    and v2.fecha >= DATE '2022-04-01'
                    and v2.fecha <= DATE '2022-04-30'
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
select cat.nombreCategoria
from CONTENIDO con, CATEGORIA cat
where con.codCategoria = cat.codCategoria
and con.dominio = 'PUBLICO'
and sysdate - con.fechaEmision = 15
and con.codCategoria in (select c1.codCategoria
                        from CONTENIDO c1
                        where c1.dominio = 'PUBLICO'
                        and sysdate - c1.fechaEmision = 15
                        and c1.codContenido in (select v2.codContenido
                                                from VISUALIZACION v2, CONTENIDO c4
                                                where v2.codContenido = c4.codContenido
                                                and c4.dominio = 'PUBLICO'
                                                and sysdate - c4.fechaEmision = 15
                                                group by v2.codContenido
                                                having count(*) = ( select max(count(*))
                                                                    from VISUALIZACION v, CONTENIDO c3
                                                                    where v.codContenido = c3.codContenido
                                                                    and c3.dominio = 'PUBLICO'
                                                                    and sysdate - c3.fechaEmision = 15
                                                                    group by v.codContenido ))
                        group by c1.codCategoria
                        having count(*) = ( select min(count(*))
                                            from CONTENIDO c2
                                            where c2.dominio = 'PUBLICO'
                                            and sysdate - c2.fechaEmision = 15
                                            group by c2.codCategoria));
--Ejercicio 10
select con.dominio, u.nombre as nombreUsuario, count(*) cantEmisiones, prcEmisiones, nombreCategoria
from CONTENIDO con 
inner join USUARIO u 
on con.emailUsuario = u.email 
and con.dominio = 'PRIVADO'
inner join (select distinct(c.emailUsuario) as emailUsuarioPrc, 
                    round(((select count(*) cantEmisiones
                            from CONTENIDO c2
                            where c2.dominio = 'PRIVADO'
                            and c2.emailUsuario = c.emailUsuario
                            group by c2.emailUsuario) / (select count(*) totalEmisiones
                                                        from CONTENIDO c3
                                                        where c3.dominio = 'PRIVADO'
                                                        group by c3.dominio) * 100), 0) || '%' as prcEmisiones
            from CONTENIDO c
            where round(((select count(*) cantEmisiones
                        from CONTENIDO c4
                        where c4.dominio = 'PRIVADO'
                        and c4.emailUsuario = c.emailUsuario
                        group by c4.emailUsuario) / (select count(*) totalEmisiones
                                                    from CONTENIDO c5
                                                    where c5.dominio = 'PRIVADO'
                                                    group by c5.dominio) * 100), 0) is not NULL )
                                           
on emailUsuarioPrc = con.emailUsuario
inner join (select cat.nombreCategoria as nombreCategoria
            from VISUALIZACION v, CONTENIDO c, CATEGORIA cat
            where v.codContenido = c.codContenido
            and c.codCategoria = cat.codCategoria
            and c.dominio = 'PRIVADO'
            group by cat.nombreCategoria
            having count(*) = (select max(count(*))
                                from VISUALIZACION v, CONTENIDO c
                                where v.codContenido = c.codContenido
                                and c.dominio = 'PRIVADO'
                                group by c.codCategoria))
on nombreCategoria is not NULL
group by con.dominio, u.nombre, prcEmisiones, nombreCategoria


union


select con.dominio, u.nombre as nombreUsuario, count(*) cantEmisiones, prcEmisiones, nombreCategoria
from CONTENIDO con 
inner join USUARIO u 
on con.emailUsuario = u.email 
and con.dominio = 'PUBLICO'
inner join (select distinct(c.emailUsuario) as emailUsuarioPrc, 
                    round(((select count(*) cantEmisiones
                            from CONTENIDO c2
                            where c2.dominio = 'PUBLICO'
                            and c2.emailUsuario = c.emailUsuario
                            group by c2.emailUsuario) / (select count(*) totalEmisiones
                                                        from CONTENIDO c3
                                                        where c3.dominio = 'PUBLICO'
                                                        group by c3.dominio) * 100), 0) || '%' as prcEmisiones
            from CONTENIDO c
            where round(((select count(*) cantEmisiones
                        from CONTENIDO c4
                        where c4.dominio = 'PUBLICO'
                        and c4.emailUsuario = c.emailUsuario
                        group by c4.emailUsuario) / (select count(*) totalEmisiones
                                                    from CONTENIDO c5
                                                    where c5.dominio = 'PUBLICO'
                                                    group by c5.dominio) * 100), 0) is not NULL )
                                           
on emailUsuarioPrc = con.emailUsuario
inner join (select cat.nombreCategoria as nombreCategoria
            from VISUALIZACION v, CONTENIDO c, CATEGORIA cat
            where v.codContenido = c.codContenido
            and c.codCategoria = cat.codCategoria
            and c.dominio = 'PUBLICO'
            group by cat.nombreCategoria
            having count(*) = (select max(count(*))
                                from VISUALIZACION v, CONTENIDO c
                                where v.codContenido = c.codContenido
                                and c.dominio = 'PUBLICO'
                                group by c.codCategoria))
on nombreCategoria is not NULL
group by con.dominio, u.nombre, prcEmisiones, nombreCategoria;
