Unit Mensajes1;
interface
uses crt;
procedure msj_cancelado (var op:char; x,y:integer);
procedure msj_exitoso (var op:char; x,y:integer);
procedure msj_inexistente (var op:char; x,y:integer);
procedure menu_confirmacion (var op:char; x,y:integer);
procedure menu_consulta (var op:char; x,y:integer);
procedure msj_baja (var op:char; x,y:integer);

implementation
procedure msj_cancelado (var op:char; x,y:integer);
begin
     repeat
     begin
          textbackground(red);clrscr;
          gotoxy (x+10,y-3); textcolor(white);writeln ('|'); gotoxy (x+10,y-3); writeln ('|'); gotoxy (x+10,y-2); writeln ('|'); gotoxy (x+10,y-1); writeln ('|'); gotoxy (x+10,y+1); writeln ('|'); gotoxy (x+10,y); writeln ('|');
          gotoxy (x+10,y+3); writeln ('|'); gotoxy (x+10,y+2); writeln ('|'); gotoxy (x+10,y+4); writeln ('|'); gotoxy (x+10,y+5); writeln ('|');
          gotoxy (x+57,y-3); writeln ('|'); gotoxy (x+57,y-3); writeln ('|'); gotoxy (x+57,y-2); writeln ('|'); gotoxy (x+57,y-1); writeln ('|'); gotoxy (x+57,y+1); writeln ('|'); gotoxy (x+57,y); writeln ('|');
          gotoxy (x+57,y+3); writeln ('|'); gotoxy (x+57,y+2); writeln ('|'); gotoxy (x+57,y+4); writeln ('|'); gotoxy (x+57,y+5); writeln ('|');
          gotoxy (x+10,y-4); writeln ('------------------------------------------------');
          gotoxy (x+10,y+6); writeln ('------------------------------------------------');
          gotoxy (x+14,y-1); writeln ('---------------------------------------');
          gotoxy (x+14,y+1); writeln ('---------------------------------------');
          gotoxy (x+14,y);textbackground(black);textcolor(red); writeln   ('|         OPERACION CANCELADA         |');
          gotoxy (x+14,y+3);textbackground(red);textcolor(white); writeln ('---------------------------------------');
          gotoxy (x+14,y+2);textbackground(white);textcolor(red); writeln ('|  |ESC| - Regresar al menu anterior  |'); gotoxy (x+50,y+2); op:=readkey;clrscr;
     end;
     until op = #27;
end;

procedure msj_exitoso (var op:char; x,y:integer);
begin
     repeat
     begin
          textbackground(green);clrscr;
          gotoxy (x+9,y-3);textcolor(white); writeln ('|'); gotoxy (x+9,y-3); writeln ('|'); gotoxy (x+9,y-2); writeln ('|'); gotoxy (x+9,y-1); writeln ('|'); gotoxy (x+9,y+1); writeln ('|'); gotoxy (x+9,y); writeln ('|');
          gotoxy (x+9,y+3); writeln ('|'); gotoxy (x+9,y+2); writeln ('|'); gotoxy (x+9,y+4); writeln ('|'); gotoxy (x+9,y+5); writeln ('|');
          gotoxy (x+57,y-3); writeln ('|'); gotoxy (x+57,y-3); writeln ('|'); gotoxy (x+57,y-2); writeln ('|'); gotoxy (x+57,y-1); writeln ('|'); gotoxy (x+57,y+1); writeln ('|'); gotoxy (x+57,y); writeln ('|');
          gotoxy (x+57,y+3); writeln ('|'); gotoxy (x+57,y+2); writeln ('|'); gotoxy (x+57,y+4); writeln ('|'); gotoxy (x+57,y+5); writeln ('|');
          gotoxy (x+10,y-4); writeln ('------------------------------------------------');
          gotoxy (x+10,y+6); writeln ('------------------------------------------------');
          gotoxy (x+13,y-1); writeln ('-----------------------------------------');
          gotoxy (x+13,y+1); writeln ('-----------------------------------------');
          gotoxy (x+13,y);textbackground(black);textcolor(green); writeln   ('|           OPERACION EXITOSA           |');
          gotoxy (x+13,y+3);textcolor(white);textbackground(green); writeln ('-----------------------------------------');
          gotoxy (x+13,y+2);textbackground(white);textcolor(green); writeln ('|  |ESC| - Regresar al menu anterior    |'); gotoxy (x+49,y+2); op:=readkey;clrscr;
     end;
     until op = #27;
end;

procedure msj_inexistente (var op:char; x,y:integer);
begin
     repeat
     begin
          textbackground(blue);clrscr;
          gotoxy (x,y-1);textbackground(white);textcolor(blue); writeln ('--------------------------------------------------------');
          gotoxy (x,y+1); writeln  ('--------------------------------------------------------');
          gotoxy (x,y+3); writeln  ('--------------------------------------------------------');
          gotoxy (x,y); writeln    ('| El registro que busca no se encuentra en el sistema  |');
          gotoxy (x,y+2); writeln  ('| |ESC| - Regresar al menu anterior                    |'); gotoxy (x+35,y+2); op:=readkey;
     end;
     until op = #27;
end;

procedure msj_baja (var op:char; x,y:integer);
begin
     repeat
     begin
          textbackground(blue);clrscr;
          gotoxy (x,y-1);textbackground(white);textcolor(blue); writeln ('----------------------------------------------------');
          gotoxy (x,y+1); writeln ('----------------------------------------------------');
          gotoxy (x,y+3); writeln ('----------------------------------------------------');
          gotoxy (x,y); writeln ('| El registro que busca se encuentra dado de baja  |');
          gotoxy (x,y+2); writeln ('| |ESC| - Regresar al menu anterior                |'); gotoxy (x+35,y+2); op:=readkey;
     end;
     until op = #27;
end;

procedure menu_confirmacion (var op:char; x,y:integer);
begin
     repeat
     begin
          textbackground(blue);clrscr;
          gotoxy (x,y-1); writeln  ('--------------------------------------');
          gotoxy (x,y+1); writeln  ('--------------------------------------');
          gotoxy (x,y+3); writeln  ('--------------------------------------');
          gotoxy (x,y);textbackground(black);textcolor(white); writeln    ('| 1 - Ingresar ID                    |');
          gotoxy (x,y+2);textbackground(white);textcolor(blue); writeln   ('| |ESC| - Regresar al menu anterior  |'); gotoxy (x+35,y+2); op:=readkey;clrscr;
     end;
     until op in ['1',#27];
end;

procedure menu_consulta (var op:char; x,y:integer);
begin
     repeat
     begin
          textcolor(white); textbackground (blue);clrscr;
          gotoxy (x,y-1); writeln ('----------------------------------------');
          gotoxy (x,y+1); writeln ('----------------------------------------');
          gotoxy (x,y+3); writeln ('----------------------------------------');
          gotoxy (x,y+5); writeln ('----------------------------------------');
          gotoxy (x,y+7); writeln ('----------------------------------------');
          gotoxy (x,y); textbackground(black);textcolor(white);writeln   ('| Buscar por:                          |');
          gotoxy (x,y+2); writeln ('| 1 - Nombre                           |');
          gotoxy (x,y+4); writeln ('| 2 - ID                               |');
          gotoxy (x,y+6);textbackground(white);textcolor(blue); writeln  ('| |ESC| - Regresar al menu anterior    |'); gotoxy (x+35,y+6); op:=readkey;clrscr;
     end;
     until op in ['1','2',#27];
end;

begin
end.
