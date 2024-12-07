%include 'in_out.asm'

SECTION .data
div: DB 'Результат: ',0

SECTION .text
GLOBAL _start

_start:
    ; ---- Вычисление выражения (3 + 2) * 4 + 5 ----
    mov ebx, 3      ; Загружаем 3 в ebx
    add ebx, 2      ; Прибавляем 2 (ebx = 3 + 2 = 5)
    
    mov eax, ebx    ; Загружаем результат (5) в eax
    mov ecx, 4      ; Загружаем 4 в ecx
    mul ecx         ; Умножаем eax на ecx (eax = 5 * 4 = 20)
    
    add eax, 5      ; Прибавляем 5 (eax = 20 + 5 = 25)
    
    mov edi, eax    ; Сохраняем результат в edi

    ; ---- Вывод результата на экран ----
    mov eax, div    ; Загружаем адрес строки результата
    call sprint     ; Выводим строку "Результат: "
    
    mov eax, edi    ; Загружаем результат в eax для вывода
    call iprintLF   ; Выводим результат с переводом строки
    
    call quit       ; Завершение программы

