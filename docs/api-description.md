Panpipe API

# Auth

### POST /login
- **body**:\
{ login : string,\
password : string  }
- **response**:\
{ user_id : uuid,\
login : string }

### POST /register
- **body**:\
{ login : string,\
password : string  }
- **response**:\
{ user_id : uuid,\
login : string, }

### POST /logout
- **response**: {}


# Habit Templates

### GET /habitTemplates - получить все шаблоны
- **response**:\
[{ template_id : uuid,\
name : string,\
periodicity : string,\
goal : string,\
result-type : string }, ...]


# Habits

### GET /habits/{habit_id} - получить привычку по id
- **response**:\
{ name : string,\
periodicity : string,\
goal : string,\
result-type : string\
results : [{ id : uuid,\
&emsp;date : dateTime,\
&emsp;result : { value : string }} , ...]}

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
{ habit_id : uuid,\
name : string,\
periodicity : string,\
goal : string,\
result-type : string\
results : [{ id : uuid,\
&emsp;date : dateTime }, ...]}

### PUT /habits/{habit_id}/results/{result_id} - добавить результат к привычке
- **body**:\
{ value : string }
- **response**:\
{ id : uuid,\
date : dateTime,\
result : { value : string }}  

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
{ group_id : uuid,\
name : string, }

