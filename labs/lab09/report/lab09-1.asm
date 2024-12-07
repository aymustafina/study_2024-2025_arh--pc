%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x: ',0
result: DB 'f(g(x)) = ',0

SECTION .bss
x: RESB 80
res: RESB 80

SECTION .text
GLOBAL _start

_start:
;------------------------------------------
; Основная программа
;------------------------------------------
    mov eax, msg
    call sprint              ; 'Введите x: '
    
    mov ecx, x
    mov edx, 80
    call sread              ; Ввод x с клавиатуры
    
    mov eax, x
    call atoi               ; Преобразование ASCII кода в число, eax=x
    
    call _calcul            ; Вызов подпрограммы _calcul
    
    mov eax, result
    call sprint             ; 'f(g(x)) = '
    
    mov eax, [res]         ; Получаем результат из памяти
    call iprintLF          ; Выводим результат
    
    call quit              ; Завершение программы

;------------------------------------------
; Подпрограмма вычисления выражения "f(g(x))"
; f(x) = 2x + 7, g(x) = 3x - 1
;------------------------------------------
_calcul:
    push eax                ; Сохраняем x на стеке
    call _subcalcul         ; Вызываем подпрограмму _subcalcul
    pop ebx                 ; Восстанавливаем x из стека (если нужно)

    ; Теперь eax содержит g(x), вычисляем f(g(x))
    mov ebx, 2
    mul eax                 ; Умножаем g(x) на 2
    add eax, 7              ; Добавляем 7
    mov [res], eax          ; Сохраняем результат в res
    ret                     ; Возврат в основную программу

;------------------------------------------
; Подпрограмма вычисления g(x)
; g(x) = 3x - 1
;------------------------------------------
_subcalcul:
    push eax                ; Сохраняем x на стеке
    mov ebx, 3
    mul ebx                 ; Умножаем x на 3
    sub eax, 1              ; Вычисляем g(x) = 3x - 1
    pop ebx                 ; Восстанавливаем x (если нужно)
    ret                     ; Возврат в _calcul


