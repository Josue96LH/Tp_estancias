unit Menu_listado_adicional1;
interface
uses crt,provincias1,estancias1,menu_estancias1,dos,validacion1,mensajes1;

var arch:estancia; arch_p:provincia;

procedure menu_listados();

implementation

procedure datos_1 (x,y:integer);
begin
      gotoxy(x,y-1); writeln('----------------------------------------------------------------------');
      gotoxy(x,y); writeln  ('-------------------- Ingrese los siguientes datos --------------------');
      gotoxy(x,y+1); writeln('----------------------------------------------------------------------');
      gotoxy(x,y+2); writeln('|                            ID Provincia                            |');
      gotoxy(x,y+3); writeln('----------------------------------------------------------------------');
end;  

procedure si_existe_provincia (var arch_p:provincia; var id_p:integer; x,y:integer);
var op:char; pos:integer;reg_p:t_provincia;
begin
     abrir_provincia(arch_p);
     repeat
     begin
          validacion_entero(id_p,10,x,y);
          buscar_provincia_id(arch_p,reg_p,pos,id_p);
          if pos = (-1) then
          begin
               gotoxy (x,y);writeln('                                             ');
               repeat
               begin
                    gotoxy (x,y);writeln('Error provincia inexistente | ENTER - Continuar'); gotoxy (x+48,y); op:=readkey;
                    gotoxy (x,y);writeln('                                                 ');
               end;
               until op = #13;
          end
          else
          begin
               if reg_p.activo then
               begin
                    reg.id_provincia_ubi:=id_p;
               end
               else
               begin
                    gotoxy (x,y);writeln('                                              ');
                    repeat
                    begin
                         gotoxy (x,y);writeln('Error provincia dada de baja | ENTER - Continuar'); gotoxy (x+49,y); op:=readkey;
                         gotoxy (x,y);writeln('                                                      ');
                    end;
                    until op = #13;
               end;
          end;
     end;
     until ((pos<>-1) and (reg_p.activo=true));
     close (arch_p);
end;

procedure mostrar_estancia_listado (reg:t_estancia; p,p_2:integer);
var x:integer;
begin
     x:=5;
     with reg do
     begin
          if reg.activo then
          begin
               textcolor (yellow);
               textbackground (blue);
               gotoxy(x-2,p+5); writeln(p_2);
               gotoxy(x+2,p+5); writeln('                                                                                                                                                        ');
               gotoxy(x+2,p+5); writeln('|');gotoxy(x+4,p+5); writeln(id_estancia);
               gotoxy(x+16,p+5); writeln('|');gotoxy(x+18,p+5); writeln(id_provincia_ubi);
               gotoxy(x+32,p+5); writeln('|');gotoxy(x+34,p+5); writeln(nom_estancia);
               gotoxy(x+50,p+5); writeln('|');gotoxy(x+52,p+5); writeln(numero_contacto_estancia);
               gotoxy(x+68,p+5); writeln('|');gotoxy(x+70,p+5); writeln(email_contacto_estancia);
               gotoxy(x+88,p+5); writeln('|');gotoxy(x+90,p+5); writeln(caracteristicas_estancia);
               gotoxy(x+105,p+5); writeln('|');gotoxy(x+107,p+5); writeln(piscina_estancia);
               {gotoxy(x+112,p+5); writeln('|');gotoxy(x+114,p+5); writeln(capacidad_maxima);
               gotoxy(x+120,p+5); writeln('|');gotoxy(x+122,p+5); writeln(nomyap_dueno);
               gotoxy(x+130,p+5); writeln('|');gotoxy(x+132,p+5); writeln(dni_dueno);
               gotoxy(x+140,p+5); writeln('|');gotoxy(x+142,p+5); writeln(domicilio);  }
               gotoxy(x+153,p+5); writeln('|');
               gotoxy(x+2,p+6); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
          end;
     end;
end;

procedure listado_estancia_alfabetico(var arch:estancia);
var reg:t_estancia; pos:integer; p,p_2:integer; x,y:integer; op:char;
begin
     abrir_estancia(arch);
     ordenar_estancia_alfabetico(arch);
     p:=1;
     p_2:=0;
     pos:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          textbackground (blue);clrscr;
          textcolor (yellow);
          gotoxy(x,p+1); writeln ('------------------------------------------------------------------- Estancias ---------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('| ID Estancia | ID Provincia  | Nombre Estancia | Numero Contacto | Email de Contacto | Caracteristica | Piscina | Capacidad Maxima |  Nombre Dueño  | DNI Dueño |   Domicilio   |');
          gotoxy(x,p+4); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                  ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay estancias para mostrar');
               gotoxy(x+143,p+5); writeln('|');
               gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');;
               repeat
               begin
                    gotoxy (x,9);textcolor (blue);
                    textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,9); op:=readkey;
               end;
               until op = #27;
          end
          else
          begin
               seek (arch,0);
               repeat
               begin
                    p:=1;
                    textbackground (blue);clrscr;
                    textcolor (yellow);
                    gotoxy(x,p+1); writeln  ('------------------------------------------------------------------- Estancias ---------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('| ID Estancia | ID Provincia  | Nombre Estancia | Numero Contacto | Email de Contacto | Caracteristica | Piscina | Capacidad Maxima |  Nombre Dueño  | DNI Dueño |   Domicilio   |');
                    Gotoxy(x,p+4); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=20) do
                    begin
                         leer_estancia(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            p:=p-4;
                         end
                         else
                             inc (p_2);
                         mostrar_estancia_listado(reg,p,p_2);
                         p:=p+4;
                         y:=p;
                    end;
                    if eof (arch) then
                    begin
                         repeat
                         begin
                              gotoxy (x,y+9);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
                         end;
                         until op = #27;
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y+7);textcolor (white);
                              textbackground (black); writeln('|1| - Continuar con los 5 proximos registros');
                              gotoxy (x,y+9);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
                         end;
                         until op in ['1',#27];
                    end;
               end;
               until op = #27;
           end;
      end;
      until op = #27;
      close (arch);
end;

procedure listado_estancia_piscina(var arch:estancia);
var reg:t_estancia; pos:integer; a,p,p_2:integer; x,y:integer; op:char;
begin
     abrir_estancia(arch);
     ordenar_estancia(arch);
     seek (arch,0);
     p:=1;
     a:=0;
     p_2:=0;
     pos:=0;
     x:=7;
     repeat
     begin
          gotoxy(x,p); writeln  ('---------------------------------------------------------------------------------- Estancias -------------------------------------------------------------------------------------');
          gotoxy(x,p+1); writeln('----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('| ID Estancia | ID Provincia  | Nombre Estancia | Numero Contacto | Email de Contacto | Caracteristica | Piscina | Capacidad Maxima |  Nombre Dueño  | DNI Dueño |   Domicilio   |');
          gotoxy(x,p+3); writeln('----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                  ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay estancia para mostrar');
               gotoxy(x+143,p+5); writeln('|');
               gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
               repeat
               begin
                    gotoxy (x,11); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,11); op:=readkey;
               end;
               until op = #27;
          end
          else
          begin
               seek (arch,0);
               repeat
               begin
                    p:=1;
                    clrscr;
                    gotoxy(x,p); writeln('---------------------------------------------------------------------------------- Estancias -------------------------------------------------------------------------------------');
                    gotoxy(x,p+1); writeln('----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('| ID Estancia | ID Provincia  | Nombre Estancia | Numero Contacto | Email de Contacto | Caracteristica | Piscina | Capacidad Maxima |  Nombre Dueño  | DNI Dueño |   Domicilio   |');
                    gotoxy(x,p+3); writeln('----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=20) do
                    begin
                        leer_estancia(arch,pos,reg);
                        inc(pos);
                        if ('SI' = reg.piscina_estancia) and (reg.activo) then
                        begin                           
                            inc (p_2);
                            mostrar_estancia_listado(reg,p,p_2);
                            inc(a);   
                        end
                        else
                        	p:=p-4;

                        if eof(arch) and (a=0) then
                        begin
                            p:=1;
                            gotoxy(x,p+5); writeln('                                                                                                                                                  ');
                            gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay estancias para mostrar');
                            gotoxy(x+143,p+5); writeln('|');
                            gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                        end;

                         p:=p+4;
                         y:=p;
                    end;

                    if eof (arch) then
                    begin
                         repeat
                         begin
                              gotoxy (x,y+7); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+7); op:=readkey;
                         end;
                         until op = #27;
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y+7); writeln('|1| - Continuar con los 5 proximos registros');
                              gotoxy (x,y+9); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
                         end;
                         until op in ['1',#27];
                    end;
               end;
               until op = #27;
           end;
      end;
      until op = #27;
      close (arch);
end;

procedure Listado_estancias_provincia (var arch:estancia; id_p:integer);
var reg:t_estancia; pos:integer; a,p,p_2:integer; x,y:integer; op:char;
begin
     clrscr;
     abrir_estancia(arch);
     ordenar_estancia (arch);
     seek (arch,0);
     p:=1;
     p_2:=0;
     a:=0;
     pos:=0;
     op:=' ';
     x:=7;
     repeat
     begin
          textcolor (yellow);
          textbackground (blue);
          gotoxy(x,p); writeln  ('---------------------------------------------------------------------------------- Estancias -------------------------------------------------------------------------------------');
          gotoxy(x,p+1); writeln('----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+2); writeln('| ID Estancia | ID Provincia  | Nombre Estancia | Numero Contacto | Email de Contacto | Caracteristica | Piscina | Capacidad Maxima |  Nombre Dueño  | DNI Dueño |   Domicilio   |');
          gotoxy(x,p+3); writeln('----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5); writeln('                                                                                                                                                  ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay ventas para mostrar');
               gotoxy(x+145,p+5); writeln('|');
               gotoxy(x,p+6); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------');
               repeat
               begin
                    gotoxy (x,8);textcolor (blue);
                    textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,8); op:=readkey;
               end;
               until op = #27;
          end
          else
          begin
               seek (arch,0);
               repeat
               begin
                    p:=1;
                    textbackground (blue);clrscr;
                    textcolor (yellow);
                    gotoxy(x,p); writeln  ('---------------------------------------------------------------------------------- Estancias -------------------------------------------------------------------------------------');
                    gotoxy(x,p+1); writeln('----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+2); writeln('| ID Estancia | ID Provincia  | Nombre Estancia | Numero Contacto | Email de Contacto | Caracteristica | Piscina | Capacidad Maxima |  Nombre Dueño  | DNI Dueño |   Domicilio   |');
                    gotoxy(x,p+3); writeln('----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=5) do
                    begin
                         leer_estancia(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) or (id_p<>reg.id_provincia_ubi) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);

                         if (id_p=reg.id_provincia_ubi) and (reg.activo) then
                         begin
                            mostrar_estancia_listado(reg,p,p_2);
                            inc(a);   
                         end;

                        if eof(arch) and (a=0) then
                        begin
                            p:=1;
                            gotoxy(x,p+5); writeln('                                                                                                                                                  ');
                            gotoxy(x,p+5); writeln('|');gotoxy(x+60,p+5); writeln('No hay estancias para mostrar');
                            gotoxy(x+143,p+5); writeln('|');
                            gotoxy(x,p+6); writeln('------------------------------------------------------------------------------------------------------------------------------------------------');
                        end;

                         inc(p);
                         y:=p;
                    end;
                    if eof (arch) then
                    begin
                         repeat
                         begin
                              gotoxy (x,y+8);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+8); op:=readkey;
                         end;
                         until op in ['2','3',#27];
                    end;
               end;
               until op = #27;
           end;
      end;
      until op = #27;
      close (arch);
end;

Procedure Estancias_provincia (var arch:estancia; var arch_p:provincia);
var x,y:integer; id_p:integer; op:char;
begin
     clrscr;
     x:=46;
     y:=14;
     op:=' ';
     repeat
     begin
          datos_1 (x,y);
          si_existe_provincia(arch_p,id_p,x+2,y+4);
          gotoxy(x+69,y+4); writeln('|');
          repeat
          begin
               gotoxy (x,y+7); writeln ('|ENTER| - continuar');
               gotoxy (x,y+9); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;
          end;
          until op in [#13,#27];
          if op = #13 then
             Listado_estancias_provincia(arch,id_p);
     end;
     until op in [#13,#27];
end; 

procedure menu_listados();
var op:char; x,y:integer;
begin
     x:=42;
     y:=12;
     clrscr;
     repeat
     begin
          repeat
          begin
               textbackground(blue);clrscr;
               textcolor (lightgreen);
               gotoxy (x,y);writeln('-------------------------------------------------------------------');
               gotoxy (x,y+1);writeln('|');
               gotoxy (x+66,y+1);writeln('|');
               gotoxy (x,y+2);writeln('|');
               gotoxy (x+23,y+2);writeln('Informacion Adicional');
               gotoxy (x+66,y+2);writeln('|');
               gotoxy (x,y+3);writeln('|');
               gotoxy (x+66,y+3);writeln('|');
               gotoxy (x+1,y+4);writeln('-----------------------------------------------------------------');
               gotoxy (x,y+5);writeln('|');
               gotoxy (x+66,y+5);writeln('|');
               gotoxy (x,y+6);writeln('|');
               gotoxy (x+2,y+6);writeln('1 - Listado alfabetico');
               gotoxy (x+66,y+6);writeln('|');
               gotoxy (x,y+7);writeln('|');
               gotoxy (x+66,y+7);writeln('|');
               gotoxy (x+1,y+8);writeln('-----------------------------------------------------------------');
               gotoxy (x,y+9);writeln('|');
               gotoxy (x+66,y+9);writeln('|');
               gotoxy (x,y+10);writeln('|');
               gotoxy (x+2,y+10);writeln('2 - Listado piscina');
               gotoxy (x+66,y+10);writeln('|');
               gotoxy (x,y+11);writeln('|');
               gotoxy (x+66,y+11);writeln('|');
               gotoxy (x+1,y+12);writeln('-----------------------------------------------------------------');
               gotoxy (x,y+13);writeln('|');
               gotoxy (x+66,y+13);writeln('|');
               gotoxy (x,y+14);writeln('|');
               gotoxy (x+2,y+14);writeln('3 - Listado de estancias de una provincia');
               gotoxy (x+66,y+14);writeln('|');
               gotoxy (x,y+15);writeln('|');
               gotoxy (x+66,y+15);writeln('|');
               gotoxy (x+1,y+16);writeln('-----------------------------------------------------------------');
               gotoxy (x,y+17);writeln('|');
               gotoxy (x+66,y+17);writeln('|');
               gotoxy (x,y+18);writeln('|');
               gotoxy (x+17,y+18);textbackground (white);textcolor (blue);writeln('|ESC| - Regresar al menu anterior'); textcolor (lightgreen); textbackground (9);
               gotoxy (x+66,y+18);writeln('|');
               gotoxy (x,y+19);writeln('|');
               gotoxy (x+66,y+19);writeln('|');
               gotoxy (x,y+20);writeln('-------------------------------------------------------------------');
               gotoxy (x+57,y+18);op:=readkey;
          end;
          until op in ['1','2','3',#27];
          case op of
               '1':listado_estancia_alfabetico(arch);
               '2':listado_estancia_piscina(arch);
               '3':Estancias_provincia(arch,arch_p);
          end;
    end;
    until op = #27;
end;
begin

end.
