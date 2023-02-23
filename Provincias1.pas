unit Provincias1;
interface
uses crt;
type
    t_provincia=record
                      id_provincia:integer; //cod_provincia
                      nombre_provincia:string[40];
                      denominacion:integer;
                      telef_ministro_turismo:integer;
                      activo:boolean;
                end;
    provincia= file of t_provincia;

var arch:provincia; reg:t_provincia; pos:integer; buscado:string; buscado2:integer; id_p:integer; //reg_e:t_estancia;// reg_r:t_reserva;

procedure abrir_provincia(var arch:provincia);
procedure leer_provincia(var arch:provincia; pos:integer; var reg:t_provincia);
procedure guardar_provincia(var arch:provincia; reg:t_provincia);
procedure modificar_prov(var arch:provincia; pos:integer; reg:t_provincia);
procedure buscar_provincia_nombre(var arch:provincia; var reg:t_provincia; var pos:integer; buscado:string);
procedure buscar_provincia_id(var arch:provincia; var reg:t_provincia; var pos:integer; buscado2:integer);
procedure ordenar_provincia(var arch:provincia);

implementation

procedure abrir_provincia(var arch:provincia);
begin
     assign (arch,'provincia.dat');
     reset (arch);
     if ioresult <> 0 then
        rewrite (arch);
end;

procedure leer_provincia(var arch:provincia; pos:integer; var reg:t_provincia);
begin
     seek (arch,pos);
     read (arch,reg);
end;

procedure guardar_provincia(var arch:provincia; reg:t_provincia);
begin
     seek (arch, filesize (arch));
     write (arch,reg);
end;

procedure modificar_prov(var arch:provincia; pos:integer; reg:t_provincia);
begin
     seek (arch,pos);
     write (arch,reg);
end;

procedure buscar_provincia_nombre(var arch:provincia; var reg:t_provincia; var pos:integer; buscado:string);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek (arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_provincia(arch,p,reg);
          if buscado = reg.nombre_provincia then
             pos:=p;
          inc(p);
     end;
end;

procedure buscar_provincia_id(var arch:provincia; var reg:t_provincia; var pos:integer; buscado2:integer);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek(arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_provincia(arch,p,reg);
          if (buscado2 = reg.id_provincia) then
             pos:=p;
          inc(p);
     end;
end;

procedure ordenar_provincia(var arch:provincia);
var aux:t_provincia; reg2:t_provincia; reg1:t_provincia; pos1:integer; pos2:integer;
begin
     for pos1 := 0 to (filesize(arch) - 1) do
     begin
          leer_provincia(arch,pos1,reg1);
          for pos2 := (filesize(arch) - 1) downto (pos1 + 1) do
          begin
               leer_provincia(arch,pos2,reg2);
               if (reg1.id_provincia > reg2.id_provincia) then
               begin
                    aux:=reg1;
                    reg1:=reg2;
                    reg2:=aux;
                    modificar_prov(arch,pos1,reg1);
                    modificar_prov(arch,pos2,reg2);
               end;
          end;
     end;
end;

begin

end.
