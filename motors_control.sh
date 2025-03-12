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

# функция для движение вперед
move_forward() {
    DIRECTION="forward"
    set_speed "A" 75
    set_speed "B" 75
    echo "Робот двигается вперед (скорость: A=$MOTOR_A_SPEED%, B=$MOTOR_B_SPEED%)"
}

# Функция движение назад
move_backward() {
    DIRECTION="backward"
    set_speed "A" 75
    set_speed "B" 75
    echo "Робот двигается назад (скорость: A=$MOTOR_A_SPEED%, B=$MOTOR_B_SPEED%)"
}

#Функция остановки
stop_motors() {
    DIRECTION="stopped"
    set_speed "A" 0
    set_speed "B" 0
    echo "Робот остановилься"
}

# Интервью оператора
echo "Сработал скрипт для управление работы мотора"
echo "Команды: f (вперед), b (назад), s (остановка), q (выход)"

while true; do
    read -p "введите команду: " command
    case $command in
        "f")
            move_forward
            ;;
        "b")
            move_backward
            ;;
        "s")
            stop_motors
            ;;
        "q")
            echo "конец скрипта"
            exit 0
            ;;
        *)
            echo "Команда отклонен. Проверте следующые команды: f, b, s, q"
            ;;
    esac
done
