;---------- Задание для самостоятельной работы -------------------

%include 'in_out.asm'

SECTION .data
msg db "Результат: ",0

SECTION .text
global _start

_start:
    pop ecx          ; Получаем количество аргументов
    pop edx          ; Получаем адрес первого аргумента
    sub ecx, 1      ; Уменьшаем на 1, так как первый аргумент - это имя программы
    mov esi, 0      ; Инициализируем сумму

next:
    cmp ecx, 0h     ; Проверка количества аргументов
    jz _end         ; Если нет аргументов, переходим к завершению

    pop eax         ; Получаем следующий аргумент
    call atoi       ; Преобразуем строку в число
    call f          ; Вызываем функцию f(x)
    add esi, eax    ; Суммируем значения
    loop next       ; Переходим к следующему аргументу

_end:
    mov eax, msg    ; Подготовка сообщения "Результат: "
    call sprint     ; Выводим сообщение
    mov eax, esi    ; Загружаем полученное значение
    call iprintLF   ; Выводим результат
    call quit       ; Завершение программы

; Подпрограмма для вычисления f(x)
; f(x) = (x + 10) * 3
f:
    add eax, 10     ; Прибавляем 10
    imul eax, eax, 3; Умножаем на 3
    ret              ; Возвращаемся из подпрограммы

