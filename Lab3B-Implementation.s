        .syntax         unified
        .cpu            cortex-m4
        .text


// int32_t Return32Bits(void) ;
        .global         Return32Bits
        .thumb_func
        .align
Return32Bits:
	//Implementation
        MOV             R0, 10
        BX              LR


// int64_t Return64Bits(void) ;
        .global         Return64Bits
        .thumb_func
        .align
Return64Bits:
	//divide 64bits 10 to lower and upper parts, then do 2's compliment
        MOV             R0, 0XFFFFFFF6 //lower 32 bits of -10
        MOV             R1, 0XFFFFFFFF // upper 32 bits of -10
        BX              LR


// uint8_t Add8Bits(uint8_t x, uint8_t y) ;
        .global         Add8Bits
        .thumb_func
        .align
Add8Bits:
	//Implementation

        LDRSB           R0, [R0]  //R0 <- x 
 
        LDRSB           R1, [R1]  // R1 <- y
        ADD             R0, R0, R1  // R0 =R0+R1 
        BX              LR


// uint32_t FactSum32(uint32_t x, uint32_t y) ;
        .global         FactSum32
        .thumb_func
        .align
FactSum32:
	//Implementation
    
        ADD             R0, R0, R1  //x+y
        PUSH            {R4,LR}
        BL              Factorial    
        pop             {R4,LR}
        BX              LR


// uint32_t XPlusGCD(uint32_t x, uint32_t y, uint32_t z) ;
        .global         XPlusGCD
        .thumb_func
        .align

XPlusGCD:
	//Implementation
        PUSH            {R4, LR}
        MOV             R4, R0
        MOV             R0, R1
        MOV             R1, R2 
        
        BL              gcd          //gcd(y, z)
        ADD             R0, R0, R4   //x+gcd(y, z)
        POP             {R4, PC} 
  

        .end


