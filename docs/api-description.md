Panpipe API

### Base URL : /api/v1.1

# Auth

### POST /login

- **body**:\
  { login : string,\
  password : string }
- **response**:\
  { id : uuid }

### POST /register

- **body**:\
  { login : string,\
  name : string,\
  password : string }
- **response**:\
  { id : uuid }

### POST /logout

- **response**: {}

# Accounts

### PUT /accounts/name - поменять имя

- **body**:\
  { newName : string }
- **response**: {}

### PUT /accounts/password - поменять пароль

- **body**:\
  { prevPassword : string,\
  newPassword : string }
- **response**: {}

# Users

### GET /users/{id} - получить пользователя по id

- **response**: \
  { login: string,\
  name : string }

### GET /users - найти пользователя по логину
- **query** :\
  login : string
- **response**:\
  { id : uuid,\
  name : string }

### GET /users/habits - получить все привычки пользователя

- **response**:\
  { habits:\
  &emsp;[ { id : uuid,\
  &emsp;name : string,\
  &emsp;description : string,\
  &emsp;periodicity :\
  &emsp;&emsp;{ type : string,\
  &emsp;&emsp;value : number },\
  &emsp;goal : string,\
  &emsp;resultType : string }, ...] }

### GET /users/habits/{id} - получить привычку по id

- **response**:\
  { name : string,\
  description : string,\
  periodicity : \
  &emsp;{ type : string,\
  &emsp;value : number },\
  goal : string,\
  resultType : string,\
  isTemplated : bool,\
  marks :\
  &emsp;[ { id : uuid,\
  &emsp;timestamp : dateTime,\
  &emsp;result : { value : string,\
  &emsp;&emsp;comment : string} }, \
  &emsp;{ id: uuid,\
  &emsp;timestamp : dateTime,\
  &emsp;result : null } , ...] }

### POST /users/habits - создать привычку

#### по шаблону:
- **query**:\
  templateId : uuid
- **response**:\
  { habitId : uuid }

#### с кастомными параметрами:
- **body**:\
  { name : string,\
  description : string,\
  periodicity :\
  &emsp;{ type : string,\
  &emsp;value : number },\
  goal : string,\
  resultType : string } }
- **response**:\
  { habitId : uuid }

# Habits

### GET /habits/templates - получить все системные шаблоны привычек

- **response**:\
  { templates:\
  &emsp;[ { id : uuid,\
  &emsp;name : string,\
  &emsp;description : string,\
  &emsp;periodicity :\
  &emsp;&emsp;{ type : string,\
  &emsp;&emsp;value : number },\
  &emsp;goal : string,\
  &emsp;resultType : string }, ...] }

### PUT /habits/{habitId}/marks/{markId}/result - добавить или изменить результат привычки

- **body**:\
  { value : string,\
  *comment : string }
- **response**: {}

### PUT /habits/{habitId}/parameters - изменить параметр(ы) привычки

- **query**:\
  *name : string,\
  *description : string,\
  *periodicity :\
  &emsp;{ type : string,\
  &emsp;value : number },\
  *goal : string
- **response**: {}

# Groups

### GET /groups/{id} - получить группу по id

- **response**:\
  { name : string,\
  participants :\
  &emsp;[ { userId : uuid,\
  &emsp;name : string }\, ...] }

### GET /groups - получить все группы пользователя

- **response**:\
  { groups:\
  &emsp;[ { groupId : uuid,\
  &emsp;name : string }, ...] }

### POST /groups - создать группу

- **body**:\
  { name : string,\
  participants : \
  &emsp;[ { userId : uuid }, ...] }
- **response**:\
  { id : uuid }

### PUT /groups/{groupId}/participants/{userId} - добавить участника в группу по id

- **response**: {}

### DELETE /groups/{groupId}/participants - выйти из группы

- **response**: {}

### GET /groups/{groupId}/habits - получить все привычки в группе

- **response**:\
  { habits:\
  &emsp;[ { id : uuid,\
  &emsp;habitType : string, //общий зачет или индивидуальный\
  &emsp;name : string,\
  &emsp;description : string,\
  &emsp;periodicity :\
  &emsp;&emsp;{ type : string,\
  &emsp;&emsp;value : number },\
  &emsp;goal : string,\
  &emsp;resultType : string }, ...] }

### GET /groups/{groupId}/common-habits/{habitId} - получить групповую привычку с общим зачетом по id

- **response**:\
  { habits: \
  &emsp;[ { habitId : uuid,\
  &emsp;name : string,\
  &emsp;description : string,\
  &emsp;periodicity :\
  &emsp;&emsp;{ type : string,\
  &emsp;&emsp;value : number },\
  &emsp;goal : string,\
  &emsp;resultType : string }, ...] }

### GET /groups/{groupId}/personal-habits/{habitId} - получить групповую привычку с индивидуальным зачетом по id

- **response**:\
  { name : string,\
  description : string,\
  periodicity : \
  &emsp;{ type : string,\
  &emsp;value : number },\
  goal : string,\
  resultType : string,\
  isTemplated : bool,\
  marks :\
  &emsp;[ { timestamp : dateTime,\
  &emsp;personalMarks :\
  &emsp;&emsp;[ { id : uuid,\
  &emsp;&emsp;&emsp;userId : uuid,\
  &emsp;&emsp;&emsp;result : { value : string,\
  &emsp;&emsp;&emsp;&emsp;comment : string} }, \
  &emsp;&emsp;&emsp;{ id: uuid,\
  &emsp;&emsp;&emsp;userId : uuid,\
  &emsp;&emsp;&emsp;result : null}, ...] }, ...] }

### POST /groups/{groupId}/common-habits - создать групповую привычку с общим зачетом

#### по шаблону:
- **query**:\
  templateId : uuid
- **response**:\
  { habitId : uuid }

#### с кастомными параметрами:
- **body**:\
  { name : string,\
  description : string,\
  periodicity :\
  &emsp;{ type : string,\
  &emsp;value : number },\
  goal : string,\
  resultType : string } }
- **response**:\
  { habitId : uuid }

### POST /groups/{groupId}/personal-habits - создать групповую привычку с индивидуальным зачетом

#### по шаблону:
- **query**:\
  templateId : uuid
- **response**:\
  { habitId : uuid }

#### с кастомными параметрами:
- **body**:\
  { name : string,\
  description : string,\
  periodicity :\
  &emsp;{ type : string,\
  &emsp;value : number },\
  goal : string,\
  resultType : string } }
- **response**:\
  { habitId : uuid }
