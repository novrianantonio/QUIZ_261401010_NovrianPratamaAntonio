program dua;
uses crt;

type
    field = record
        kode, namaBarang : string;
        harga, jumlah : integer;
    end;

    

var
    data : array of field;
    s : char;
    i : integer;
    k, n : string;
    total, bayar : integer;

function diskon(t : integer):real;
begin
    if t>500000 then 
    begin
        diskon:=t*0.15;
    end
    else if t>200000 then 
    begin
        diskon:=t*0.1;
    end
    else if t>100000 then 
    begin
        diskon:=t*0.05;
    end
    else
    begin
        diskon:=0;
    end;
end;

procedure rincian(i:integer);
begin
    total:=0;
    for i:=1 to high(field) do 
    begin
        writeln(i, '. ', field[i].kode, field[i].namaBarang, field[i].harga, field[i].jumlah);
        total := total+(field[i].harga*field[i].jumlah)
    end;
    writeln('total bayar : ', total);
    writeln('diskon : ', diskon(total));
end;

begin
    i:=0;
    setLength(field, 0)
    repeat
        i=i+1;
        setleght(field, i);
        write('Kode barang : '); readln(field[i].kode);
        write('Nama barang : '); readln(field[i].namaBarang);
        write('Harga       : '); readln(field[i].harga);
        write('Jumlah      : '); readln(field[i].jumlah);
        writeln;
        write('Tambah barang lagi? (Y/N) : '); readln(s);
    until (UpCase(s)<>'N');
    writeln;
    rincian;
    repeat
        write('Uang bayar : '); readln(bayar);
        if bayar<total then writeln('Uang kurang, minimal ', total, '. Input ulang!');
    until (bayar<total);
    writeln('kembalian : ', bayar-total);
end.