unit Validacion1;
interface
uses crt,dos;

var cd,cm,ca,condf:boolean;

procedure cambio_mayuscula (var cadena:string);
procedure validacion_entero (var variable:integer; lim:integer; x:integer; y:integer);
procedure validacion_entero_2 (var variable:integer; lim:integer; x:integer; y:integer);
procedure validacion_string (var variable:string; lim,x,y:integer );
procedure validacion_dni (var variable:integer; x:integer; y:integer);
procedure validacion_real (var variable:real; lim:integer; x:integer; y:integer);

implementation

procedure cambio_mayuscula (var cadena:string);
var i:integer;
begin
     i:=0;
     for i:=1 to length(cadena) do
     begin
          if (cadena<>' ') or (cadena<>'') then
             cadena[i]:=upcase(cadena[i]);
     end;
end;

procedure validacion_entero (var variable:integer; lim:integer; x:integer; y:integer);
var codigo:integer; aux:boolean; op:char; var_aux:string;
begin
     var_aux:='';
     repeat
     begin
          aux:=false;
          gotoxy (x,y); writeln ('                                                       ');
          gotoxy (x,y); readln (var_aux);
          if (length(var_aux)) <= lim then
             aux:=true;
          val(var_aux,variable,codigo);
          if codigo<>0 then
          begin
               repeat
               begin
                    gotoxy (x,y); writeln ('                                                     ');
                    gotoxy (x,y); writeln('Error ingrese solo numeros enteros | ENTER - Continuar'); gotoxy (x+54,y); op:=readkey;
               end;
               until op=#13;
          end
          else
              if codigo=0 then
              begin
                   if (aux=false) or (variable = 0) then
                   begin
                        repeat
                        begin
                             gotoxy (x,y); writeln ('                                                                 ');
                             gotoxy (x,y); writeln('Error la cantidad de digitos no es la correcta | ENTER - Continuar'); gotoxy (x+67,y); op:=readkey;
                        end;
                        until op=#13;
                   end;
              end;
     end;
     until (codigo=0) and (aux=true) and (variable <> 0);
end;

procedure validacion_entero_2 (var variable:integer; lim:integer; x:integer; y:integer);
var codigo:integer; aux:boolean; op:char; var_aux:string;
begin
     var_aux:='';
     repeat
     begin
          aux:=false;
          gotoxy (x,y); writeln ('                                                                                      ');
          gotoxy (x,y); readln (var_aux);
          if (length(var_aux)) <= lim then
             aux:=true;
          val(var_aux,variable,codigo);
          if codigo<>0 then
          begin
               repeat
               begin
                    gotoxy (x,y); writeln ('                                                     ');
                    gotoxy (x,y); writeln('Error ingrese solo numeros enteros | ENTER - Continuar'); gotoxy (x+54,y); op:=readkey;
               end;
               until op=#13;
          end
          else
              if codigo=0 then
              begin
                   if (aux=false) then
                   begin
                        repeat
                        begin
                             gotoxy (x,y); writeln ('                                                                 ');
                             gotoxy (x,y); writeln('Error la cantidad de digitos no es la correcta | ENTER - Continuar'); gotoxy (x+67,y); op:=readkey;
                        end;
                        until op=#13;
                   end;
              end;
     end;
     until ((codigo=0) and (aux=true));
end;

procedure validacion_dni (var variable:integer; x:integer; y:integer);
var codigo:integer; aux:boolean; op:char; var_aux:string;
begin
     var_aux:='';
     repeat
     begin
          aux:=false;
          gotoxy (x,y); writeln ('                                                                                                           ');
          gotoxy (x,y); readln (var_aux);
          if (length(var_aux)) = 8 then
             aux:=true;
          val(var_aux,variable,codigo);
          if codigo<>0 then
          begin
               repeat
               begin
                    gotoxy (x,y); writeln ('                                                       ');
                    gotoxy (x,y); writeln('Error ingrese solo numeros enteros | ENTER - Continuar'); gotoxy (x+54,y); op:=readkey;
               end;
               until op=#13;
          end
          else
              if codigo=0 then
              begin
                   if aux=false then
                   begin
                        repeat
                        begin
                             gotoxy (x,y); writeln ('                                                                   ');
                             gotoxy (x,y); writeln('Error la cantidad de digitos no es la correcta | ENTER - Continuar'); gotoxy (x+67,y); op:=readkey;
                        end;
                        until op=#13;
                   end;
              end;
     end;
     until ((codigo=0) and (aux=true));
end;                                 

procedure validacion_string (var variable:string; lim,x,y:integer );
var i:integer; aux,aux_2:boolean; op:char;
begin
     repeat
     begin
          aux:=false;
          gotoxy (x,y); writeln ('                                                                                    ');
          gotoxy (x,y); readln (variable);
          if (length(variable)) >= lim then
          begin
               repeat
               begin
                    gotoxy (x,y); writeln ('                                                                    ');
                    gotoxy (x,y); writeln('Error la cantidad de digitos no es la correcta | ENTER - Continuar'); gotoxy (x+67,y); op:=readkey;
               end;
               until op=#13;
          end
          else
          begin
               if (variable[1] = ' ') or (variable = '') then
               begin
               repeat
                     begin
                          gotoxy (x,y); writeln ('                                                ');
                          gotoxy (x,y); writeln('Error, hay espacios de mas | ENTER - Continuar'); gotoxy (x+46,y); op:=readkey;
                     end;
               until op = #13;
               end
               else
               begin
                    aux_2:=true;
                    for i:=1 to length (variable) do
                    begin
                        if (variable[i] = ' ') and (variable[i+1] = ' ') then
                              aux_2:=false;
                        if variable[i] in ['0','1','2','3','4','5','6','7','8','9'] then
                              aux_2:=false;
                    end;
                    if aux_2 = false then
                    begin
                         repeat
                         begin
                         gotoxy (x,y); writeln ('                                                ');
                         gotoxy (x,y); writeln('Error, caracteres invalidos | ENTER - Continuar'); gotoxy (x+47,y); op:=readkey;
                         end;
                         until op = #13;
                    end
                    else
                    begin
                         if variable[length (variable)] = ' ' then
                         begin
                         repeat
                         begin
                              gotoxy (x,y); writeln ('                                               ');
                              gotoxy (x,y); writeln('Error, hay espacios de mas | ENTER - Continuar'); gotoxy (x+46,y); op:=readkey;
                         end;
                         until op = #13;
                         end
                         else
                             aux:=true
                    end;
               end;
          end;
     end;
     until (aux=true);
     cambio_mayuscula (variable);
end;                                 

procedure validacion_real (var variable:real; lim:integer; x:integer; y:integer);
var codigo:integer; aux:boolean; op:char; var_aux:string;
begin
     var_aux:='';
     repeat
     begin
          aux:=false;
          gotoxy (x,y); writeln ('                                                                                              ');
          gotoxy (x,y); readln (var_aux);
          if (length(var_aux)) <= lim then
             aux:=true;
          val(var_aux,variable,codigo);
          if codigo<>0 then
          begin
               repeat
               begin
                    gotoxy (x,y); writeln ('                                                      ');
                    gotoxy (x,y); writeln('Error ingrese solo numeros reales | ENTER - Continuar'); gotoxy (x+54,y); op:=readkey;
               end;
               until op=#13;
          end
          else
              if codigo=0 then
              begin
                   if aux=false then
                   begin
                        repeat
                        begin
                             gotoxy (x,y); writeln ('                                                                  ');
                             gotoxy (x,y); writeln('Error la cantidad de digitos no es la correcta | ENTER - Continuar'); gotoxy (x+67,y); op:=readkey;
                        end;
                        until op=#13;
                   end;
              end;
     end;
     until ((codigo=0) and (aux=true));
end;

begin

end.
