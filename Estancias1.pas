unit Estancias1;
interface
Uses crt;
type
    t_estancia = record
                       id_estancia:integer; //CODIGO DE ESTANCIA
                       id_provincia_ubi:integer;
                       nom_estancia:string[50];
                       numero_contacto_estancia:integer;
                       email_contacto_estancia:string[50];
                       caracteristicas_estancia:string[100];
                       piscina_estancia:string[10];
                       capacidad_maxima:integer;
                       nomyap_dueno:string[40];
                       dni_dueno:integer;
                       domicilio:string[50];
                       activo:boolean;
                 end;
    estancia = file of t_estancia;

var arch:estancia; reg:t_estancia; pos:integer; buscado:string; buscado2:integer; id_e:integer;

procedure abrir_estancia (var arch:estancia);
procedure leer_estancia (var arch:estancia; Pos:integer; var Reg:t_estancia);
procedure guardar_estancia (var arch:estancia; reg:t_estancia);
procedure modificar_est(var arch:estancia; pos:integer; reg:t_estancia);
procedure buscar_estancia_nombre (var arch:estancia; var reg:t_estancia; var pos:integer; buscado:string);
procedure buscar_estancia_id (var arch:estancia; var reg:t_estancia; var pos:integer; buscado2:integer);
procedure ordenar_estancia (var arch:estancia);
procedure ordenar_estancia_alfabetico(var arch:estancia);

implementation

procedure abrir_estancia(var arch:estancia);
begin
     assign (arch,'estancia.dat');
     reset (arch);
     if ioresult <> 0 then
        rewrite (arch);
end;

procedure leer_estancia(var arch:estancia; pos:integer; var reg:t_estancia);
begin
     seek (arch,pos);
     read (arch,reg);
end;

procedure guardar_estancia(var arch:estancia; reg:t_estancia);
begin
     seek (arch, filesize (arch));
     write (arch,reg);
end;

procedure modificar_est(var arch:estancia; pos:integer; reg:t_estancia);
begin
     seek (arch,pos);
     write (arch,reg);
end;

procedure buscar_estancia_nombre(var arch:estancia; var reg:t_estancia; var pos:integer; buscado:string);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek (arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_estancia(arch,p,reg);
          if buscado = reg.nom_estancia then
             pos:=p;
          inc(p);
     end;
end;

procedure buscar_estancia_id(var arch:estancia; var reg:t_estancia; var pos:integer; buscado2:integer);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek(arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_estancia(arch,p,reg);
          if (buscado2 = reg.id_estancia) then
             pos:=p;
          inc(p);
     end;
end;

procedure ordenar_estancia(var arch:estancia);
var aux:t_estancia; reg2:t_estancia; reg1:t_estancia; pos1:integer; pos2:integer;
begin
     for pos1 := 0 to (filesize(arch) - 1) do
     begin
          leer_estancia(arch,pos1,reg1);
          for pos2 := (filesize(arch) - 1) downto (pos1 + 1) do
          begin
               leer_estancia(arch,pos2,reg2);
               if (reg1.id_estancia > reg2.id_estancia) then
               begin
                    aux:=reg1;
                    reg1:=reg2;
                    reg2:=aux;
                    modificar_est(arch,pos1,reg1);
                    modificar_est(arch,pos2,reg2);
               end;
          end;
     end;
end;

procedure ordenar_estancia_alfabetico(var arch:estancia);
var aux:t_estancia; reg2:t_estancia; reg1:t_estancia; pos1:integer; pos2:integer;
begin
     for pos1 := 0 to (filesize(arch) - 1) do
     begin
          leer_estancia(arch,pos1,reg1);
          for pos2 := (filesize(arch) - 1) downto (pos1 + 1) do
          begin
               leer_estancia(arch,pos2,reg2);
               if (reg1.nom_estancia > reg2.nom_estancia) then
               begin
                    aux:=reg1;
                    reg1:=reg2;
                    reg2:=aux;
                    modificar_est(arch,pos1,reg1);
                    modificar_est(arch,pos2,reg2);
               end;
          end;
     end;
end;

begin

end.
