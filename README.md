# Django events collector example

## Подготовка

Требуется установленные `docker` и `docker-compose`

## Установка

    docker-compose build
    docker-compose up -d

## Настройка

### Установить пароль для root в mysql

См. https://dev.mysql.com/doc/refman/8.0/en/data-directory-initialization.html#data-directory-initialization-password-assignment

    docker-compose exec db mysql -uroot -p${MYSQL_ROOT_PASSWORD}

    mysql> ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'secret123';
    mysql> exit;


### Выполнить миграции django:

    docker-compose exec django python manage.py migrate --no-input && \
    docker-compose exec django python manage.py makemigrations myapp && \
    docker-compose exec django python manage.py migrate myapp

### Выполнить инициализационные скрипты коллектора:

    docker-compose run --rm collector init.sh

## Настроить выполнение задания в планировщике
Пример для cron:

    */5 *   * * *   cd /opt/dataeng docker-compose run --rm collector collect.sh


## Добавление данных 

    docker-compose run --rm collector add_events.sh

## Ручной запуск сбора событий в clickhouse

    docker-compose run --rm collector collect.sh

## Просмотр статистики событий из clickhouse

    docker-compose run --rm collector totals.sh
