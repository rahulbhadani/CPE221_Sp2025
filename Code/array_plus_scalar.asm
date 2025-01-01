//
//	CPE 221 Assembly Example
//	
//	This program adds a scalar value to all the elements in one
//     array and stores that in another array.
//
//int main()
//{
//  const int size = 8;
//  int x[size] = {13000, 298, -4729, 698, -2700, 5267, -1, 32641};
//  int y[size];
//  int a = 1307;
//  int i;
//  for (i = 0; i < size; i++)
//    y[i] = x[i] + a;
//
//

//main code
        .section array_plus_scalar, "awx"
        .global _start
		
_start:
         ADR   r0, x        // pointer to first element of x             (0)
         ADR   r1, y        // pointer to first element of y             (4)
         LDR   r2, size     // holds size of arrays                      (8)
         LDR   r3, i        // holds loop counter                       (12)
         LDR   r5, a        // holds a                                  (16)
loop:    SUBS  r4, r3, r2  // compute i - size                         (20)
         BPL   done         // if i - size >= 0, done                   (24)
         LDR   r4, [r0]     // r4 = x[i]                                (28)
         ADD   r4, r4, r5   // r4 = x[i] + a                            (32)
         STR   r4, [r1]     // y[i] = x[i] + a                          (36)
         ADD   r0, r0, #4   // update r0 to point to next element of x  (40)
         ADD   r1, r1, #4   // update r1 to point to next element of y  (44)
         ADD   r3, r3, #1   // i++                                      (48)
         B     loop         //                                          (52)
done:    B     done        //                                          (56)

//Variables
size:    .word   8           //                                          (60)
a:       .word   1307        //                                          (64)
                           // x has addresses                       (68-99)
x:       .word   13000, 298, -4729, 698, -2700, 5267, -1, 32641 
                           // y has addresses                     (100-131)
y:       .space  32
i:       .word   0            // (132)
		 .end
