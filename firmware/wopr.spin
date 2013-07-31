{Object_Title_and_Purpose}


CON
        _clkmode = xtal1 + pll1x                                               'Standard clock mode * crystal frequency = 80 MHz
        _xinfreq = 5_000_000

VAR
  long  password[10]

  
OBJ
  pst    : "Parallax Serial Terminal"
  ani    : "woprdisplay"
  
PUB main
  pst.StartRxTx(8, 7, 0, 9600)
  ani.Start(10)
  dira[9] := 1
  outa[9] := 0

  
  
  repeat
   login



PRI login
  repeat
   pst.Str(String("LOGON: "))
   ModStrInMax(password, 10)
   pst.Str(String("PASSWORD: "))
   if strcomp(password, String("Joshua"))
     loggedin

PRI loggedin
  pst.Str(String("GREETINGS PROFESSOR FALKEN"))
  waitcnt(clkfreq + cnt)
  






PUB ModStrInMax(stringptr, maxcount)
  repeat while (maxcount--)                                                     'While maxcount not reached
    if (byte[stringptr++] := pst.CharIn) == 10                                      'Get chars until NL
      quit
  byte[stringptr+(byte[stringptr-1] == 10)]~                                    'Zero terminate string; overwrite NL or append 0 char

DAT
name    byte  "string_data",0        
        