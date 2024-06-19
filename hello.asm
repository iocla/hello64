%include "utils/printf64.asm"


section .data
    arr1 db 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x99, 0x88
    len1 equ $-arr1
    arr2 db 0x12, 0x34, 0x56, 0x78, 0x90, 0xab, 0xcd, 0xef
    fmt db `arr1 = %d %x\n\0`
    len2 equ $-arr2
    val1 dd 0xabcdef01
    val2 dd 0x62719012
    twenty dd 0x1000  
 
section .text
global main
extern printf 

main:
    push rbp
    mov rbp, rsp
    mov rdi, 0x123456789abcde00
    mov rax, 0x123456789abcdef0
    nop
    PRINTF64 `rax=%llx\n\x0`, rax
    xor esi, esi
    mov sil, [arr2]  
    imul esi, [twenty]  
    mov ax, si
    
    nop
    mov rsi, 0x123456789abcdef0
    mov rax, rsi
    PRINTF64 `hhx=%hhx hx=%hx x=%x lx=%lx\n\x0` ,rax, rax, rax, rax 
    PRINTF64 `hhd=%hhd hd=%hd d=%d ld=%ld\n\x0` ,rax, rax, rax, rax 
    PRINTF64 `hhu=%hhu hu=%hu u=%u lu=%lu\n\x0` ,rax, rax, rax, rax 


    xor rax, rax
    leave
    ret
