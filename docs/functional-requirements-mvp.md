# Функциональные требования MVP
## Общее
I. Для удобства восприятия и документирования система разделена на контексты. Контекст - набор функциональных требований, доступных пользователю в данный момент. Пользователь всегда находится в ровно одном контексте.

II. Если не сказано иного, после завершения функционального сценария, пользователь остаётся в том же контексте, из которого начал функциональный сценарий.

III. Из любого контекста пользователь может вернуться в предыдущий контекст, вплоть до стартового.

IV. Из любого контекста пользователь может выйти из системы.

## Авторизация
1. Я, как гость, в гостевом контексте регистрируюсь в системе, вводя логин и пароль. После чего становлюсь соответствующим участником и перехожу в стартовый контекст.
2. Я, как гость, в гостевом контексте аутентифицируюсь в системе, вводя логин и пароль, соответствующие тем, по которым я ранее зарегистрировался. После чего становлюсь соответствующим участником и перехожу в стартовый контекст.

## Аккаунт
3. Я, как участник, в любом контексте выхожу из аккаунта. После чего становлюсь гостем и перехожу в гостевой контекст.

## Привычки
### Создание привычки
4. Я, как участник, в стартовом контексте перехожу в контекст создания привычки. Если я выйду из этого контекста до подтверждения создания, то никакие введённые данные в этом контексте не сохранятся.
5. Я, как участник, в контексте создания привычки вижу список шаблонов привычек, где для каждого шаблона указано название привычки, тип отметок, периодичность отметок, цель привычки.
6. Я, как участник, в контексте создания привычки выбираю один из шаблонов привычек и создаю свой экземпляр такой привычки, чтобы потом сравнивать свои результаты этой привычки с общими результатами других пользователей по этому шаблону. Этим же действием я подтверждаю создание и перехожу в контекст этой свежесозданной привычки. Параметры этой привычки равны параметрам шаблона привычки.

### Привычка
7. Я, как участник, в стартовом контексте вижу список своих привычек, где для каждой привычки указано название привычки, тип отметок, периодичность отметок, цель привычки.
8. Я, как участник, в стартовом контексте выбираю одну из своих привычек и перехожу в контекст этой привычки.
9. Я, как участник, в контексте привычки вижу название привычки, тип отметок, периодичность отметок, цель привычки и список отметок, где для каждой отметки указан таймстемп и значение.

### Отметки привычки
Список всех таймстемпов привычки - это таймстемпы от момента создания привычки до текущего момента, расположенные с периодичностью, заданной при создании привычки, плюс некоторое количество таймстемпов в будущем, число которых зависит от периодичности. Доступным считается такой таймстемп из этого списка, для которого не существует отметки.

10. Я, как участник, в контексте привычки добавляю отметку к этой привычке, выбрав доступный таймстемп и введя значение.
11. Я, как участник, в контексте привычки, выбрав конкретную отметку, изменяю её значение.

## Группа
### Создание группы
12. Я, как участник, в стартовом контексте перехожу в контекст создания группы. Если я выйду из этого контекста до подтверждения создания, то никакие введённые данные в этом контексте не сохранятся.
13. Я, как участник, в контексте создания группы ввожу её название.
14. Я, как участник, в контексте создания группы подтверждаю её создание с параметрами, которые были введены мною ранее, и перехожу в контекст этой свежесозданной группы и становлюсь участником группы. Я могу подтвердить создание группы, только если я корректно ввёл название.

### Группа
15. Я, как участник, в стартовом контексте вижу список групп, участником которых я явлюсь, причём для каждой группы указано её название.
16. Я, как участник, в стартовом контексте выбираю группу и перехожу в её контекст, становясь участником группы.
17. Я, как участник группы, в контексте группы вижу её название.