// void CopyCell(uint32_t *dst, uint32_t *src) ;        // R0 = dst, R1 = src

            .syntax     unified
            .cpu        cortex-m4
            .text

            .global     CopyCell
            .thumb_func
            .align
CopyCell:   
            PUSH        {R4-R11}
            LDR         R2,=60
           //R0 = DST, R1=SRC, R2=ROW(START AT 60)   
                 
NextRow1:   
            .rept       6               //REPEAT 6 TIMES
            LDMIA       R1!, {R3-R12}   
            STMIA       R0!, {R3-R12}
            .endr                       //END LOOP 
            ADD         R0,R0, 720      //DST += 4(240-80)
            ADD         R1, R1, 720     //SRC +=4(240-80)
            SUBS.N      R2,R2, 1 
            BNE         NextRow1
EndRows1:                  
            POP         {R4 - R11}
            BX          LR
// void FillCell(uint32_t *dst, uint32_t color) ;       // R0 = dst, R1 = color
            .global     FillCell
            .thumb_func
            .align 
FillCell:   
            LDR         R2, =60         //ROW =60

NextRow2:   
            LDR         R3, =30         //COL =60

NextCol2:   
            STRD        R1,R1, [R0], 8
            SUBS.N      R3, R3, 1       
            BNE         NextCol2            //LOOP INNER     
            ADD         R0, R0, 720
            SUBS.N         R2, R2, 1
            BNE         NextRow2            //LOOP OUTER
            BX          LR

            .end















