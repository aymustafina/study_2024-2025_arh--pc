%include 'in_out.asm'
SECTION .data
msg_x: DB 'Введите значение переменной x: ', 0
msg_a: DB 'Введите значение переменной a: ', 0
res: DB 'Результат: ', 0

SECTION .bss
x: RESB 80
a: RESB 80
SECTION .text
GLOBAL _start
_start:

mov ebx, 5

mov eax, msg_x
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax, x
call atoi
mov edi, eax

mov eax, msg_a
call sprint
mov ecx, a
mov edx, 80
call sread
mov eax, a
call atoi
mov esi, eax
;----------------------------
cmp esi, edi ;сравниваем
jle sub_v
mov eax, ebx
jmp fin

sub_v:
mov eax, edi
sub eax, esi

fin:
mov edi, eax
mov eax, res
call sprint


mov eax, edi
call iprintLF
call quit
