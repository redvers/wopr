{woprdisplay - I blink in a different cog to show my pleasure / displeasure...}

VAR
  byte  Cog
  byte  loopcnt
  byte  loopcntx
  long  outmask
  long  animask[7]
  long  stack[200]

  
PUB Start(MonitorPin): Success
{{Start new blinking process in new cog; return TRUE if successful}}

  Stop
  Success := (Cog := cognew(MonitorMe(MonitorPin), @Stack) + 1)




PUB Stop
{{Stop (in the name of love, before you break my cog}}

  if Cog
    cogstop(Cog~ - 1)


PUB MonitorMe(MonitorPin)
  outmask    := %00000_1111111111111111_0000_1111111
  animask[0] := %00000_1110010101101001_0000_0001011    
  animask[1] := %00000_1010000100000100_0000_0010011    
  animask[2] := %00000_1100100100011101_0000_1111010    
  animask[3] := %00000_1010101110100000_0000_0001010    
  animask[4] := %00000_1000001100001001_0000_0010001    
  animask[5] := %00000_1001101101010011_0000_0010110    
  animask[6] := %00000_1010010000010100_0000_1101001    
  animask[7] := %00000_1100100000110010_0000_0001100
  

  waitpeq(|< 10, |< 10, 0)
  dira := outmask
  repeat
    if ina[10] == 1
      repeat loopcnt FROM 0 TO 7
        repeat loopcntx FROM 0 TO 200
          outa := animask[loopcnt]
          waitcnt(clkfreq/10000 + cnt)
          outa := 0
        'waitcnt(clkfreq/10 + cnt)
    'else
     ' reboot
    



PUB public_method_name


PRI private_method_name


DAT
name    byte  "string_data",0        
        