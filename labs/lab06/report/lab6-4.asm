;--------------------------------
; Программа вычисления выражения
;--------------------------------
%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg: DB 'Введите значение для переменной x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80; переменная
SECTION .text
GLOBAL _start
_start:
; ---- Вычисление выражения

mov eax, msg
call sprintLF

mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x

mov ebx, eax
mul eax     ;x^3
mul ebx      ; перемножили х для получения куба
xor ebx, ebx          ;Обнуляем для корректного деления
mov ebx, 3     ; 

div ebx        ;x^3 / 3 делим
xor ebx, ebx
add eax, 21     ;x^3 / 3 + 21 прибавляем

mov edi,eax     ;
; ---- Вывод результата на экран


mov eax,rem ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprint ; из 'edi' в виде символов
call quit ; вызов подпрограммы завершения
