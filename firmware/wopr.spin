{Object_Title_and_Purpose}


CON
        _clkmode = xtal1 + pll1x                                               'Standard clock mode * crystal frequency = 80 MHz
        _xinfreq = 5_000_000

VAR
  long  password[100]
  byte  strincnt
  byte  tmpval
  
OBJ
  pst    : "Parallax Serial Terminal"
  ani    : "woprdisplay"
  
PUB main
  pst.StartRxTx(8, 7, 0, 9600)
  ani.Start(10)
  dira[9] := 1
  outa[9] := 0

  repeat
   thb(String("LOGON: "))
   'ModStrIn(password, 9)
   pst.StrInMax(password,7)
   thb(String("PASSWORD: "))
   if strcomp(password, String("Joshua"))
      pst.Str(String("GREETINGS PROFESSOR FALKEN"))
      reboot
  


PUB ModStrIn(stringptr, maxcount)
  repeat strincnt FROM 0 TO maxcount
    pst.Dec(strincnt)
    tmpval := pst.CharIn
    if (tmpval == 10)
      quit
    pst.Dec(tmpval)
                   

PUB ModStrInMax(stringptr, maxcount)
  repeat while (maxcount--)                                                     'While maxcount not reached
    if (byte[stringptr++] := pst.CharIn) == 10                                      'Get chars until NL
      quit
  byte[stringptr+(byte[stringptr-1] == 10)]~                                    'Zero terminate string; overwrite NL or append 0 char

PUB thb(stringptr)
  repeat strsize(stringptr)
    pst.Char(byte[stringptr++])
    waitcnt(clkfreq/10 + cnt)
  
DAT
name    byte  "string_data",0        
        