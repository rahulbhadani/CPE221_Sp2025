.global _start
_start:
	
	LDR R0, =array
	LDR R1, [R0, #4]
	MOV R2, #99
	STR R2, [R0, #8]
	MOV R7, #1
	MOV R0, #0
	
done: B done
	
.data

	array: .word 11, 22, 33, 44, 55
