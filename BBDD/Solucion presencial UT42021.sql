/*select nombre, oficio from trabajador;*/

/*select dir from edificio where nivel_calidad <=1;*/

/*select avg(tarifa) from trabajador where oficio='fontanero';*/

/*select count(*) from asignacion where num_dias >15;*/

/*select nombre from trabajador where (tarifa>=10) and (tarifa <=12);*/

/*select nombre, oficio from trabajador where tarifa between 11 and 14 ORDER BY oficio DESC, nombre ASC;*/

/*select nombre FROM trabajador, asignacion WHERE (trabajador.id_t= asignacion.id_t) AND num_dias= 8;*/

/*select dir from edificio, asignacion where (edificio.id_e = asignacion.id_e) AND fecha_inicio = DATE '2001-10-17';*/

/*select  distinct oficio from trabajador, asignacion where (trabajador.id_t =asignacion.id_t) AND asignacion.id_e = 435;*/

/*select  t1.nombre AS trabajador, t2.nombre AS supervisor  FROM trabajador t1, trabajador t2 where (t1.id_supv = t2.id_t);*/

/*select nombre from trabajador, asignacion, edificio 
            where (trabajador.id_t=asignacion.id_t) 
                AND (asignacion.id_e = edificio.id_e) 
                and edificio.tipo = 'OFICINA';
*/

/*select SUM(asignacion.num_dias) from trabajador, asignacion where
                (trabajador.id_t = asignacion.id_t) AND
               (trabajador.oficio = 'FONTANERO') AND
               asignacion.id_e= 312;*/
               

/*select distinct oficio from trabajador;*/


/*select nombre from trabajador where 
    tarifa < (select avg(tarifa) from trabajador);
*/
