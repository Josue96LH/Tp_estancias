unit Menu_Principal1;
interface
uses crt,dos,menu_provincias1,menu_estancias1, Menu_listado_adicional1;

procedure menu_principa();

implementation

procedure menu_principa();
var op:char; x,y:integer;
begin
     x:=62;
     y:=8;
     textbackground (blue);
     clrscr;
     repeat
     begin
          repeat
          begin
          textbackground (blue);
          clrscr;
          textcolor (lightgreen);
          textbackground (9);
          gotoxy (x,y);writeln('----------------------------------------');
          gotoxy (x,y+1);writeln('|');
          gotoxy (x+39,y+1);writeln('|');
          gotoxy (x,y+2);writeln('|');
          gotoxy (x+2,y+2);writeln('Bienvenido al Sistema de Informacion');
          gotoxy (x+39,y+2);writeln('|');
          gotoxy (x,y+3);writeln('|');
          gotoxy (x+39,y+3);writeln('|');
          gotoxy (x,y+4);writeln('----------------------------------------');
          gotoxy (x,y+5);writeln('|');
          gotoxy (x+39,y+5);writeln('|');
          gotoxy (x,y+6);writeln('|');
          gotoxy (x+2,y+6);writeln('1 - Provincias');
          gotoxy (x+39,y+6);writeln('|');
          gotoxy (x,y+7);writeln('|');
          gotoxy (x+39,y+7);writeln('|');
          gotoxy (x+1,y+8);writeln('--------------------------------------');           //MENU DEL ARCHIVO
          gotoxy (x,y+9);writeln('|');
          gotoxy (x+39,y+9);writeln('|');
          gotoxy (x,y+10);writeln('|');
          gotoxy (x+2,y+10);writeln('2 - Estancias');
          gotoxy (x+39,y+10);writeln('|');
          gotoxy (x,y+11);writeln('|');
          gotoxy (x+39,y+11);writeln('|');
          gotoxy (x+1,y+12);writeln('--------------------------------------');
          gotoxy (x,y+13);writeln('|');
          gotoxy (x+39,y+13);writeln('|');
          gotoxy (x,y+14);writeln('|');
          gotoxy (x+2,y+14);writeln('3 - Listados');
          gotoxy (x+39,y+14);writeln('|');
          gotoxy (x,y+15);writeln('|');
          gotoxy (x+39,y+15);writeln('|');
          gotoxy (x+1,y+16);writeln('--------------------------------------');
          gotoxy (x,y+17);writeln('|');
          gotoxy (x+39,y+17);writeln('|');
          gotoxy (x,y+18);writeln('|');
          gotoxy (x+7,y+18);textbackground (white);textcolor (blue);writeln('|ESC| - Salir del programa'); textcolor (lightgreen); textbackground (9);
          gotoxy (x+39,y+18);writeln('|');
          gotoxy (x,y+19);writeln('|');
          gotoxy (x+39,y+19);writeln('|');
          gotoxy (x,y+20);writeln('----------------------------------------');

          gotoxy (x+33,y+18);op:=readkey;
          end;
          until op in ['1','2','3',#27];
          case op of
               '1':menu_provincias();
               '2':menu_estancia();
               '3':menu_listados();
          end;
    end;
    until op = #27;
end;

begin

end.
