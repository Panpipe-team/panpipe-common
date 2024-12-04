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
name : string,\
password : string  }
- **response**:\
{ userId : uuid }

### POST /logout
- **response**: {}

# Users
### GET /users/{userId} - получить пользователя по id
- **response**: \
{ login: string,\
name : string}

### PUT /users/password - поменять пароль
- **body**:\
  { prevPassword : string,\
  newPassword : string  }
- **response**: {}

### GET /users/login/{login} - найти пользователя по логину
- **body**:\
  { login : string }
- **response**:\
  { userId : uuid }

### GET /users - получить всех пользователей
- **response**:\
  { users:\
&emsp;[{userId : uuid,\
&emsp;login : string,\
&emsp;name : string }, ...]\
}


# Habits

### GET /habits/templates - получить все системные шаблоны привычек
- **response**:\
{ templates: \
&emsp;[{ templateId : uuid,\
&emsp;name : string,\
&emsp;description : string,\
&emsp;periodicity : string,\
&emsp;goal : string,\
&emsp;resultType : string }, ...] \
}

### GET /habits/{habitId} - получить привычку по id
- **response**:\
{ name : string,\
description : string,\
periodicity : string,\
goal : string,\
resultType : string,\
isTemplated : bool,\
marks : [{ id : uuid,\
&emsp;timestamp : dateTime,\
&emsp;result : { value : string,\
&emsp;&emsp;comment : string} }, \
&emsp;{ id: uuid,\
&emsp;timestamp : dateTime,\
&emsp;result : null
} , ...]}

### GET /habits - получить все привычки пользователя
- **response**:\
{ habits: \
&emsp;[{ habitId : uuid,\
&emsp;name : string,\
&emsp;description : string,\
&emsp;periodicity : string,\
&emsp;goal : string,\
&emsp;resultType : string }, ...] \
}

### POST /habits/template - создать привычку по шаблону
- **body**:\
{ templateId: uuid }
- **response**:\
{ habitId : uuid }

### POST /habits - создать кастомную привычку
- **body**:\
{ name : string,\
description : string,\
periodicity : string,\
goal : string,\
resultType : string } }
- **response**:\
  { habitId : uuid }

### PUT /habits/{habitId}/marks/{markId}/result - добавить или изменить результат привычки
- **body**:\
{ value : string,
*comment : string}
- **response**: {}  

### PUT /habits/{habitId}/parameters - изменить параметр(ы) привычки
- **body**:\
{ *name : string,\
*description : string,\
*periodicity : string,\
*goal : string,\
}
- **response**: {}

# Groups

### GET /groups/{groupId} - получить группу по id
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
- **body**: 
{ name : string,\
participants : [{ userId : uuid, ...}]}
- **response**:\
{ groupId : uuid }

### PUT /groups/{groupId}/participants/{userId} - добавить участника в группу по id
- **response**: {}

### PUT /groups/{groupId}/participants - выйти из группы
- **response**: {}

### GET /groups/{groupId}/habits - получить групповые привычки
- **response**:\
{ habits: \
&emsp;[{ habitId : uuid,\
&emsp;name : string,\
&emsp;description : string,\
&emsp;periodicity : string,\
&emsp;goal : string,\
&emsp;resultType : string }, ...] \
}

### GET /groups/habits/{habitId} - получить групповую с индивидуальным зачетом привычку по id
- **response**:\
  { name : string,\
  description : string,\
  periodicity : string,\
  goal : string,\
  resultType : string,\
  isTemplated : bool,\
  marks : [\
  { timestamp : dateTime,\
  [{ id : uuid,\
  &emsp;userId : uuid,\
  &emsp;result : { value : string,\
  &emsp;&emsp;comment : string} }, \
  &emsp;{ id: uuid,\
  &emsp;userId : uuid,\
  &emsp;result : null
  } , ...]\
  }, ...] }



