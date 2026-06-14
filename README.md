# HW3_tp

Проект состоит из двух основных контейнеров:
- `generator` создает CSV-файл с данными студентов;
- `reporter` читает CSV-файл и создает HTML-отчет.
Папка `data` подключается к контейнерам как `/data`, поэтому созданные файлы остаются в проекте на компьютере.

## Запуск
Сначала нужно собрать Docker-образы:
```bash
./run.sh build_generator
./run.sh build_reporter
```
Потом создать данные и отчет:
```bash
./run.sh run_generator
./run.sh run_reporter
```
После этого в папке `data` появятся файлы:
- `data.csv`
- `report.html`

## Команды

```bash
./run.sh build_generator
./run.sh run_generator
./run.sh build_reporter
./run.sh run_reporter
./run.sh structure
./run.sh clear_data
./run.sh inside_generator
./run.sh inside_reporter
./run.sh report_server
```

## Веб-сервер

Команда `report_server` запускает отдельный контейнер `nginx:alpine`, подключает папку `data` и открывает отчет через порт `8080`.

Перед запуском сервера нужно создать отчет:

```bash
./run.sh run_generator
./run.sh run_reporter
./run.sh report_server
```

Локально отчет открывается по адресу:

```text
http://localhost:8080/report.html
```

Если работа запускается в GitHub Codespaces, нужно открыть вкладку `Ports`, найти порт `8080`, открыть предложенную ссылку и перейти к `/report.html`.
