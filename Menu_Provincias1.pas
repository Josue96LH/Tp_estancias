unit Menu_Provincias1;
interface

uses crt,dos,provincias1,validacion1,mensajes1;

var arch:provincia;

procedure menu_provincias();

implementation

procedure datos (x,y:integer);
begin
     textcolor (yellow);
     textbackground (blue);
     gotoxy(x,y); writeln  ('--------------------------------------------- Provincia ------------------------------------------------------');
     gotoxy(x,y+1); writeln('--------------------------------------------------------------------------------------------------------------');
     gotoxy(x,y+2); writeln('|      ID Provincia      |      Nombre Provincia      |      Denominacion      |      Telefono Ministro      |');
     gotoxy(x,y+3); writeln('--------------------------------------------------------------------------------------------------------------');
end;

procedure mostrar_provincia(reg:t_provincia; x,y:integer);
begin
    datos (x,y);
    with reg do
    begin
         datos(x,y);
         gotoxy(x+2,y+4);textcolor (yellow);
         textbackground (blue); writeln('                                                                                                          ');
         gotoxy(x,y+4); writeln('|');gotoxy(x+2,y+4); writeln(id_provincia);
         gotoxy(x+25,y+4); writeln('|');gotoxy(x+27,y+4); writeln(nombre_provincia);
         gotoxy(x+54,y+4); writeln('|');gotoxy(x+56,y+4); writeln(denominacion);
         gotoxy(x+79,y+4); writeln('|');gotoxy(x+81,y+4); writeln(telef_ministro_turismo);
         gotoxy(x+109,y+4); writeln('|');
         gotoxy(x,y+5); writeln('--------------------------------------------------------------------------------------------------------------');
    end;
end;

procedure mostrar_provincia_listado (var reg:t_provincia; p,p_2:integer);
var x:integer;
begin
     textcolor (yellow);
     textbackground (blue);
     x:=5;
     with reg do
     begin
          if reg.activo then
          begin
               gotoxy(x-2,p+5); writeln(p_2);
               gotoxy(x+2,p+5); writeln('                                                                                                             ');
               gotoxy(x+2,p+5); writeln('|');gotoxy(x+4,p+5); writeln(id_provincia);
               gotoxy(x+27,p+5); writeln('|');gotoxy(x+29,p+5); writeln(nombre_provincia);
               gotoxy(x+56,p+5); writeln('|');gotoxy(x+58,p+5); writeln(denominacion);
               gotoxy(x+81,p+5); writeln('|');gotoxy(x+83,p+5); writeln(telef_ministro_turismo);
               gotoxy(x+111,p+5); writeln('|');
               gotoxy(x+2,p+6); writeln('--------------------------------------------------------------------------------------------------------------');
          end;
     end;
end;

procedure Listado_provincia_5 (var arch:provincia; var op:char);
var reg:t_provincia; pos:integer; p,p_2:integer; x,y:integer;
begin
     textbackground (blue);
     p:=1;
     p_2:=0;
     pos:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          textcolor (yellow);
          textbackground (blue);
          gotoxy(x,p+1); writeln('--------------------------------------------- Provincia ------------------------------------------------------');
          gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('|      ID Provincia      |      Nombre Provincia      |      Denominacion      |      Telefono Ministro      |');
          gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5);textcolor (yellow);
               textbackground (blue); writeln('                                                                   ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+35,p+5); writeln('No hay provincia para mostrar');
               gotoxy(x+99,p+5); writeln('|');
               gotoxy(x,p+6); writeln('----------------------------------------------------------------------------------------------------------');
               repeat
               begin
                    gotoxy(x,9);textcolor (white);
                    textbackground (black); writeln('|2| - Alta ');
                    gotoxy (x,11);textbackground (white);textcolor (blue); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,11); op:=readkey;clrscr;
               end;
               until op in ['2',#27];
          end
          else
          begin
               seek (arch,0);
               repeat
               begin
                    p:=1;
                    textbackground (blue);clrscr;
                    gotoxy(x,p);textcolor (yellow);
                    gotoxy(x,p+1);writeln('--------------------------------------------- Provincia ------------------------------------------------------');
                    gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|      ID Provincia      |      Nombre Provincia      |      Denominacion      |      Telefono Ministro      |');
                    gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=24) do
                    begin
                         leer_provincia(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);
                         mostrar_provincia_listado(reg,p,p_2);
                         inc(p);
                         y:=p;
                    end;
                    if eof (arch) then
                    begin
                         repeat
                         begin
                              gotoxy(x,y+9);textcolor (white);
                              textbackground (black); writeln('|2| - Alta ');
                              gotoxy (x,y+11);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+11); op:=readkey;
                         end;
                         until op in ['2',#27];
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y+7);textcolor (white);
                              textbackground (black); writeln('|1| - Continuar con los 5 proximos registros');
                              gotoxy(x,y+9); writeln('|2| - Alta ');
                              gotoxy (x,y+11);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+11); op:=readkey;
                         end;
                         until op in ['1','2',#27];
                    end;
               end;
               until op in ['2',#27];
           end;
      end;
      until op in ['2',#27];
end;

procedure listado_provincia_nombre (var arch:provincia; buscado:string);
var reg:t_provincia; pos:integer; p,p_2:integer; x,y:integer; op:char;
begin
     p:=1;
     p_2:=0;
     pos:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          gotoxy(x,p+0);textcolor (yellow);
          gotoxy(x,p+1); writeln  ('--------------------------------------------- Provincia ------------------------------------------------------');
          gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('|      ID Provincia      |      Nombre Provincia      |      Denominacion      |      Telefono Ministro      |');
          gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5);textcolor (yellow);
               textbackground (blue); writeln('                                                                   ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+35,p+5); writeln('No hay provincia para mostrar');
               gotoxy(x+99,p+5); writeln('|');
               gotoxy(x,p+6); writeln('----------------------------------------------------------------------------------------------------------');
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
                    gotoxy(x,p+0);textcolor (yellow);
                    gotoxy(x,p+1);writeln  ('--------------------------------------------- Provincia ------------------------------------------------------');
                    gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|      ID Provincia      |      Nombre Provincia      |      Denominacion      |      Telefono Ministro      |');
                    gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=24) do
                    begin
                         leer_provincia(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);
                         if reg.nombre_provincia = buscado then
                            mostrar_provincia_listado(reg,p,p_2);
                         inc(p);
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
end;

procedure alta_provincia(var arch:provincia);
var dni:integer; pos:integer; op:char; reg:t_provincia; cond:char; x,y:integer;
begin
     op:=' ';
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_provincia(arch);
     listado_provincia_5 (arch,op);
     if op <> #27 then
     repeat
     begin
          textbackground (blue);clrscr;
          datos (x,y);
          validacion_dni (dni,x+2,y+4);
          buscar_provincia_id(arch,reg,pos,dni);
          if pos = (-1) then
          begin
              with reg do
              begin
                  id_provincia:=dni;
                  validacion_string (nombre_provincia,38,x+27,y+4);
                  validacion_entero (denominacion,38,x+56,y+4);
                  validacion_entero (telef_ministro_turismo,38,x+81,y+4);
                  activo:=true;   
              end;
              repeat
              begin
                  textbackground (blue);clrscr;
                  mostrar_provincia(reg,x,y);
                  gotoxy (x,y+7);textcolor (white);
                  textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                  gotoxy (x+34,y+7); cond:=readkey;
              end;
              until cond in ['S','s','N','n'];
              
              if (cond = 'S') or (cond = 's') then
              begin
                  Guardar_provincia(arch,reg);
                  msj_exitoso (op,x,y);
              end
              else
              begin
                  msj_cancelado (op,x,y);
              end;
          end
          else
          begin
              leer_provincia(arch,pos,reg);
              if reg.activo then
              begin

                  repeat
                  begin
                      gotoxy (x,y-2);textcolor (white);
                      textbackground (black); writeln ('Provincia existente:');
                      mostrar_provincia(reg,x,y);
                      gotoxy (x,y+7);textcolor (blue);
                      textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+7); op:=readkey;
                  end;
                  until op = #27;
              end
              else
              begin
                  textbackground (blue);clrscr;
                  repeat
                  begin
                      gotoxy (x,y-2);textcolor (white);
                      textbackground (black); writeln ('Provincia dada de baja:');;
                      mostrar_provincia(reg,x,y);
                      gotoxy (x,y+7);textcolor (white);
                      textbackground (black); writeln ('|1| - Reactivar');
                      gotoxy (x,y+9);textbackground (white);textcolor (blue); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+9); op:=readkey;
                  end;
                  until op in ['1',#27];
                  if op = '1' then
                  begin
                      reg.activo:=true;
                      repeat
                      begin
                          textbackground (blue);clrscr;
                          mostrar_provincia(reg,x,y);
                          gotoxy (x,y+7);textcolor (white);
                          textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                          gotoxy (x+34,y+7); cond:=readkey;
                      end;
                      until cond in ['S','N','s','n'];
                      if (cond = 'S') or (cond = 's') then
                      begin
                          modificar_prov (arch,pos,reg);
                          msj_exitoso (op,x,y);
                      end
                      else
                      begin
                          msj_cancelado (op,x,y);
                      end;
                  end
                  else
              end;
          end;
      end;
      until op=#27;
      close (arch);
end;

procedure baja_provincia(var arch:provincia);
var dni:integer; pos:integer; op:char; reg:t_provincia; cond:char; x,y:integer;
begin
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_provincia(arch);
     menu_confirmacion(op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_dni (dni,x+2,y+4);
             buscar_provincia_id (arch,reg,pos,dni);
             if pos = (-1) then
             begin
                  msj_inexistente (op,x,y);
             end
             else
             begin
                  leer_provincia(arch,pos,reg);
                  if reg.activo then
                  begin
                       repeat
                       begin
                            gotoxy (x,y-2);textcolor (white);
                            textbackground (black); writeln ('Provincia existente:');
                            mostrar_provincia(reg,x,y);
                            gotoxy (x,y+7);textcolor (white);
                            textbackground (black); writeln ('|1| - Dar de baja');
                            gotoxy (x,y+9);textcolor (blue);
                            textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+9); op:=readkey;
                            textbackground (blue);
                       end;
                       until op in ['1',#27];
                       if op = '1' then
                       begin
                            reg.activo:=false;
                            repeat
                            begin
                                 textbackground (blue);clrscr;
                                 mostrar_provincia(reg,x,y);
                                 gotoxy (x,y+7);textcolor (white);
                                 textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                 gotoxy (x+34,y+7); cond:=readkey;
                            end;
                            until cond in ['N','S','n','s'];
                            if (cond = 'S') or (cond = 's') then
                            begin
                                 modificar_prov(arch,pos,reg);
                                 msj_exitoso (op,x,y);
                            end
                            else
                                msj_cancelado (op,x,y);
                       end;
                  end
                  else
                      msj_baja (op,x,y);
             end;
        end;
        until op=#27;
        close (arch);
end;

procedure modificar_provincia(var arch:provincia);
var dni:integer; pos:integer; op:char; reg:t_provincia; cond:char; nombre_provincia:string [40]; telef_ministro_turismo,denominacion:integer ; x,y:integer;
begin
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_provincia(arch);
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_dni (dni,x+2,y+4);
             buscar_provincia_id (arch,reg,pos,dni);
             if pos = (-1) then
             begin
                  msj_inexistente (op,x,y);
             end
             else
             begin
                  if reg.activo then
                  begin
                       repeat
                       begin
                            repeat
                            begin
                                 gotoxy (x,y-2);textcolor (white);
                                 textbackground (black); writeln ('Provincia existente:');
                                 mostrar_provincia(reg,x,y);
                                 gotoxy (x+28,y+2);textcolor (white);
                                 textbackground (black); writeln ('1');
                                 gotoxy (x+57,y+2); writeln ('2');
                                 gotoxy (x+82,y+2); writeln ('3');
                                 gotoxy (x,y+7); writeln ('Ingrese el numero para modificar dicho campo');
                                 gotoxy (x,y+9);textbackground (white);textcolor (blue); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+9); op:=readkey;textbackground (blUE);
                            end;
                            until op in ['1','2','3',#27];
                            case op of
                                 '1':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('Nombre de la provincia: '); validacion_string(nombre_provincia,38,x+24,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+13); cond:=readkey;textbackground (blUE);clrscr;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.nombre_provincia:=nombre_provincia;
                                               modificar_prov(arch,pos,reg);
                                          end;
                                     end;
                                 '2':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('Denominacion: '); validacion_entero (denominacion,38,x+14,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+36,y+13); cond:=readkey; textbackground (blue);clrscr;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.denominacion := denominacion;
                                               modificar_prov(arch,pos,reg);
                                          end;
                                     end;
                                 '3':
                                     begin
                                          gotoxy (x,y+11); writeln ('                                              ');
                                          gotoxy (x,y+11);textcolor (white);
                                          textbackground (black); writeln ('Numero de telefono: '); validacion_entero (telef_ministro_turismo,38,x+20,y+11);
                                          repeat
                                          begin
                                               gotoxy (x,y+13);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+36,y+13); cond:=readkey; textbackground (blue);clrscr;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.telef_ministro_turismo := telef_ministro_turismo;
                                               modificar_prov(arch,pos,reg);
                                          end;
                                     end;
                            end;
                       end;
                       until op = #27;
                  end
                  else
                      msj_baja (op,x,y);
             end;
        end;
        until op = #27;
    close (arch);
end;

procedure menu_busqueda (var arch:provincia; op:char; x,y:integer);
var nom:string[60]; pos:integer; reg:t_provincia; id:integer;
begin
     repeat
     begin
          case op of
               '1':
                   begin
                        textbackground (blue);clrscr;
                        datos (x,y);
                        validacion_string (nom,40,x+33,y+4);
                        textbackground (blue);clrscr;
                        listado_provincia_nombre (arch,nom);
                   end;
               '2':
                   begin
                        textbackground (blue);clrscr;
                        datos (x,y);
                        validacion_entero (id,40,x+2,y+4);
                        buscar_provincia_id (arch,reg,pos,id);
                        if pos = (-1) then
                        begin
                             msj_inexistente (op,x,y);
                        end
                        else
                        begin
                             if reg.activo then
                             begin
                                  repeat
                                  begin
                                       gotoxy (x,y-2);textcolor (white);
                                       textbackground (black); writeln ('Provincia existente:');
                                       datos(x,y);
                                       mostrar_provincia(reg,x,y);
                                       gotoxy (x,y+7);textcolor (blue);
                                       textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+7); op:=readkey;
                                  end;
                                  until op = #27;
                             end
                             else
                                 msj_baja (op,x,y);
                        end;
                   end;
          end;
          op:= #27;
     end;
     until op = #27;
end;

procedure consulta_provincia(var arch:provincia);
var op:char; x,y:integer;
begin
     x:=5;
     y:=7;
     abrir_provincia(arch);
     repeat
     begin
          menu_consulta (op,58,12);
          if (op = '1') or (op = '2') then
             menu_busqueda(arch,op,x,y);
     end;
     until op = #27;
     close (arch);
end;

procedure Listado_provincia(var arch:provincia);
var reg:t_provincia; pos:integer; p,p_2:integer; x,y:integer; op:char;
begin
     textbackground (blue);clrscr;
     abrir_provincia(arch);
     p:=1;
     p_2:=0;
     pos:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          gotoxy(x,p);textcolor (yellow);
          gotoxy(x,p+1); writeln('--------------------------------------------- Provincia ------------------------------------------------------');
          gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------');
          gotoxy(x,p+3); writeln('|      ID Provincia      |      Nombre Provincia      |      Denominacion      |      Telefono Ministro      |');
          gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------');
          if eof(arch) then
          begin
               gotoxy(x,p+5);textcolor (yellow);
               textbackground (blue); writeln('                                                                   ');
               gotoxy(x,p+5); writeln('|');gotoxy(x+35,p+5); writeln('No hay provincia para mostrar');
               gotoxy(x+99,p+5); writeln('|');
               gotoxy(x,p+6); writeln('--------------------------------------------------------------------------------------------------------------');
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
                    gotoxy(x,p);textcolor (yellow);
                    gotoxy(x,p+1); writeln  ('--------------------------------------------- Provincia ------------------------------------------------------');
                    gotoxy(x,p+2); writeln('--------------------------------------------------------------------------------------------------------------');
                    gotoxy(x,p+3); writeln('|      ID Provincia      |      Nombre Provincia      |      Denominacion      |      Telefono Ministro      |');
                    gotoxy(x,p+4); writeln('--------------------------------------------------------------------------------------------------------------');
                    while (not eof(arch)) and (p<=24) do
                    begin
                         leer_provincia(arch,pos,reg);
                         inc(pos);
                         if not (reg.activo) then
                         begin
                            dec (p);
                         end
                         else
                             inc (p_2);
                         mostrar_provincia_listado(reg,p,p_2);
                         inc(p);
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
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+9); op:=readkey;textbackground (blue);clrscr;
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

procedure menu_provincias();
var op:char; arch:provincia; x,y:integer;
begin
   x:=62;
     y:=8;
     clrscr;
     repeat
     begin
          repeat
          begin
            textbackground(blue);clrscr;
            textcolor (lightgreen);
            gotoxy (x,y);writeln('-------------------------------');
            gotoxy (x,y+1);writeln('|');
            gotoxy (x+30,y+1);writeln('|');
            gotoxy (x,y+2);writeln('|');
            gotoxy (x+9,y+2);writeln('Menu Provincias');
            gotoxy (x+30,y+2);writeln('|');
            gotoxy (x,y+3);writeln('|');
            gotoxy (x+30,y+3);writeln('|');
            gotoxy (x+1,y+4);writeln('-----------------------------');
            gotoxy (x,y+5);writeln('|');
            gotoxy (x+30,y+5);writeln('|');
            gotoxy (x,y+6);writeln('|');
            gotoxy (x+2,y+6);writeln('1 - Alta');
            gotoxy (x+30,y+6);writeln('|');
            gotoxy (x,y+7);writeln('|');
            gotoxy (x+30,y+7);writeln('|');
            gotoxy (x+1,y+8);writeln('-----------------------------');
            gotoxy (x+30,y+9);writeln('|');
            gotoxy (x,y+9);writeln('|');
            gotoxy (x,y+10);writeln('|');
            gotoxy (x+2,y+10);writeln('2 - Baja');
            gotoxy (x+30,y+10);writeln('|');
            gotoxy (x,y+11);writeln('|');
            gotoxy (x+30,y+11);writeln('|');
            gotoxy (x+1,y+12);writeln('-----------------------------');
            gotoxy (x,y+13);writeln('|');
            gotoxy (x+30,y+13);writeln('|');
            gotoxy (x,y+14);writeln('|');
            gotoxy (x+2,y+14);writeln('3 - Modificacion');
            gotoxy (x+30,y+14);writeln('|');
            gotoxy (x,y+15);writeln('|');
            gotoxy (x+30,y+15);writeln('|');
            gotoxy (x+1,y+16);writeln('-----------------------------');
            gotoxy (x,y+17);writeln('|');
            gotoxy (x+30,y+17);writeln('|');
            gotoxy (x,y+18);writeln('|');
            gotoxy (x+2,y+18);writeln('4 - Consultas ');
            gotoxy (x+30,y+18);writeln('|');
            gotoxy (x,y+19);writeln('|');
            gotoxy (x+30,y+19);writeln('|');
            gotoxy (x+1,y+20);writeln('-----------------------------');
            gotoxy (x,y+21);writeln('|');
            gotoxy (x+30,y+21);writeln('|');
            gotoxy (x,y+22);writeln('|');
            gotoxy (x+2,y+22);writeln('5 - Listado');
            gotoxy (x+30,y+22);writeln('|');
            gotoxy (x,y+23);writeln('|');
            gotoxy (x+30,y+23);writeln('|');
            gotoxy (x+1,y+24);writeln('-----------------------------');
            gotoxy (x,y+25);writeln('|');
            gotoxy (x+30,y+25);writeln('|');
            gotoxy (x,y+26);writeln('|');
            gotoxy (x+2,y+26);textbackground (white);textcolor (blue);writeln('|ESC| - Salir del programa'); textcolor (lightgreen); textbackground (9);
            gotoxy (x+30,y+26);writeln('|');
            gotoxy (x,y+27);writeln('|');
            gotoxy (x+30,y+27);writeln('|');
            gotoxy (x,y+28);writeln('-------------------------------');
            gotoxy (x+28,y+26);op:=readkey;
          end;
          until op in ['1','2','3','4','5',#27];
          case op of
               '1':alta_provincia(arch);
               '2':baja_provincia(arch);
               '3':modificar_provincia(arch);
               '4':consulta_provincia(arch);
               '5':listado_provincia(arch);
          end;
    end;
    until op = #27;
end;

begin

end.
