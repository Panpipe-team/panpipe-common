Panpipe API

# Auth

### POST /login
- **body**:\
{ login : string,\
password : string  }
- **response**:\
{ userId : uuid }

### POST /register
- **body**:\
{ login : string,\
password : string  }
- **response**:\
{ userId : uuid }

### POST /logout
- **response**: {}

# Users
### GET /users/{id}
- **response**: \
{ login: string }

# Habits

### GET /habits/templates - получить все системные шаблоны привычек
- **response**:\
{ templates: \
&emsp;[{ templateId : uuid,\
&emsp;name : string,\
&emsp;periodicity : string,\
&emsp;goal : string,\
&emsp;resultType : string }, ...] \
}

### GET /habits/{id} - получить привычку по id
- **response**:\
{ name : string,\
periodicity : string,\
goal : string,\
resultType : string,\
marks : [{ id : uuid,\
&emsp;timestamp : dateTime,\
&emsp;result : { value : string } }, \
&emsp;{ id: uuid,\
&emsp;timestamp : dateTime,\
&emsp;result : null
} , ...]}

### GET /habits - получить все привычки пользователя
- **response**:\
{ habits: \
&emsp;[{ habitId : uuid,\
&emsp;name : string,\
&emsp;periodicity : string,\
&emsp;goal : string,\
&emsp;resultType : string }, ...] \
}

### POST /habits - создать привычку по шаблону
- **body**:\
{ templateId: uuid }
- **response**:\
{ habitId : uuid }

### PUT /habits/{habitId}/marks/{markId}/result - добавить или изменить результат привычки
- **body**:\
{ value : string }
- **response**:\
{ }  

# Groups

### GET /groups/{id} - получить группу по id
- **response**:\
{ name : string,\
participants : [{ userId : uuid, ...}]}

### GET /groups - получить все группы пользователя
- **response**:\
{ groups: \
&emsp;[{ groupId : uuid,\
&emsp;name : string }, ...]\
}

### POST /groups - создать группу
- **body**: { name : string }
- **response**:\
{ groupId : uuid }
