#!/bin/bash

# переменные для стимуляси положение мотора
MOTOR_A_SPEED=0
MOTOR_B_SPEED=0
DIRECTION="stopped"

# функция для управление скорости
set_speed() {
    motor=$1
    speed=$2
    if [ "$motor" == "A" ]; then
        MOTOR_A_SPEED=$speed
    elif [ "$motor" == "B" ]; then
        MOTOR_B_SPEED=$speed
    fi
    echo "скорость мотора $motor изменен на $speed% "
}

# функция плавного изменение скорости
smooth_speed_change() {
    target_speed=$1
    steps=5  # Количество шагов
    delay=0.5  # Пауза между шагами(в секундах)

# Текуший скорость для A и B моторов считаем средним
    current_speed=$(( (MOTOR_A_SPEED + MOTOR_B_SPEED) / 2 ))
    step_size=$(( (target_speed - current_speed) / steps ))

    for ((i=1; i<=steps; i++)); do
        new_speed=$(( current_speed + step_size * i ))
        set_speed "A" "$new_speed"
        set_speed "B" "$new_speed"
        sleep $delay
    done
    echo "Скорость плавно переходил и достиг в  $target_speed% "
}

# функция для движение вперед
move_forward() {
    DIRECTION="forward"
    smooth_speed_change 75
    echo "Робот двигается вперед (скорость: A=$MOTOR_A_SPEED%, B=$MOTOR_B_SPEED%)"
}
# Функция движение назад
move_backward() {
    DIRECTION="backward"
    smooth_speed_change 75
    echo "Робот двигается назад (скорость: A=$MOTOR_A_SPEED%, B=$MOTOR_B_SPEED%)"
}

#Функция остановки
stop_motors() {
    DIRECTION="stopped"
    smooth_speed_change 0	 
    echo "Робот остановился"
}

# Интервью оператора
echo "Сработал скрипт для управление работы мотора"
echo "Команды: f (вперед), b (назад), s (остановка), speed <значение> (0-100), q (выход)"


while true; do
    read -p "Команда: " command
#Команда для удаление пустих  мест
    command=$(echo "$command" | xargs)
    case "$command" in
        "f")
            move_forward
            ;;
        "b")
            move_backward
            ;;
        "s")
            stop_motors
            ;;
	"speed"*)
	    speed_value="${command#speed }"
            if [[ "$speed_value" =~ ^[0-9]+$ ]] && [ "$speed_value" -ge 0 ] && [ "$speed_value" -le 100 ]; then
                smooth_speed_change "$speed_value"
            else
                echo "Неверное значение скоросты. Введите число от 0 до 100 ."
            fi
            ;;
        "q")
            echo "Скрипт завершен"
            exit 0
            ;;
        *)
            echo "Команда отклонен. Проверте следующые команды: f, b, s, speed <значение>,q"
            ;;
    esac
done
