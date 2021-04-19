#numA: $2
#numB: $3
#numC: $4
#numD: $5
#segundoMayor: $6
#primerMayor: $a3
#referencia1: $t1

#Carga Datos
addi $2, $zero, 2
addi $3, $zero, 4
addi $4, $zero, 1
addi $5, $zero, 3
addi $t1, $zero, 1

jal segundoNumeroMayor
*breakpoint: beq $t1, $t1, breakpoint

segundoNumeroMayor:
    #$t0=1 si $2 > $3, $t0=0 si $2 < $3
    sgt $t0, $2, $3
    beq $t0, $t1, mayorA
    beq $t0, $zero, mayorB

    #cuando el mayor es A
    mayorA:
        move $a3, $2
        move $6, $3
        j comparaC
    
    #cuando el mayor es B
    mayorB:
        move $6, $2
        move $a3, $3
        j comparaC

    comparaC:
        #compara C contra el primer mayor
        #$t0=1 si $4 > $a3, $t0=0 si $4 < $a3
        sgt $t0, $4, $a3
        beq $t0, $t1, primerMayorC

        #compara C contra el segundo mayor
        sgt $t0, $4, $6
        beq $t0, $t1, segundoMayorC
        j comparaD

    #cuando C es el primer mayor
    primerMayorC:
        move $6, $a3
        move $a3, $4 
        j comparaD

    #cuando C es el segundo mayor
    segundoMayorC:
        move $6, $4 
        j comparaD

    comparaD:
        #compara D contra el primer mayor
        #$t0=1 si $5 > $a3, $t0=0 si $5 < $a3
        sgt $t0, $5, $a3
        beq $t0, $t1, primerMayorD

        #compara D contra el segundo mayor
        sgt $t0, $5, $6
        beq $t0, $t1, segundoMayorD
        j fin

    #cuando D es el primer mayor
    primerMayorD:
        move $6, $a3
        move $a3, $5 
        j fin

    #cuando D es el segundo mayor
    segundoMayorD:
        move $6, $5 
        j fin
    
    fin:
        jr $ra