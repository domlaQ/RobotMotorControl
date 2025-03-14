# RobotMotorControl
## Общее описание проекта RobotMotorsControl
Проект RobotMotorsControl включает в себя скрипт на bash для управления двигателями робота. Цель — управление двигателями, включая движение вперед/назад, остановку и регулировку скорости. 
## Описание работы с Git
### Создание и клонирование репозитория
    1. На GitHub был создан новый репозиторий под названием RobotMotorsControl: 
        ◦ Через опцию “New repository” создан приватный репозиторий. 
        ◦ Добавлен начальный файл README.md.
    2. Репозиторий был клонирован на локальный компьютер: 
       bash
       git clone https://github.com/username/RobotMotorsControl.git  
        ◦ После клонирования выполнен переход в папку проекта с помощью cd RobotMotorsControl.
Процесс сохранения изменений
Для сохранения изменений использовалась следующая последовательность: 
    1. Добавление файлов: 
       bash
       git add . 
    2. Коммит: 
       bash
       git commit -m "Сообщение"  
       Например: git commit -m "Initial commit" 
    3. Загрузка на GitHub: 
       bash
       git push origin main  
       Взаимодействие с ветками
    • Создание новой ветки: Ветка с названием feature_motor_speed была создана командой: 
      bash
      git checkout -b feature_motor_speed  
    • Внесение изменений: В этой ветке в файл motors_control.sh добавлены плавное изменение скорости и пользовательский интерфейс. 
    • Слияние (merge): Изменения были объединены с веткой main следующим образом: 
        1. Ветка отправлена на GitHub: 
           bash
           git push origin feature_motor_speed  
        2. На GitHub создан pull request и выполнен merge в main.
Пул-реквесты
    • Создание Pull Request: Из ветки feature_motor_speed в main открыт pull request: 
        ◦ Заголовок: “Add smooth speed change and user input features” 
        ◦ Описание: Описаны добавленные функции плавного изменения скорости и команд пользователя. 
        ◦ Процесс ревью: Ревью не было, но код был протестирован. 
        ◦ Принятые изменения: Pull request утвержден, объединен с main, после чего ветка удалена.
Основные изменения и улучшения в коде
    • smooth_speed_change: Добавлена функция пошагового изменения скорости для плавного увеличения/уменьшения. 
    • Пользовательский интерфейс: Создано взаимодействие через терминал с командами: 
        ◦ f (вперед), b (назад), s (стоп), speed <значение> (изменение скорости), q (выход).
    • Структура кода: Функции укреплены, повышена устойчивость к ошибкам.
Заключение
Работа с Git обеспечила удобство управления версиями проекта. Эксперименты с ветками и объединение изменений через pull request оказались весьма эффективными. В будущем планируется: 
    • Интеграция сенсоров (например, датчиков расстояния или линии). 
    • Разработка GUI-интерфейса для улучшения пользовательского опыта. 
    4. Сохранение изменений на GitHub
После обновления файла README.md загрузите изменения в репозиторий: 
    1. Добавление файла: 
       bash
       git add README.md  
    2. Коммит: 
       bash
       git commit -m "Updated README with project report"  
    3. Отправка: 
       bash
       git push origin main  
    4. Проверка: 
        ◦ Проверьте локальный статус с помощью git status. 
        ◦ Зайдите на страницу репозитория на GitHub и убедитесь, что файл README.md обновлен.
Результат
    • Изменения из ветки feature_motor_speed объединены с main, pull request закрыт. 
    • В файле README.md содержится полный отчет о проекте и процессе работы с Git. 

