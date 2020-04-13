.setcallreg r24.w2
.origin 0
.entrypoint START
START:
  LDI r2, 332
  MOV r3, 0x00000 
  SBBO r2, r3, 0, 4 

  LBCO r8, C4, 4, 4
  CLR  r8, r8, 4
  SBCO r8, C4, 4, 4

  MOV r4, 0x48053190 // clear address for gpio 8
  MOV r5, 0x48053194 // set address for gpio 8
  MOV r6, 0x40000    // bit 18, for gpio 8 line 18 which controls P8.17
SIGNALLOOP:
//  LDI     r30, 0
  SBBO r6, r4, 0, 4
  CALL    WAIT
  SBBO r6, r5, 0, 4
//  LDI     r30, 0x8000
  CALL    WAIT
  JMP     SIGNALLOOP

WAIT:
  LDI r1, 0
  LBBO r2, r3, 0, 4
WAITLOOP:
  ADD r1, r1, 1
  QBGT ENDWAIT, r2, r1
  JMP WAITLOOP
ENDWAIT:
  RET

