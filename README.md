**Программа по подбору одежды.**

*Версия 1. Автор: Ильин Александр (Ruby 2.4.1)*

**Описание**

Программа спрашивает у пользователя температуру на улице и в ответ предлагает вариант комплекта из подходящей для этой погоды одежды. Описания отдельных вещей хранятся каждый в отдельном текстовом файле в папке `/data`. Файлы можно добавлять. Так же можно добавлять новые типы вещей - тип указывается во второй строке файла. 


**Формат файла `example.txt` в папке `data`:**
```
Название элемента одежды

Тип элемента одежды

(Диапазон подходящих температур)
```

**Пример содержимого файла в папке `data`:**
```
Ботинки

Обувь

(0, 30)
```


**Пример работы программы:**
```
D:\>ruby main.rb

Для выхода из цикла набрать "q"


Сейчас градусов на улице: 12



Градусов за окном: 12 Предлагаю надеть:

Головной убор: Бейсболка  (0..40)

Одежда: Рубашка  (10..25)

Обувь: Ботинки  (0..30)


---------------------
Для выхода из цикла набрать "q"

Градусов за окном: 1 Предлагаю надеть:

Головной убор: Бейсболка  (0..40)

Одежда: Осенняя куртка  (-1..10)

Обувь: Кроссовки  (0..30)

куртка: Пуховик  (-15..5)


---------------------
```
