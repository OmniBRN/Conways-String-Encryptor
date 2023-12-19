.data
    m: .space 4
    n: .space 4
    mOld: .space 4
    nOld: .space 4
    p: .space 4
    x: .space 4
    y: .space 4
    k: .space 4
    interatia: .long 0
    i: .long 1
    j: .long 1
    unu: .long 1
    doi: .long 2
    trei: .long 3
    opt: .long 8
    zece: .long 10
    viata: .space 4
    nrVecinii: .long 0
    indexCurent: .space 4

    criptare: .space 4
    lungimeParola: .space 4
    numarElementeMatrice: .space 4
    matrix: .zero 1600
    matrixNew: .zero 1600
    Vector: .space 10
    sirHexa: .space 22
    parola: .space 10
    criptata: .space 10
    dummy: .space 1
    litera: .space 1
    s: .long 0
    nmsIndex: .long 0
    nms2Index: .long 0
    maxx: .long 0xffffffff
    hexa: .asciz "0123456789ABCDEF"
    formatPrintf2: .asciz "%d"
    s0x: .asciz "0x"
    formatScanf: .asciz "%d"
    formatPrintf: .asciz "%d "
    formatScanf2: .asciz "%s"
    formatPrintf3: .asciz "%s"
    endl: .asciz "\n"
    test: .asciz "test\n"
.text
.global main
main:

    push $m
    push $formatScanf
    call scanf
    addl $8, %esp

    push $n
    push $formatScanf
    call scanf
    addl $8, %esp

    movl m, %eax
    movl %eax, mOld
    incl mOld
    addl $2, m
    movl n, %eax
    movl %eax, nOld
    incl nOld
    addl $2, n

    push $p
    push $formatScanf
    call scanf
    addl $8, %esp
    
    xor %ecx, %ecx

et_1:
    cmp %ecx, p
    je et_2

    push %ecx

    push $x
    push $formatScanf
    call scanf
    addl $8, %esp

    push $y
    push $formatScanf
    call scanf
    addl $8, %esp

    pop %ecx

    lea matrix, %edi

    incl x
    incl y
    movl x, %eax
    mull n
    addl y, %eax
    movl $1, (%edi, %eax, 4)    

    incl %ecx
    jmp et_1


et_calcVecinii:

    movl indexCurent, %eax

    subl n, %eax
    movl (%edi, %eax, 4), %ebx
    addl %ebx, nrVecinii

    subl $1, %eax
    movl (%edi, %eax, 4), %ebx
    addl %ebx, nrVecinii

    addl $2, %eax
    movl (%edi, %eax, 4), %ebx
    addl %ebx, nrVecinii

    addl n, %eax
    movl (%edi, %eax, 4), %ebx
    addl %ebx, nrVecinii

    subl $2, %eax
    movl (%edi, %eax, 4), %ebx
    addl %ebx, nrVecinii

    addl n, %eax
    movl (%edi, %eax, 4), %ebx
    addl %ebx, nrVecinii

    addl $2, %eax
    movl (%edi, %eax, 4), %ebx
    addl %ebx, nrVecinii

    subl $1, %eax
    movl (%edi, %eax, 4), %ebx
    addl %ebx, nrVecinii

    subl n, %eax

    jmp et_intoarcere_3_1

et_MN1:
    lea matrixNew, %edi
    movl indexCurent, %eax
    movl $1, (%edi, %eax, 4)
    jmp et_intoarcere_3_2

et_MN2:
    lea matrixNew, %edi
    movl indexCurent, %eax
    movl $0, (%edi, %eax, 4)
    jmp et_intoarcere_3_2

et_moarte:

    movl nrVecinii, %ebx
    cmp %ebx, trei
    je et_MN1
    jne et_MN2

et_viata:

    movl nrVecinii, %ebx
    cmp doi, %ebx
    jl et_MN2
    cmp trei, %ebx
    jg et_MN2
    jmp et_MN1

et_2:
    push $k
    push $formatScanf
    call scanf 
    addl $8, %esp

et_3:
    movl interatia, %ecx
    cmp %ecx, k
    je et_4
    movl $1, i
    movl $1, j

        et_3_1:
            movl i, %ecx
            cmp %ecx, mOld
            je et_3_cont
                et_3_1_1:
                    movl j, %ecx
                    cmp %ecx, nOld
                    je et_3_1_cont
                    
                    movl n, %eax
                    mull i
                    addl j, %eax

                    movl %eax, indexCurent
                    movl (%edi, %eax, 4), %ebx
                    movl %ebx, viata

                    jmp et_calcVecinii

                    et_intoarcere_3_1:

                        movl viata, %eax
                        cmp %eax, unu
                        je et_viata
                        jne et_moarte

                    et_intoarcere_3_2:
                        lea matrix, %edi
                        incl j
                        movl $0, nrVecinii
                        jmp et_3_1_1
        et_3_1_cont:
            incl i
            movl $1, j
            jmp et_3_1


    et_3_cont:
        movl $1, i
        movl $1, j
            et_3_2:
                movl i, %ecx
                cmp %ecx, mOld
                je et_3_cont_cont
                    et_3_2_1:
                        movl j, %ecx
                        cmp %ecx, nOld
                        je et_3_2_cont
                        movl n, %eax
                        mull i
                        addl j, %eax

                        lea matrixNew, %edi
                        movl (%edi, %eax, 4), %ebx
                        lea matrix, %edi
                        movl %ebx, (%edi, %eax, 4)


                        incl j
                        jmp et_3_2_1
            et_3_2_cont:
                incl i
                movl $0, j
                jmp et_3_2
    et_3_cont_cont:
        incl interatia
        jmp et_3

et_4:
    
    push $criptare
    push $formatScanf
    call scanf
    addl $8, %esp
    movl criptare, %eax
    cmp %eax, unu
    jne et_criptare
    je et_decriptare

et_clean:

    push %ebx
    movl s, %ebx
    addl indexCurent, %ebx
    movl %ebx, s
    movl $0, indexCurent
    pop %ebx
    jmp et_criptare_for_cont

et_meme:

    lea Vector, %edi
    push %eax
    movl nms2Index, %eax
    movb %dl, (%edi, %eax, 1)
    incl nms2Index
    movl $0, nmsIndex
    pop %eax
    xor %dl, %dl
    jmp et_criptare_for_cont_2

et_adauga:
    

    addb $1, %dl
    
    incl nmsIndex
    movl nmsIndex, %eax
    cmp %eax, opt
    je et_meme
    shl $1, %dl
    jmp et_criptare_for_cont_2


et_ramane:

    incl nmsIndex
    movl nmsIndex, %eax
    cmp %eax, opt
    je et_meme
    shl $1, %dl
    jmp et_criptare_for_cont_2

et_criptare:

    push $parola
    push $formatScanf2
    call scanf
    addl $8, %esp
    
    
    lea parola, %edi
    xor %ecx, %ecx
    xor %eax, %eax
    mov $0xffff, %cx
    repne scasb
    not %cx
    sub $1, %cx
    mov %cx, lungimeParola
    movl lungimeParola, %eax
    mull opt
    movl %eax, lungimeParola
    
    movl m, %eax
    mull n
    movl %eax, numarElementeMatrice

    lea matrix, %edi
    movl $0, indexCurent
    xor %edx, %edx

    et_criptare_for:

        movl indexCurent, %ecx
        addl s, %ecx
        cmp %ecx, lungimeParola
        je et_criptare_2
        
        movl indexCurent, %ecx
        cmp %ecx, numarElementeMatrice
        je et_clean
    et_criptare_for_cont:
        movl (%edi, %ecx, 4), %ebx
        addl maxx, %ebx

        jc et_adauga
        jnc et_ramane
    
    et_criptare_for_cont_2:
        incl indexCurent
        lea matrix, %edi
        jmp et_criptare_for

    jmp et_criptare_2



et_criptare_2:
    movl lungimeParola, %ebx
    shr $3, %ebx
    movl %ebx, lungimeParola
    movl $0, indexCurent
    xor %ebx, %ebx
    et_criptare_2_1:
        movl indexCurent, %ecx
        cmp %ecx, lungimeParola
        je et_criptare_3
        lea Vector, %edi
        movb (%edi, %ecx, 1), %dl
        lea parola, %edi
        movb (%edi, %ecx, 1), %bl

        xorb %dl, %bl
        lea criptata, %edi
        movb %bl ,(%edi, %ecx, 1)

        incl indexCurent
        jmp et_criptare_2_1




et_print_syscall:
    
    lea hexa, %edi
    movb (%edi, %edx, 1), %bl
    movb %bl, litera

    push %edx

    movl $4, %eax
    movl $1, %ebx
    movl $litera, %ecx
    movl $1, %edx
    int $0x80

    pop %edx
    jmp et_criptare_3_1_cont

et_print_syscall_2:
    
    lea hexa, %edi
    movb (%edi, %edx, 1), %bl
    movb %bl, litera

    push %edx

    movl $4, %eax
    movl $1, %ebx
    movl $litera, %ecx
    movl $1, %edx
    int $0x80

    pop %edx
    jmp et_criptare_3_1_cont_2


et_criptare_3:
    
    push $s0x
    call printf
    addl $4, %esp

    pushl $0
    call fflush
    addl $4, %esp
    
    movl $0, indexCurent
    xor %ebx, %ebx
    et_criptare_3_1:
        movl indexCurent, %ecx
        cmp %ecx, lungimeParola
        je et_end
        lea criptata, %edi
        movb (%edi, %ecx, 1), %dl
        movb %dl, dummy
        andb $0xf0, %dl
        shr $4, %dl
        jmp et_print_syscall

    et_criptare_3_1_cont:

        movb dummy, %dl
        andb $0x0f, %dl
        jmp et_print_syscall_2

    et_criptare_3_1_cont_2:

        incl indexCurent
        jmp et_criptare_3_1

et_decriptare:

et_end:

    pushl $0
    call fflush
    addl $4, %esp

    push $endl
    call printf
    addl $4, %esp

    mov $1, %eax
    mov $0, %ebx
    int $0x80
