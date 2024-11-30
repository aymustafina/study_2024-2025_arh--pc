%include 'in_out.asm'

SECTION .data
msg db "Результат: ",0

SECTION .text
global _start

_start:
pop ecx
pop edx
sub ecx,1
mov esi, 0

next:
cmp ecx,0h ; проверка количества аргуметов
jz _end;если больше нт аргуметов переходи к энду

pop eax ;
call atoi ; из строки в число
add eax, 10 ; Прибавляем 10
imul eax, eax, 3 ; Умножаем на 3
add esi, eax ; Суммируем значения
loop next ; Переходим к другому аргументу

_end:
mov eax, msg ;  "Результат: "
call sprint
mov eax, esi ; Замисываем полученное значение
call iprintLF
call quit
