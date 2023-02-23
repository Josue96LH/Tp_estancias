unit Menu_Estancias1;
interface
uses crt,estancias1,dos,provincias1,validacion1,mensajes1;

var arch:estancia; arch_p:provincia;

procedure menu_estancia();

implementation

procedure datos (x,y:integer);
begin
      textcolor (yellow);
      textbackground (blue);
      gotoxy(x,y); writeln  ('---------------------------------------------------------------------------------- Estancias -------------------------------------------------------------------------------------');
      gotoxy(x,y+1); writeln('----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
      gotoxy(x,y+2); writeln('| ID Estancia | ID Provincia  | Nombre Estancia | Numero Contacto | Email de Contacto | Caracteristica | Piscina | Capacidad Maxima |  Nombre Dueño  | DNI Dueño |   Domicilio   |');
      gotoxy(x,y+3); writeln('----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
end;

procedure si_existe_provincia (var arch_p:provincia; var reg:t_estancia; x,y:integer);
var op:char; pos:integer; id_p:integer; reg_p:t_provincia;
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

procedure mostrar_estancia(reg:t_estancia; x,y:integer);
begin
     datos (x,y);
     with reg do
     begin
          datos (x,y);
          textcolor (yellow);
          textbackground (blue);
          gotoxy(x,y+4); writeln('|');gotoxy(x+2,y+4); writeln(id_estancia);
          gotoxy(x+14,y+4); writeln('|');gotoxy(x+16,y+4); writeln(id_provincia_ubi);
          gotoxy(x+30,y+4); writeln('|');gotoxy(x+32,y+4); writeln(nom_estancia);
          gotoxy(x+48,y+4); writeln('|');gotoxy(x+50,y+4); writeln(numero_contacto_estancia);
          gotoxy(x+66,y+4); writeln('|');gotoxy(x+68,y+4); writeln(email_contacto_estancia);
          gotoxy(x+86,y+4); writeln('|');gotoxy(x+88,y+4); writeln(caracteristicas_estancia);
          gotoxy(x+103,y+4); writeln('|');gotoxy(x+105,y+4); writeln(piscina_estancia);
          {gotoxy(x+112,y+4); writeln('|');gotoxy(x+114,y+4); writeln(capacidad_maxima);
          gotoxy(x+120,y+4); writeln('|');gotoxy(x+122,y+4); writeln(nomyap_dueno);
          gotoxy(x+130,y+4); writeln('|');gotoxy(x+132,y+4); writeln(dni_dueno);
          gotoxy(x+140,y+4); writeln('|');gotoxy(x+142,y+4); writeln(domicilio);}
          gotoxy(x+151,y+4); writeln('|');
          gotoxy(x,y+5); writeln('--------------------------------------------------------------------------------------------------------------------------------------------------------');
     end;
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

procedure Listado_estancia_5 (var arch:estancia; var op:char);
var reg:t_estancia; pos:integer; p,p_2:integer; x,y:integer;
begin
     p:=1;
     p_2:=0;
     pos:=0;
     y:=0;
     x:=7;
     seek (arch,0);
     repeat
     begin
          textcolor (yellow);
          textbackground (blue);
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
                    gotoxy(x,9);textcolor (white);
                    textbackground (black); writeln('|2| - Alta ');
                    gotoxy(x,11); writeln('|3| - Reactivacion ');
                    gotoxy (x,13);textcolor (blue);
                    textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,13); op:=readkey;
               end;
               until op in ['2','3',#27];
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
                              gotoxy(x,y+9);textcolor (white);
                              textbackground (black); writeln('|2| - Alta ');
                              gotoxy(x,y+11); writeln('|3| - Reactivacion ');
                              gotoxy (x,y+13);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+13); op:=readkey;
                         end;
                         until op in ['2','3',#27];
                    end
                    else
                    begin
                         repeat
                         begin
                              gotoxy(x,y+7);textcolor (white);
                              textbackground (black); writeln('|1| - Continuar con los 5 proximos registros');
                              gotoxy(x,y+9);textcolor (white);
                              textbackground (black); writeln('|2| - Alta ');
                              gotoxy(x,y+11); writeln('|3| - Reactivacion ');
                              gotoxy (x,y+13);textcolor (blue);
                              textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy(x+33,y+13); op:=readkey;
                         end;
                         until op in ['1','2','3',#27];
                    end;
               end;
               until op in ['2','3',#27];
           end;
      end;
      until op in ['2','3',#27];
end;

procedure alta_estancia(var arch:estancia; var arch_p:provincia);
var id:integer; pos:integer; op:char; reg:t_estancia; cond:char; x,y:integer;
begin
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_estancia (arch);
     ordenar_estancia (arch);
     Listado_estancia_5(arch,op);
     if op = '2' then
     begin
          repeat
          begin
               textbackground (blue);clrscr;
               datos (x,y);
               with reg do
               begin
                    id_estancia:= filesize (arch)+1;
                    si_existe_provincia (arch_p,reg,x+15,y+4);
                    validacion_string (nom_estancia,40,x+31,y+4);
                    validacion_entero (numero_contacto_estancia,40,x+49,y+4);
                    validacion_string (email_contacto_estancia,40,x+67,y+4);
                    validacion_string (caracteristicas_estancia,40,x+87,y+4);
                    validacion_string (piscina_estancia,40,x+104,y+4);
                    validacion_entero (capacidad_maxima,41,x+33,y+5);
                    validacion_string (nomyap_dueno,41,x+49,y+5);
                    validacion_entero (dni_dueno,41,x+67,y+5);
                    validacion_string (domicilio,41,x+85,y+5);
                    activo:=true;

               end;
               repeat
               begin
                    textbackground (blue);clrscr;
                    mostrar_estancia(reg,x,y);
                    gotoxy (x,y+9);textcolor (white);
                    textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                    gotoxy (x+34,y+9); cond:=readkey;
               end;
               until cond in ['S','s','N','n'];
               if (cond = 'S') or (cond = 's') then
               begin
                    guardar_estancia(arch,reg);
                    msj_exitoso (op,x,y);
               end
               else
                   msj_cancelado(op,x,y);
          end;
          until op=#27;
      end
      else
          if op = '3' then
             repeat
             begin
                  textbackground (blue);clrscr;
                  datos (x,y);
                  validacion_entero (id,10,x+2,y+4);
                  buscar_estancia_id (arch,reg,pos,id);
                  if pos = (-1) then
                  begin
                       msj_inexistente (op,x,y);
                  end
                  else
                  begin
                       leer_estancia(arch,pos,reg);
                       if reg.activo then
                       begin
                            textbackground(blue);clrscr;
                            repeat
                            begin
                                 gotoxy (x,y-2);textcolor (white);
                                 textbackground (black); writeln ('Estancia existente:');
                                 datos(x,y);
                                 mostrar_estancia(reg,x,y);
                                 gotoxy (x,y+11);textbackground(white);textcolor(blue); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+11); op:=readkey;
                            end;
                            until op = #27;
                       end
                       else
                       begin
                            textbackground (blue);clrscr;
                            repeat
                            begin
                                 gotoxy (x,y-2);textcolor (white);
                                 textbackground (black); writeln ('Estancia dada de baja:');
                                 mostrar_estancia(reg,x,y);
                                 gotoxy (x,y+9); writeln ('|1| - Reactivar');
                                 gotoxy (x,y+11);textcolor (blue);
                                 textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+11); op:=readkey;
                            end;
                            until op in ['1',#27];
                            if op = '1' then
                            begin
                                 reg.activo:=true;
                                 repeat
                                 begin
                                      textbackground (blue);clrscr;
                                      mostrar_estancia(reg,x,y);
                                      gotoxy (x,y+9);textcolor (white);
                                      textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                      gotoxy (x+34,y+9); cond:=readkey;
                                 end;
                                 until cond in ['S','N','s','n'];
                                 if (cond = 'S') or (cond = 's') then
                                 begin
                                      modificar_est (arch,pos,reg);
                                      msj_exitoso(op,x,y);
                                 end
                                 else
                                     msj_cancelado(op,x,y);
                            end;
                       end;
                  end;
             end;
             until op=#27;
      close(arch);
end;

procedure baja_estancia(var arch:estancia);
var id:integer; pos:integer; op:char; reg:t_estancia; cond:char; x,y:integer;
begin
     x:=5;
     y:=7;
     abrir_estancia(arch);
     textbackground (blue);clrscr;
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_entero (id,10,x+2,y+4);
             buscar_estancia_id (arch,reg,pos,id);
             if pos = (-1) then
             begin
                  msj_inexistente(op,x,y);
             end
             else
             begin
                  leer_estancia(arch,pos,reg);
                  if reg.activo then
                  begin
                       textbackground(blue);clrscr;
                       repeat
                       begin
                            gotoxy (x,y-2);textcolor (white);
                            textbackground (black); writeln ('Estancia existente:');
                            datos(x,y);
                            mostrar_estancia(reg,x,y);
                            gotoxy (x,y+11); writeln ('|1| - Dar de baja');
                            gotoxy (x,y+13);textcolor (blue);
                            textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+13); op:=readkey;
                       end;
                       until op in ['1',#27];
                       if op = '1' then
                       begin
                            reg.activo:=false;
                            repeat
                            begin
                                 textbackground (blue);clrscr;
                                 mostrar_estancia(reg,x,y);
                                 gotoxy (x,y+9);textcolor (white);
                                 textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                 gotoxy (x+34,y+9); cond:=readkey;
                            end;
                            until cond in ['N','S','n','s'];
                            if (cond = 'S') or (cond = 's') then
                            begin
                                 modificar_est(arch,pos,reg);
                                 msj_exitoso(op,x,y);
                            end
                            else
                                msj_cancelado(op,x,y);
                       end;
                  end
                  else
                      msj_baja (op,x,y);
             end;
        end;
        until op=#27;
     close (arch);
end;

procedure modificar_estancia(var arch:estancia; var arch_p:provincia);
var id:integer; pos:integer; op:char; reg,reg_2:t_estancia; cond:char; nom_estancia,piscina_estancia:string[40]; x,y:integer;
begin
     x:=5;
     y:=7;
     abrir_estancia(arch);
     textbackground (blue);clrscr;
     menu_confirmacion (op,58,12);
     if op = '1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_entero(id,10,x+2,y+4);
             buscar_estancia_id (arch,reg,pos,id);
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
                                 textbackground (blue);clrscr;
                                 gotoxy (x,y-2);textcolor (white);
                                 textbackground (black); writeln ('Estancia existente:');
                                 mostrar_estancia(reg,x,y);
                                 gotoxy (x+0,y+8);textcolor (white);
                                 textbackground (black); writeln ('Opciones: ');
                                 gotoxy (x+15,y+2); writeln ('1');
                                 gotoxy (x+31,y+2); writeln ('2');
                                 gotoxy (x+104,y+2); writeln ('3');
                                 {gotoxy (x+60,y+2); writeln ('4');
                                 gotoxy (x+73,y+2); writeln ('5');
                                 gotoxy (x+85,y+2); writeln ('6');
                                 gotoxy (x+97,y+2); writeln ('7');
                                 gotoxy (x+108,y+2); writeln ('8');
                                 gotoxy (x+134,y+2); writeln ('9'); }
                                 gotoxy (x,y+11); writeln ('Ingrese el numero para modificar dicho campo');
                                 gotoxy (x,y+13);textcolor (blue);
                                 textbackground (white); writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+13); op:=readkey;
                            end;
                            until op in ['1','2','3','4','5','6','7','8','9',#27];
                            case op of
                                 '1':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                              ');
                                          gotoxy (x,y+15);textcolor (white);
                                          textbackground (black); writeln ('ID Provincia: '); si_existe_provincia(arch_p,reg_2,x+8,y+15);
                                          repeat
                                          begin
                                               gotoxy (x,y+17);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+17); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.id_provincia_ubi:=reg_2.id_provincia_ubi;
                                               modificar_est(arch,pos,reg);
                                          end;
                                     end;
                                 '2':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                              ');
                                          gotoxy (x,y+15);textcolor (white);
                                          textbackground (black); writeln ('Nombre Estancia: '); validacion_string(nom_estancia,40,x+8,y+15);
                                          repeat
                                          begin
                                               gotoxy (x,y+17);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+17); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.nom_estancia:=nom_estancia;
                                               modificar_est(arch,pos,reg);
                                          end;
                                     end;
                                 '3':
                                     begin
                                          gotoxy (x,y+15); writeln ('                                              ');
                                          gotoxy (x,y+15);textcolor (white);
                                          textbackground (black); writeln ('Piscina: '); validacion_string(piscina_estancia,40,x+11,y+15);
                                          repeat
                                          begin
                                               gotoxy (x,y+17);textcolor (white);
                                               textbackground (black); writeln ('Desea confirmar la operacion? s/n: ');
                                               gotoxy (x+34,y+17); cond:=readkey;
                                          end;
                                          until cond in ['S','N','s','n'];
                                          if (cond = 'S') or (cond = 's') then
                                          begin
                                               reg.piscina_estancia:=piscina_estancia;
                                               modificar_est (arch,pos,reg);
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

procedure consulta_estancia (var arch:estancia);
var id:integer; pos:integer; reg:t_estancia; op:char; x,y:integer;
begin
     x:=5;
     y:=7;
     textbackground (blue);clrscr;
     abrir_estancia(arch);
     menu_confirmacion (op,58,12);
     if op ='1' then
        repeat
        begin
             textbackground (blue);clrscr;
             datos (x,y);
             validacion_entero (id,10,x+2,y+4);
             buscar_estancia_id (arch,reg,pos,id);
             if pos = (-1) then
             begin
                  msj_inexistente(op,x,y);
             end
             else
             begin
                  if reg.activo then
                  begin
                       textbackground(blue);clrscr;
                       repeat
                       begin
                            gotoxy (x,y-2);textcolor (white);
                            textbackground (black); writeln ('Estancia existente:');
                            mostrar_estancia(reg,x,y);
                            gotoxy (x,y+13);textcolor (blue);
                            textbackground (white);  writeln ('|ESC| - Regresar al menu anterior'); gotoxy (x+33,y+13); op:=readkey;
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

procedure listado_estancia(var arch:estancia);
var reg:t_estancia; pos:integer; p,p_2:integer; x,y:integer; op:char;
begin
     abrir_estancia(arch);
     ordenar_estancia(arch);
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

procedure menu_estancia();
var op:char; arch:estancia; x,y:integer;
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
            gotoxy (x+10,y+2);writeln('Menu Estancia');
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
               '1':alta_estancia(arch,arch_p);
               '2':baja_estancia(arch);
               '3':modificar_estancia(arch,arch_p);
               '4':consulta_estancia(arch);
               '5':listado_estancia(arch);
          end;
    end;
    until op = #27;
end;

begin

end.
