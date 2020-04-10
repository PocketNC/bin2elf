.setcallreg r24.w2
.origin 0
.entrypoint START
START:
  LDI     r30, 0
  CALL    WAIT
  LDI     r30, 0x8000
  CALL    WAIT
  JMP     START

WAIT:
  LDI r1, 0
  LDI r2, 332
WAITLOOP:
  ADD r1, r1, 1
  QBGT ENDWAIT, r2, r1
  JMP WAITLOOP
ENDWAIT:
  RET

