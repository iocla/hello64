%include "utils/printf64.asm"


section .data
    arr1 db 0x11, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x99, 0x88
    twenty dd 0x20  
 
section .text
global main
extern printf 

main:
    push rbp
    mov rbp, rsp
    nop
    ; macro to print lower part of 64bit R/M
    mov rax, 0x123456789abcdef0
    PRINTF64 `hhx=%3hhx hx=%6hx x=%11x lx=%21lx\n\x0` ,rax, rax, rax, rax 
    PRINTF64 `hhd=%3hhd hd=%6hd d=%11d ld=%21ld\n\x0` ,rax, rax, rax, rax 
    PRINTF64 `hhu=%3hhu hu=%6hu u=%11u lu=%21lu\n\x0` ,rax, rax, rax, rax 
    nop

gotcha:    
    mov rsi, rax
    xor esi, esi
    PRINTF64 `rsi=%llx\n\x0`, rsi
welcom_addition: 
    mov sil, [arr1]  
    PRINTF64 `esi=%x\n\x0`, rsi
    imul esi, [twenty]  
    PRINTF64 `esi=%x\n\x0`, rsi

    xor rax, rax
    leave
    ret
