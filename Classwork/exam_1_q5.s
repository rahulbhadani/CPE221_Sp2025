.global _start
_start:
	
	LDR R0, =a
    LDR R1, =b
    LDR R0, [R0]
    LDR R1, [R1]
    CMP R0, R1
    BLE else
    MUL R2, R0, R1
    B end
else:
    SUB R2, R0, R1
end:
    LDR R3, =c
    STR R2, [R3]
	
done: B done
	
a: .word 20
b: .word 25
c: .word 30