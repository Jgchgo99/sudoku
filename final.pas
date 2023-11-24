program juegosudoku;

uses crt;

var
SudokuJue: array[1..9, 1..9] of string;  {Matriz SUDOKU, partida en ejecucion}
SudokuPis: array[1..9, 1..9] of string;  {Matriz SUDUKU, pistas Generadas}
SudokuJug: array[1..9, 1..9] of string;  {Matriz SUDUKU, Jugadas del Usuario}
SudokuErr: array[1..9, 1..9] of string;  {Martiz SUDUKU, Error de Jugadas}
SudokuSol: array[1..9, 1..9] of string;  {Matriz SUDUKU, Jugadas realizadas automaticas por rendirse el jugador}
Ciclo,ColFila: integer;
ErrorJugada: string;
NombreJug : string;
ErrorNoPermitida,ImpMatriz : Boolean;


{Funcion para validar error de Jugada en fila del SUDUKU, }
Function ValidarErrorFila(Fila:  Integer; Valor : String) : Boolean ;
  Var
  Cont, Columna : Integer;
  Begin
   Cont:=0;
   for columna:=1 to 9 do
     begin
       if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
     end;
     ValidarErrorFila:=False;
     if Cont>0 then ValidarErrorFila:=True;
  End;
{Funcion para validar error de Jugada en Columna del SUDUKU, }
Function ValidarErrorColumna(Columna:  Integer; Valor : String) : Boolean ;
  Var
   Cont,Fila: Integer;
  Begin
    Cont:=0;
   for Fila:=1 to 9 do
     begin
       if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
     end;
     ValidarErrorColumna:=False;
     if Cont>0 then ValidarErrorColumna:=True;
  End;
{Funcion para validar error de Jugada en Cuadrante 1 del SUDUKU, }
Function ValidarErrorCuadrante1(Valor : String) : Boolean ;
  Var
  Cont, Columna, Fila: Integer;
  Begin
     Cont:=0;
     for fila:=1 to 3 do
       begin
         for columna:=1 to 3 do
           begin
             if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
            end;
        end;
       ValidarErrorCuadrante1:=False;
       if Cont>0 then ValidarErrorCuadrante1:=True;
   End;
{Funcion para validar error de Jugada en Cuadrante 2 del SUDUKU, }
Function ValidarErrorCuadrante2(Valor : String) : Boolean ;
  Var
  Cont, Columna, Fila: Integer;
  Begin
     Cont:=0;
     for fila:=1 to 3 do
       begin
         for columna:=4 to 6 do
           begin
             if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
            end;
        end;
       ValidarErrorCuadrante2:=False;
       if Cont>0 then ValidarErrorCuadrante2:=True;
   End;
{Funcion para validar error de Jugada en Cuadrante 3 del SUDUKU, }
Function ValidarErrorCuadrante3(Valor : String) : Boolean ;
  Var
  Cont, Columna, Fila: Integer;
  Begin
     Cont:=0;
     for fila:=1 to 3 do
       begin
         for columna:=7 to 9 do
           begin
             if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
            end;
        end;
       ValidarErrorCuadrante3:=False;
       if Cont>0 then ValidarErrorCuadrante3:=True;
   End;
{Funcion para validar error de Jugada en Cuadrante 4 del SUDUKU, }
Function ValidarErrorCuadrante4(Valor : String) : Boolean ;
  Var
  Cont, Columna, Fila: Integer;
  Begin
     Cont:=0;
     for fila:=4 to 6 do
       begin
         for columna:=1 to 3 do
           begin
             if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
            end;
        end;
       ValidarErrorCuadrante4:=False;
       if Cont>0 then ValidarErrorCuadrante4:=True;
   End;
{Funcion para validar error de Jugada en Cuadrante 5 del SUDUKU, }
Function ValidarErrorCuadrante5(Valor : String) : Boolean ;
  Var
  Cont, Columna, Fila: Integer;
  Begin
     Cont:=0;
     for fila:=4 to 6 do
       begin
         for columna:=4 to 6 do
           begin
             if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
            end;
        end;
       ValidarErrorCuadrante5:=False;
       if Cont>0 then ValidarErrorCuadrante5:=True;
   End;
{Funcion para validar error de Jugada en Cuadrante 6 del SUDUKU, }
Function ValidarErrorCuadrante6(Valor : String) : Boolean ;
  Var
  Cont, Columna, Fila: Integer;
  Begin
     Cont:=0;
     for fila:=4 to 6 do
       begin
         for columna:=7 to 9 do
           begin
             if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
            end;
        end;
       ValidarErrorCuadrante6:=False;
       if Cont>0 then ValidarErrorCuadrante6:=True;
   End;
{Funcion para validar error de Jugada en Cuadrante 7 del SUDUKU, }
Function ValidarErrorCuadrante7(Valor : String) : Boolean ;
  Var
  Cont, Columna, Fila: Integer;
  Begin
     Cont:=0;
     for fila:=7 to 9 do
       begin
         for columna:=1 to 3 do
           begin
             if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
            end;
        end;
       ValidarErrorCuadrante7:=False;
       if Cont>0 then ValidarErrorCuadrante7:=True;
   End;
{Funcion para validar error de Jugada en Cuadrante 8 del SUDUKU, }
Function ValidarErrorCuadrante8(Valor : String) : Boolean ;
  Var
  Cont, Columna, Fila: Integer;
  Begin
     Cont:=0;
     for fila:=7 to 9 do
       begin
         for columna:=4 to 6 do
           begin
             if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
            end;
        end;
       ValidarErrorCuadrante8:=False;
       if Cont>0 then ValidarErrorCuadrante8:=True;
   End;
{Funcion para validar error de Jugada en Cuadrante 9 del SUDUKU, }
Function ValidarErrorCuadrante9(Valor : String) : Boolean ;
  Var
  Cont, Columna, Fila: Integer;
  Begin
     Cont:=0;
     for fila:=7 to 9 do
       begin
         for columna:=7 to 9 do
           begin
             if SudokuJue[columna, fila]=Valor then Cont:=Cont+1;
            end;
        end;
       ValidarErrorCuadrante9:=False;
       if Cont>0 then ValidarErrorCuadrante9:=True;
   End;
{Funcion para validar determinar el cuadrante, correspondiente de la celda seleccionada por el jugadorante en el SUDUKU, }
Function DeterminarCuadrante(CeldaNum : Integer) : Integer ;
    Begin
     if (CeldaNum >= 11) and (CeldaNum<=13) or (CeldaNum >= 21) and (CeldaNum<=23) or (CeldaNum >= 31) and (CeldaNum<=33) then DeterminarCuadrante:=1;
     if (CeldaNum >= 14) and (CeldaNum<=16) or (CeldaNum >= 24) and (CeldaNum<=26) or (CeldaNum >= 34) and (CeldaNum<=36) then DeterminarCuadrante:=2;
     if (CeldaNum >= 17) and (CeldaNum<=19) or (CeldaNum >= 27) and (CeldaNum<=29) or (CeldaNum >= 37) and (CeldaNum<=39) then DeterminarCuadrante:=3;
     if (CeldaNum >= 41) and (CeldaNum<=43) or (CeldaNum >= 51) and (CeldaNum<=53) or (CeldaNum >= 61) and (CeldaNum<=63) then DeterminarCuadrante:=4;
     if (CeldaNum >= 44) and (CeldaNum<=46) or (CeldaNum >= 54) and (CeldaNum<=56) or (CeldaNum >= 64) and (CeldaNum<=66) then DeterminarCuadrante:=5;
     if (CeldaNum >= 47) and (CeldaNum<=49) or (CeldaNum >= 57) and (CeldaNum<=59) or (CeldaNum >= 67) and (CeldaNum<=69) then DeterminarCuadrante:=6;
     if (CeldaNum >= 71) and (CeldaNum<=73) or (CeldaNum >= 81) and (CeldaNum<=83) or (CeldaNum >= 91) and (CeldaNum<=93) then DeterminarCuadrante:=7;
     if (CeldaNum >= 74) and (CeldaNum<=76) or (CeldaNum >= 84) and (CeldaNum<=86) or (CeldaNum >= 94) and (CeldaNum<=96) then DeterminarCuadrante:=8;
     if (CeldaNum >= 77) and (CeldaNum<=79) or (CeldaNum >= 87) and (CeldaNum<=89) or (CeldaNum >= 97) and (CeldaNum<=99) then DeterminarCuadrante:=9;
   End;


  {Funcion para imprimir el juego actual del SUDUKU }
 procedure ImprimirMatriz;
    Var
    Fila,Columna: Integer;
    ValFilaCar : string;
    begin
     ImpMatriz:=True;
     textbackground(White);
     clrscr;
     textcolor(red);
     writeln;
     write('                                        J U E G O  S U D O K U                            ');
     writeln;
     textcolor(Black+Blink);
     if NombreJug<>'' then
     Begin
      writeln(' JUGADOR: '+NombreJug+'.');
      writeln; {salto de linea}
     end;

     writeln;
     textcolor(black);
     write('       1.  2.  3.  4.  5.  6.  7.  8.  9.');

      for fila:=1 to 9 do
        begin
          writeln;
          textcolor(black);
          If (Fila=1) or (Fila=4) Or (Fila=7)  then  textcolor(Red);
          write('     _____________________________________ ');
          writeln;
          textcolor(black);
          Str(Fila,ValFilaCar);
          write('  '+ValFilaCar+'.');
          for columna:=1 to 9 do
            begin
              textcolor(black);
              If (Columna=1) or (Columna=4) Or (Columna=7)  then  textcolor(Red);
               write(' | ');
              {Condiciones para selecionar el color del numero segun Matrices}
              if SudokuPis[columna, fila]<>' ' then  Textcolor(Black+Blink);
              if sudokuJug[columna, fila]<>' ' then  Textcolor(Blue+Blink);
              if sudokuErr[columna, fila]<>' ' then   Textcolor(Red+Blink);
              if sudokuSol[columna, fila]<>' ' then   Textcolor(Brown+Blink);
              write(SudokuJue[columna, fila]);
            end;
              textcolor(Red);
              write(' | ');
         end;
             writeln; {salto de linea}
          textcolor(Red);
          write('     _____________________________________ ');

      end;


{Funcion para validar error en Jugada (Fila, Columna,Cuadrante,Pista del SUDUKU, }
Function ValidarErrorJugada(Fila,Columna,Valor : Integer) : Boolean;
 Var
NroCuadrante,CeldaNum: Integer;
 ErrorFila,ErrorColumna: Boolean;
 ErrorCuadrante : Boolean;
 ValColumnaCar,ValFilaCar,ValCeldaCar,CeldaCar,NroCuadranteCar: string;
  begin
                Str(Columna,ValColumnaCar);
                Str(Valor,ValCeldaCar);
                 {Valido Fila}
                ErrorFila:=ValidarErrorFila(Fila,ValCeldaCar);
                {Valido Columna}
                ErrorColumna:=ValidarErrorColumna(Columna,ValCeldaCar);
               {Valido Cuadrante}
                Str(Fila,ValFilaCar);
                CeldaCar:=ValFilaCar+ValColumnaCar;
                Val(CeldaCar,CeldaNum);

                NroCuadrante:=DeterminarCuadrante(CeldaNum);
                Case NroCuadrante of
                 1: ErrorCuadrante:=ValidarErrorCuadrante1(ValCeldaCar);
                 2: ErrorCuadrante:=ValidarErrorCuadrante2(ValCeldaCar);
                 3: ErrorCuadrante:=ValidarErrorCuadrante3(ValCeldaCar);
                 4: ErrorCuadrante:=ValidarErrorCuadrante4(ValCeldaCar);
                 5: ErrorCuadrante:=ValidarErrorCuadrante5(ValCeldaCar);
                 6: ErrorCuadrante:=ValidarErrorCuadrante6(ValCeldaCar);
                 7: ErrorCuadrante:=ValidarErrorCuadrante7(ValCeldaCar);
                 8: ErrorCuadrante:=ValidarErrorCuadrante8(ValCeldaCar);
                 9: ErrorCuadrante:=ValidarErrorCuadrante9(ValCeldaCar);
                end;


                ErrorJugada:=' ';
                Str(NroCuadrante,NroCuadranteCar);
                If  (ErrorFila=True) then ErrorJugada:='FILA';
                If  (ErrorColumna=True) then ErrorJugada:='COLUMNA';
                If  (ErrorCuadrante=True) then ErrorJugada:='CUADRANTE: ' + NroCuadranteCar;
                {Valido Jugada no permitida, celda cargada automatica}
                ErrorNoPermitida:=False;
                if SudokuPis[columna, fila] <> ' ' then
                Begin
                  ErrorJugada:='NO PERMITIDA. CELDA AUTOMATICA.';
                  ErrorNoPermitida:=True;
                end;

                ValidarErrorJugada:=False;
                if (ErrorFila=True) or (ErrorColumna=True) or (ErrorCuadrante=True) or (ErrorNoPermitida=True) then ValidarErrorJugada:=True;
  end;
{Funcion para validar juego terminado, con la Jugada actual del Jugador}
Function JuegoTerminado() : Boolean;
  Var
  Fila,Columna,Contador : Integer;
  begin
    Contador:=0;
    for fila:=1 to 9 do
      begin
        for columna:=1 to 9 do
          begin
           If SudokuJue[columna, fila]=' ' then Contador:=Contador+1;
          end;
      end;
    JuegoTerminado:=False;
    If Contador=0 then JuegoTerminado:=True;
  end;
{Procedimiento  para solicitar el nombre del jugador}
Procedure NombreJugador ;
   Begin
      Repeat
       writeln; writeln;
       textcolor(Black);
       write(' Por Favor Introduzca Nombre del Jugador: ');
       Readln(NombreJug);
       if (NombreJug='') or (NombreJug=' ') then ImprimirMatriz;
      until (NombreJug<>'') and (NombreJug<>' ');
    End;
{Procedimiento para inicializar las matrices SUDOKU,SudokuPis[,SUDOKUERR,SUDOKUSOL}
   procedure InicialzarMatriz;
     Var
     Fila,Columna : Integer;
     begin
       for fila:=1 to 9 do
         begin
           for columna:=1 to 9 do
             begin
                 SudokuJue[columna, fila]:=' ';
              SudokuPis[columna, fila]:=' ';
              sudokuJug[columna, fila]:=' ';
              sudokuErr[columna, fila]:=' ';
              sudokuSol[columna, fila]:=' ';
             end;
         end;
     end;
   {Procedimiento  para cargar la partida inicial, matrices SUDOKU,SudokuPis[}
   procedure CargarMatriz;
    Var
    Fila, CantNumero,NroCuadrante,ValColumna,CeldaNum: Integer;
    ErrorFila,ErrorColumna: Boolean;
    ErrorCuadrante : Boolean;
    ValColumnaCar,ValFilaCar,CeldaCar: string;


     begin

       randomize;
       ErrorCuadrante:=False;
       ErrorFila:=False;
       NroCuadrante:=0;
       for fila:=1 to 9 do
         begin
           {aleatorio cantidad numero a cargar en celdas (2 o 3 numeros}
           CantNumero:= random(2)+2;
           textbackground(White);
           clrscr;
           textcolor(red);
           writeln;
           write('                                        J U E G O  S U D O K U                            ');
           textcolor(black);
           writeln;   writeln;    writeln;
           write('  C A R G A N D O  J U E G O   S U D O K U.....                       ');
           writeln;   writeln;    writeln;
           Str(Fila,ValFilaCar);
           write('  FILA:' + ValFilaCar+'/9.');
           writeln;   writeln;    writeln;
           write('  Espere un momento por Favor.... ');
           Delay(100);
           for Ciclo:=1 to CantNumero do
             begin
                {Valido que no exista el numero en la Fila,Columna,Cuadrante}
                 Repeat
                   {ImprimirMatriz; }
                   {aleatorio posicion celda}
                   ColFila:= random(9)+1;
                   {aleatorio valor celda}
                   ValColumna:= random(9)+1;
                   Str(ValColumna,ValColumnaCar);
                   {Valido Fila}
                   ErrorFila:=ValidarErrorFila(Fila,ValColumnaCar);
                   {Valido Columna}
                   ErrorColumna:=ValidarErrorColumna(ColFila,ValColumnaCar);
                  {Valido Cuadrante}
                   Str(Fila,ValFilaCar);
                   CeldaCar:=ValFilaCar+ValColumnaCar;
                   Val(CeldaCar,CeldaNum);
                   NroCuadrante:=DeterminarCuadrante(CeldaNum);
                   Case NroCuadrante of
                    1: ErrorCuadrante:=ValidarErrorCuadrante1(ValColumnaCar);
                    2: ErrorCuadrante:=ValidarErrorCuadrante2(ValColumnaCar);
                    3: ErrorCuadrante:=ValidarErrorCuadrante3(ValColumnaCar);
                    4: ErrorCuadrante:=ValidarErrorCuadrante4(ValColumnaCar);
                    5: ErrorCuadrante:=ValidarErrorCuadrante5(ValColumnaCar);
                    6: ErrorCuadrante:=ValidarErrorCuadrante6(ValColumnaCar);
                    7: ErrorCuadrante:=ValidarErrorCuadrante7(ValColumnaCar);
                    8: ErrorCuadrante:=ValidarErrorCuadrante8(ValColumnaCar);
                    9: ErrorCuadrante:=ValidarErrorCuadrante9(ValColumnaCar);
                   end;

                 Until (ErrorFila=False) and (ErrorColumna=False) and (ErrorCuadrante=False);

                 {asigno valor a la celda del sudoku, para iniciar la partida del juego}
                 SudokuJue[ColFila, fila]:=ValColumnaCar;
                 {asigno valor al sudoku temporal, para controlar celdas cargadas automaticas, las cuales
                 no deben ser utilizadas en el juego}
                 SudokuPis[ColFila, fila]:=ValColumnaCar;

             end;
         end;

     end;
 {Procedimiento para completar e Suduku, por rendirse el jugador}
 Procedure SolucionSudoku;
  Var
  Fila,Columna,Numero, NroCuadrante,ValColumna,CeldaNum: Integer;
  ErrorFila,ErrorColumna: Boolean;
  ErrorCuadrante : Boolean;
  ValColumnaCar,ValFilaCar,CeldaCar,ColumnaCar: string;


   begin

     randomize;
     ErrorCuadrante:=False;
     ErrorFila:=False;
     NroCuadrante:=0;
     for fila:=1 to 9 do
       begin
       ImprimirMatriz;
         for Columna:=1 to 9 do
           begin
           if SudokuJue[Columna,Fila]=' ' then
             Begin
               Numero:=0;
              {Valido que no exista el numero en la Fila,Columna,Cuadrante}
               Repeat
                Numero:=Numero+1;
                {ciclo for para buscar el numero valido}

                   {aleatorio valor celda}
                   ValColumna:= Numero;
                   Str(ValColumna,ValColumnaCar);
                   {Valido Fila}
                   ErrorFila:=ValidarErrorFila(Fila,ValColumnaCar);
                   {Valido Columna}
                   ErrorColumna:=ValidarErrorColumna(Columna,ValColumnaCar);
                   {Valido Cuadrante}
                   Str(Fila,ValFilaCar);
                   Str(Columna,ColumnaCar);
                   CeldaCar:=ValFilaCar+ColumnaCar;
                   Val(CeldaCar,CeldaNum);
                   NroCuadrante:=DeterminarCuadrante(CeldaNum);
                    Case NroCuadrante of
                      1: ErrorCuadrante:=ValidarErrorCuadrante1(ValColumnaCar);
                      2: ErrorCuadrante:=ValidarErrorCuadrante2(ValColumnaCar);
                      3: ErrorCuadrante:=ValidarErrorCuadrante3(ValColumnaCar);
                      4: ErrorCuadrante:=ValidarErrorCuadrante4(ValColumnaCar);
                      5: ErrorCuadrante:=ValidarErrorCuadrante5(ValColumnaCar);
                      6: ErrorCuadrante:=ValidarErrorCuadrante6(ValColumnaCar);
                      7: ErrorCuadrante:=ValidarErrorCuadrante7(ValColumnaCar);
                      8: ErrorCuadrante:=ValidarErrorCuadrante8(ValColumnaCar);
                      9: ErrorCuadrante:=ValidarErrorCuadrante9(ValColumnaCar);
                   end;
               Until (ErrorFila=False) and (ErrorColumna=False) and (ErrorCuadrante=False);

               {Si la regla de Filas,Columnas,Cuadrante, tiene error, forzo cero a la celda, el sudoku hay que aplicar otro orden}
               If ValColumna>9 then
                Begin
                  ValColumna:=0;
                  Str(ValColumna,ValColumnaCar);
                end;

               {asigno valor a la celda del sudoku, para iniciar la partida del juego}
               SudokuJue[Columna, fila]:=ValColumnaCar;
               {asigno valor al sudoku temporal, para controlar celdas cargadas automaticas, las cuales
               no deben ser utilizadas en el juego}
               sudokuSol[Columna, fila]:=ValColumnaCar;

              End ;
             end;

           end;
       end;


  {Procedimiento  para Iniciar el Juego}
  Procedure InicioJuego;
  Var
  F,C,V : Char;
  Fila,Columna,Valor : Integer;
  JuegoCompletado,TeclaESC: Boolean;

   Begin
     TeclaESC:=False;
    Repeat

     if ImpMatriz= false then ImprimirMatriz;
     {Solicitud de Usuario}
     if NombreJug='' then
      Begin
        NombreJugador;
        ImprimirMatriz;
      end;
      {Validar Fila Introducida por el Usuario}
      Repeat
       if ImpMatriz= false then ImprimirMatriz;
       ImpMatriz:=False; {para imprimir de haber error. Refresca pantalla}
       writeln;
       writeln;
       textcolor(Black);
       writeln('  Presione Tecla ESC(Rendirse) ');
         write('  Favor Introduzca Fila(del 1 al 9)..: ');
       F:=Readkey ;
      until (F='1') or (F='2') or (F='3') or (F='4') or (F='5') or (F='6') or (F='7') or (F='8') or (F='9') or (F=chr(27));

    {Validar Columna Introducida por el Usuario}
    if f=chr(27) then TeclaESC:=True;
    if TeclaESC=False then
     Begin
      Repeat
       if ImpMatriz= false then ImprimirMatriz;
       ImpMatriz:=False; {para imprimir de haber error. Refresca pantalla}
       writeln;
       writeln;
       textcolor(Black);
       writeln('  Presione Tecla ESC(Rendirse) ');
       writeln('  Favor Introduzca Fila(del 1 al 9)...: '+F);  {escribo fila introducida}
         write('  Favor Introduzca Columna(del 1 al 9): ');
       C:=Readkey ;
       {Verifico si la Celda es permitida, es decir, no es pista}
       ErrorNoPermitida:=False;
        if (C='1') or (C='2') or (C='3') or (C='4') or (C='5') or (C='6') or (C='7') or (C='8') or (C='9') then
         begin
                ErrorNoPermitida:=False;
                {Convierto valores a numerico}
                val(F,Fila);
                val(C,Columna);
                if SudokuPis[columna, fila] <> ' ' then {Verifico el valor de la celda en el SudokuPis[, pistas generadas}
                Begin
                  ImprimirMatriz;
                  ImpMatriz:=False; {para imprimir de haber error. Refresca pantalla}
                  writeln; writeln;
                  textcolor(red);
                  ErrorJugada:='NO PERMITIDA. CELDA ES PISTA...';
                  ErrorNoPermitida:=True;
                  writeln('  E R R O R  E N  J U G A D A...' + ErrorJugada);
                  Delay(4000);
                end;
         end;

      until ((C='1') or (C='2') or (C='3') or (C='4') or (C='5') or (C='6') or (C='7') or (C='8') or (C='9') or (C=chr(27))) and (ErrorNoPermitida=false);
     End;



     {Validar Valor Celda Introducida por el Usuario}
    if c=chr(27) then TeclaESC:=True;
    if TeclaESC=False then
    Begin
      Repeat
       if ImpMatriz= false then ImprimirMatriz;
       ImpMatriz:=False; {para imprimir de haber error. Refresca pantalla}
       writeln;
       writeln;
       textcolor(Black);
       writeln('  Presione Tecla ESC(Rendirse) ');
       writeln('  Favor Introduzca Fila(del 1 al 9).......: '+F);  {escribo fila introducida}
       writeln('  Favor Introduzca Columna(del 1 al 9)....: '+C);  {escribo Columna introducida}
         write('  Favor Introduzca Valor Celda(del 1 al 9): ');
       {Readln(V); }
       V:=Readkey ;

      until (V='1') or (V='2') or (V='3') or (V='4') or (V='5') or (V='6') or (V='7') or (V='8') or (V='9') or (V=chr(27));
     End;

     if V=chr(27) then TeclaESC:=True;
     if TeclaESC=False then
      Begin
     {Convierto valores a numerico}
     val(F,Fila);
     val(C,Columna);
     val(V,Valor);
     if ValidarErrorJugada(Fila,Columna,Valor)=True then
     Begin
        If ErrorNoPermitida<>True then
        Begin
         SudokuJue[Columna, Fila]:=V;
         sudokuJug[Columna, Fila]:=V;
         sudokuErr[Columna, Fila]:=V;
        end;
       if ImpMatriz= false then ImprimirMatriz;
       ImpMatriz:=False; {para imprimir de haber error. Refresca pantalla}
       writeln; writeln;
       textcolor(red);
       writeln('E R R O R  E N  J U G A D A...' + ErrorJugada);
       writeln;
       textcolor(Black);
       writeln('  Presione Tecla ESC(Rendirse) ');
       writeln('  Favor Introduzca Fila(del 1 al 9).......: ' +F);  {escribo fila introducida}
       writeln('  Favor Introduzca Columna(del 1 al 9)....: '+C);  {escribo Columna introducida}
         write('  Favor Introduzca Valor Celda(del 1 al 9): '+V); {escribo Valor Celda introducida}
       Delay(3000);
       {Inicializo celda, con el error}
       If ErrorNoPermitida<>True then
        Begin
         SudokuJue[Columna, Fila]:=' ';
         sudokuJug[Columna, Fila]:=' ';
         sudokuErr[Columna, Fila]:=' ';
        End;
     End
     Else
     begin
       {Jugada Aceptada}
       SudokuJue[Columna, Fila]:=V;
       sudokuJug[Columna, Fila]:=V;
       {Validar Juego Terminado}
       JuegoCompletado:=False;
       If JuegoTerminado()=True then
       Begin
         ImprimirMatriz;
         writeln;           writeln;
         writeln('  Felicitaciones. Has completado el SUDOKU...');
         Delay(3000);
         JuegoCompletado:=True;
       end;

      end;
     end;

    until (TeclaESC=True) or (JuegoCompletado=True);

     {Si el usuario presiono la tecla ESC(Salida); armo el juego de forma automatica, porque se rindio }
     If  (TeclaESC=True) then
     Begin
       writeln('Se rindio');
       SolucionSudoku;
       ImprimirMatriz;
     End;
  End;




begin
      {Inicio del Programa SUDUKU}
      InicialzarMatriz;
      CargarMatriz;
      InicioJuego;
      writeln();  writeln();
      writeln(' Pulse una Tecla para Salir...');
      readkey();
end.
