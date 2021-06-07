Поднятие небольшого кластера с использованием технологии Кубернетес. Кластер поднимается на локальном машине в среде minikube. Это по сути вебсервер. состоящий из nginx, phpmyadmin (со своим nginx), wordpress (со своим nginx), mysql (для wordpress), telegraf (для сбора метрик), grafana (для визуаизации метрик), influxdb (для хранения метрик), ftps (для обмена файлами с сервером).

![cluster structure](https://user-images.githubusercontent.com/67025828/121060532-73cc7600-c7cb-11eb-9f09-a7807ff814de.png)
