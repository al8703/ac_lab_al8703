  // This is the general format of an assembly-language program file.
    // Written by: Ann Liu al8703
    .arch armv8-a
    .text
    // Code for all functions go here.

    // ***** WEEK 1 deliverables *****
    // Every function starts from the .align below this line ...
    .align  2
    .p2align 3,,7
    .global popcntRD
    .type   popcntRD, %function
popcntRD:
    // (STUDENT TODO) Code for popcntRD goes here.
    // Input parameter n is passed in X0.
    // Output value is returned in X0.
    //ldur     x9, #0x5555555555555555
    movk    x9, #0x5555, lsl 48
    movk    x9, #0x5555, lsl 32
    movk    x9, #0x5555, lsl 16
    movk    x9, #0x5555
    ands    x10, x0, x9
    lsr     x0, x0, #1
    ands    x0, x0, x9
    adds     x0, x0, x10
    movk    x9, #0x3333, lsl 48
    movk    x9, #0x3333, lsl 32
    movk    x9, #0x3333, lsl 16
    movk    x9, #0x3333
    ands    x10, x0, x9
    lsr     x0, x0, #2
    ands    x0, x0, x9
    adds     x0, x0, x10
    movk    x9, #0x0F0F, lsl 48
    movk    x9, #0x0F0F, lsl 32
    movk    x9, #0x0F0F, lsl 16
    movk    x9, #0x0F0F
    ands    x10, x0, x9 
    lsr     x0, x0, #4
    ands    x0, x0, x9
    adds     x0, x0, x10
    movk    x9, #0x00FF, lsl 48
    movk    x9, #0x00FF, lsl 32
    movk    x9, #0x00FF, lsl 16
    movk    x9, #0x00FF
    ands    x10, x0, x9
    lsr     x0, x0, #8
    ands    x0, x0, x9
    adds     x0, x0, x10
   movk    x9, #0x0000, lsl 48
    movk    x9, #0xFFFF, lsl 32
    movk    x9, #0x0000, lsl 16
    movk    x9, #0xFFFF
    ands    x10, x0, x9
    lsr     x0, x0, #16
    ands    x0, x0, x9
    adds     x0, x0, x10
    movk    x9, #0x0000, lsl 48
    movk    x9, #0x0000, lsl 32
    movk    x9, #0x0000, lsl 16
    movk    x9, #0x007F
    ands    x0, x0, x9
    ret
    .size   popcntRD, .-popcntRD
    // ... and ends with the .size above this line.

    // Every function starts from the .align below this line ...
    .align  2
    .p2align 3,,7
    .global BCD_to_long
    .type   BCD_to_long, %function
BCD_to_long:
    // (STUDENT TODO) Code for BCD_to_long goes here.
    // Input parameter n is passed in X0.
    // Output value is returned in X0.

    movz x1, #0
    movz x2, #0
    movz x3, #0
    movz x4, #0
    movz x9, #0
    movz x10, #0
    movz x13, #0
    movk    x4, #0xFFFF, lsl 48
    movk    x4, #0xFFFF, lsl 32
    movk    x4, #0xFFFF, lsl 16
    movk    x4, #0xFFFF
    movk    x9, #0xF000, lsl 48
    movk    x9, #0x0000, lsl 32
    movk    x9, #0x0000, lsl 16
    movk    x9, #0x0000
    //lsl x0, x0, #4
    for:
    ands x13, x0, x9
    lsr x13, x13, #60
    subs x2,x13,#10
    b.ge .L3
    subs x11, x3, #15
    b.eq .L2
    lsl x0, x0, #4
    adds x10, x1, x13
    adds x13, x1, x13
    lsl x10, x13, #3
    lsl x13, x13, #1
    adds x1, x10, x13
    adds x3, x3, #1
    b for

    .L3:
    movz x0, #0
    adds x0, x0, x4
    ret

    .L2:
    adds x1, x1, x13   
     movz x0, #0
     ands x0, x1, x4 
    ret
    .size   BCD_to_long, .-BCD_to_long
    // ... and ends with the .size above this line.

    // Every function starts from the .align below this line ...
    .align  2
    .p2align 3,,7
    .global str_len
    .type   str_len, %function
str_len:
    // (STUDENT TODO) Code for str_len goes here.
    // Input parameter s is passed in X0.
    // Output value is returned in X0.
    // movz x1, #0
   // movz x2, #0
    movz x3, #0
    movz x9, #0
    movz x4, #0
    movk    x4, #0xFFFF, lsl 48
    movk    x4, #0xFFFF, lsl 32
    movk    x4, #0xFFFF, lsl 16
    movk    x4, #0xFFFF
    movk x9, #0x0000, lsl 48
    movk x9, #0x0000, lsl 32
    movk x9, #0x0000, lsl 16
    movk x9, #0x00FF
    while:
    ldur x2, [x0] 
    ands x2, x2,x9
    adds x2, x2, #0
    b.eq .L1
    adds x0, x0, #1
    adds x3, x3, #1
   
    b while
   .L1:
    movz x0, #0
    ands x0, x3, x4
    ret
    .size   str_len, .-str_len
    // ... and ends with the .size above this line.

    // ***** WEEK 2 deliverables *****
    // Every function starts from the .align below this line ...
    .align  2
    .p2align 3,,7
    .global unicode_to_UTF8
    .type   unicode_to_UTF8, %function
unicode_to_UTF8:
    // (STUDENT TODO) Code for unicode_to_UTF8 goes here.
    // Input parameter n is passed in X0; input parameter c is passed in X1.
    // There are no output values.
    movz x10, #0
    movz x9, #0
    movz x11, #0
    movz x2, #0
    movz x12, #0

    subs x9, x0, #0x007F
    b.le .1B
    subs x9, x0, #0x07FF
    b.le .2B
    movk x11, #0x0000, lsl 48
    movk x11, #0x0000, lsl 32
    movk x11, #0x0000, lsl 16
    movk x11, #0xFFFF
    subs x9, x0, x11
    b.le .3B
    movk x11, #0x0000, lsl 48
    movk x11, #0x0000, lsl 32
    movk x11, #0x0010, lsl 16
    movk x11, #0xFFFF
    subs x9, x0, x11
    b.le .4B
    b .5B


    .1B:
     movk x11, #0x0000, lsl 48
    movk x11, #0x0000, lsl 32
    movk x11, #0x0000, lsl 16
    movk x11, #0x007F
    ands x11, x0, x11
    sturb w11, [x1]
    ldur x2, [x1]
    adds x1,x1,#1
    movz x12, #0
    movz x9, #1
    movz x11, #0
    .loop:
    subs x12, x9, #4
    b.eq .end
    sturb w11, [x1]
     ldur x2, [x1]
    adds x1,x1,#1
    adds x9,x9,#1
    b .loop






    .2B:
    movk x10, #0x07C0
    lsr x10, x10, #48
    ands x10, x0, x10
    adds x10, x10, #0xC0
    sturb w10, [x1]
    ldur x2, [x1]
    adds x1, x1, #1
    movz x10, #0
    movk x10, #0x003F
    lsr x10, x10, #48
    ands x10, x0, x10
    adds x10, x10, #0x80
    sturb w10, [x1]
    ldur x2, [x1]
    ret

    .3B:
    movk x11, #0x0000, lsl 48
    movk x11, #0x0000, lsl 32
    movk x11, #0x0000, lsl 16
    movk x11, #0xF000
    ands x11, x0, x11
    lsr x11, x11, #12
    adds x11, x11, #0xE0
    sturb w11, [x1]
    ldur x2, [x1]
    adds x1, x1, #1
    
    movk x11, #0x0000, lsl 48
    movk x11, #0x0000, lsl 32
    movk x11, #0x0000, lsl 16
    movk x11, #0x0FC0
    ands x11, x0, x11
    lsr x11, x11, #6
    adds x11, x11, #0x80
    sturb w11, [x1]
    ldur x2, [x1]
    adds x1, x1, #1

    movk x11, #0x3F
    ands x11, x0, x11
    adds x11, x11, #0x80
    sturb w11, [x1]
    ldur x2, [x1]
    ret

    .4B:
    movk x11, #0x0000, lsl 48
    movk x11, #0x0000, lsl 32
    movk x11, #0x001C, lsl 16
    movk x11, #0x0000
    ands x11, x0, x11
    lsr x11, x11, #18
    adds x11, x11, #0xF0
    sturb w11, [x1]
    ldur x2, [x1]
    adds x1, x1, #1
    

    movk x11, #0x0000, lsl 48
    movk x11, #0x0000, lsl 32
    movk x11, #0x0003, lsl 16
    movk x11, #0xF000
    ands x11, x0, x11
    lsr x11, x11, #12
    adds x11, x11, #0x80
    sturb w11, [x1]
    ldur x2, [x1]
    adds x1, x1, #1
  

    movk x11, #0x0000, lsl 48
    movk x11, #0x0000, lsl 32
    movk x11, #0x0000, lsl 16
    movk x11, #0x0FC0
    ands x11, x0, x11
    lsr x11, x11, #6
    adds x11, x11, #0x80
    sturb w11, [x1]
    ldur x2, [x1]
    adds x1, x1, #1
   

    movk x11, #0x3F
    ands x11, x0, x11
    adds x11, x11, #0x80
    sturb w11, [x1]
     ldur x2, [x1]
    subs x1, x1, #3
   
    ret

    .5B:
    movz x12, #0
    movz x9, #1
    movz x11, #0
    .for:
    subs x12, x9, #5
    b.eq .end
    sturb w11, [x1]
     ldur x2, [x1]
    adds x1,x1,#1
    adds x9,x9,#1
    b .for

   .end:
 
    ret


    .size   unicode_to_UTF8, .-unicode_to_UTF8
    // ... and ends with the .size above this line.

    // Every function starts from the .align below this line ...
    .align  2
    .p2align 3,,7
    .global gcd_rec
    .type   gcd_rec, %function
gcd_rec:
    // (STUDENT TODO) Code for gcd_rec goes here.
    // Input parameter m is passed in X0; input parameter n is passed in X1.
    // Output value is returned in X0.
    ret
    .size   gcd_rec, .-gcd_rec
    // ... and ends with the .size above this line.

    // Every function starts from the .align below this line ...
    .align  2
    .p2align 3,,7
    .global gcd_iter
    .type   gcd_iter, %function
gcd_iter:
    // (STUDENT TODO) Code for gcd_iter goes here.
    // Input parameter m is passed in X0; input parameter n is passed in X1.
    // Output value is returned in X0.
    ret
    .size   gcd_iter, .-gcd_iter
    // ... and ends with the .size above this line.

    .section    .rodata
    .align  4
    // (STUDENT TODO) Any read-only global variables go here.

    .data
    // (STUDENT TODO) Any modifiable global variables go here.

    .align  3
