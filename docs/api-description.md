Panpipe API

# Auth

### POST auth/signIn
- **body**:\
{ login : string,\
password : string  }
- **response**:\
{ user_id : uuid,\
login : string,\
name : string }

### POST auth/signUp
- **body**:\
{ login : string,\
?name : string,\
password : string  }
- **response**:\
{ user_id : uuid,\
login : string,\
name : string }

### POST auth/signOut
- **response**: {}

# User

### GET /users/{user_id} - получить пользователя по id
- **response**:\
{ login : string,\
name : string }


# Habit Templates

### GET /habitTemplates - получить все шаблоны
- **response**:\
[{ template_id : uuid,\
name : string,\
description : string,\
periodicity : string,\
goal : string,\
result-type : string }, ...]

### GET /habitemplates/{id} - получить шаблон по id
- **response**:\
{ name : string,\
description : string,\
periodicity : string,\
goal : string,\
result-type : string }


# Habits

### GET /habits/{habit_id} - получить привычку по id
- **response**:\
{ template_id: uuid,\
results : [{id : uuid,\
&emsp;date : dateTime,\
&emsp;value : string,\
&emsp;comment: string }, ...]}

### GET /habits/findByUser - получить все привычки пользователя
- **query**: login - string
- **response**:\
[{ habit_id : uuid}, ...]  //хотим возвращать всю инфу или только id?

### POST /habits - создать привычку по шаблону
- **body**:\
{ user_id : uuid,\
template_id: uuid }
- **response**:\
{ habit_id : uuid,\
template_id: uuid,\
results : []}

### POST /habits/addResult - добавить результат к привычке
- **body**:\
{ habut_id : uuid,\
result: {\
&emsp;date : dateTime,\
&emsp;value : string,\
&emsp;comment: string } }
- **response**:\
{ template_id: uuid,\
results : [{id : uuid,\
&emsp;date : dateTime,\
&emsp;value : string,\
&emsp;comment: string }, ...]}

# Groups

### GET /groups/{id} - получить группу по id
- **response**:\
{ name : string,\
participants : [{ user_id : uuid, ...}],\
habits : [{ habit_id : uuid }, ...] }

### GET /groups/findByUser - получить все группы пользователя
- **query**: user_id - uuid
- **response**:\
[{ group_id : uuid,\
name : string }, ...]

### POST /groups - создать группу
- **body**: { name : string }
- **response**:\
{ group_id : uuid,\
name : string, }

### PUT /groups/addHabit - добавить в группу привычку
- **body**:\
{ group_id : uuid,\
habit_id : uuid }
- **response**:\
{ group_id : uuid,\
name : string,\
participants : [{ user_id : uuid, ...}],\
habits : [{ habit_id : uuid }, ...] }

