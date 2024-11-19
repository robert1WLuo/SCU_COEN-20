        .syntax     unified
        .cpu        cortex-m4
        .text

// void PutNibble(void *nibbles, uint32_t index, uint32_t nibble) ;

        .global     PutNibble
        .thumb_func
        .align

PutNibble:
        LSRS             R1, R1, 1       //R4=which >> 1

        LDRB            R3, [R0, R1]        //BYTE = R4
       
        ITTE              CS           //CARRY SET, WHICH &1==1
        ANDCS             R3, R3, 0xF   //EXTRACT HIGHEST 4 BIT
        LSLCS             R2, R2, 4             //LEFT SHIFT 4
        ANDCC             R3, R3, 0xF0   //EXTRACT LOWER 4 BIT
        ORR             R3, R3, R2    //OR WITH VALUE 
        
        STRB             R3, [R0, R1]

        BX          LR
       

// uint32_t GetNibble(void *nibbles, uint32_t index) ;

        .global     GetNibble
        .thumb_func
        .align

GetNibble:
	//Implementation

        LSRS             R1, R1, 1       //R4 = WHICH>>1
        LDRB            R0, [R0,R1]     //R3=NIBBLES[WHICH>>1]

        IT              CS
        LSRCS           R0, R0, 4
        AND             R0, R0, 0xF        
        
        BX          LR
  