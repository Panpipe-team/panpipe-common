Panpipe API

# Auth

### POST /login
- **body**:\
{ login : string,\
password : string  }
- **response**:\
{ user_id : uuid }

### POST /register
- **body**:\
{ login : string,\
password : string  }
- **response**:\
{ user_id : uuid }

### POST /logout
- **response**: {}

# Users
### GET /users/{id}
- **response**: \
{ login: string }

# Habits

### GET /habits/templates - получить все системные шаблоны привычек
- **response**:\
[{ template_id : uuid,\
name : string,\
periodicity : string,\
goal : string,\
result-type : string }, ...]

### GET /habits/{id} - получить привычку по id
- **response**:\
{ name : string,\
periodicity : string,\
goal : string,\
result-type : string,\
results : [{ id : uuid,\
&emsp;date : dateTime,\
&emsp;result : { value : string } }, \
&emsp;{ id: uuid,\
&emsp;date : dateTime,\
&emsp;result : null
} , ...]}

### GET /habits - получить все привычки пользователя
- **response**:\
[{ habit_id : uuid,\
name : string,\
periodicity : string,\
goal : string,\
result-type : string }, ...]

### POST /habits - создать привычку по шаблону
- **body**:\
{ user_id : uuid,\
template_id: uuid }
- **response**:\
{ habit_id : uuid }

### PUT /habits/{habitId}/results/{resultId} - добавить или изменить результат привычки
- **body**:\
{ value : string }
- **response**:\
{ id : uuid }  

# Groups

### GET /groups/{id} - получить группу по id
- **response**:\
{ name : string,\
participants : [{ user_id : uuid, ...}]}

### GET /groups - получить все группы пользователя
- **response**:\
[{ group_id : uuid,\
name : string }, ...]

### POST /groups - создать группу
- **body**: { name : string }
- **response**:\
{ group_id : uuid }
