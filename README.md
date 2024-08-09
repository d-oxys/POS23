# API Documentation

### User Login

- **URL** : `/auth/login`
- **Method** : `POST`
- **Request** Body:

  - `nip` as `string`
  - `password` as `string`

- **example** Body:
  - "nip": "123456",
  - "password": "password",
- **Response**:

```json
{
  "status": 200,
  "message": "Logged in successfully",
  "user": {
    "ID": 1,
    "NIP": "123456",
    "Name": "John Doe",
    "Email": "john.doe@example.com",
    "Jobroles": "admin",
    "storeSites": [
      {
        "ID": 1,
        "site_channel": "online",
        "name_channel": "Online Store",
        "brand": "bodypack"
      }
    ],
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTYiLCJqb2Jyb2xlIjoiYWRtaW4iLCJuYW1lIjoiSm9obiBEb2UiLCJpYXQiOjE3MjMxNjkwMTgsImV4cCI6MTcyMzQyODIxOH0.Zs3AJrFJEbbMvEhGm2UrGciRBtAprIUbJ3nZnHJjay4"
  },
  "error": false
}
```

# UserService API Documentation

## add user data

## Endpoint: `/users`

### Method: `GET`

### Query Parameters:

- `query` (optional): `string` - Nama user yang ingin dicari.
- `limit` (optional): `number` - Batas jumlah user yang ingin diambil. Default adalah 100.

### Contoh Request:

- `GET /users?query=John&limit=10`

### Response:

#### Success (200):

```json
{
  "status": 200,
  "message": "Users retrieved successfully",
  "users": [
    {
      "name": "John Doe",
      "email": "john.doe@example.com",
      "role": "admin"
    },
    {
      "name": "Jane Smith",
      "email": "jane.smith@example.com",
      "role": "user"
    }
  ],
  "error": false
}
```

# StoreSiteService API Documentation

## add Site Data

## Endpoint: `/store-sites/add`

### Method: `POST`

### Request Body:

```json
{
  "site_channel": "string",
  "name_channel": "string",
  "brand": "string"
}
```

```json
{
  "status": 201,
  "message": "Store site created successfully",
  "storeSite": {
    "ID": 1,
    "site_channel": "online",
    "name_channel": "Online Store",
    "brand": "bodypack"
  },
  "error": false
}
```

## get Site Data

## Endpoint: `/store-sites`

### Method: `GET`

### Query Parameters:

- `query` (optional): `string` - Nama channel store site yang ingin dicari.
- `limit` (optional): `number` - Batas jumlah store site yang ingin diambil. Default adalah 100.

### Contoh Request:

`/store-sites?query=Online&limit=10`

### Response:

#### Success (200):

```json
{
  "status": 200,
  "message": "Store sites retrieved successfully",
  "storeSites": [
    {
      "id": 1,
      "site": "online",
      "name": "Online Store",
      "brand": "bodypack"
    },
    {
      "id": 2,
      "site": "offline",
      "name": "Offline Store",
      "brand": "bodypack"
    }
  ],
  "error": false
}
```

# StoreSiteService API Documentation

## update Site Data

## Endpoint: `/store-sites/update-sites/:id`

### Method: `PUT`

### Path Parameters:

- `id`: `number` - ID dari store site yang ingin diperbarui.

### Request Body:

```json
{
  "site_channel": "string",
  "name_channel": "string",
  "brand": "string"
}
```

## add user to Site Data

## Endpoint: `/store-sites/add-user`

### Method: `POST`

### Request Body:

````json
{
  "userId": "number",
  "storeSiteId": "number"
}
```

```json
{
  "status": 201,
  "message": "User added to store site successfully",
  "storeUser": {
    "user": {
      "ID": 1,
      "NIP": "123456",
      "Name": "John Doe",
      "Email": "john.doe@example.com",
      "Jobroles": "admin"
    },
    "storeSite": {
      "ID": 2,
      "site_channel": "online",
      "name_channel": "Online Store",
      "brand": "bodypack"
    }
  },
  "error": false
}
````

## add user to Site Data

## Endpoint: `/store-sites/update-user`

### Method: `PUT`

### Request Body:

````json
{
  "userId": "number",
  "newStoreSiteId": "number"
}
```json
{
  "status": 201,
  "message": "User updated to new store site successfully",
  "storeUser": {
    "user": {
      "ID": 1,
      "NIP": "123456",
      "Name": "John Doe",
      "Email": "john.doe@example.com",
      "Jobroles": "admin"
    },
    "storeSite": {
      "ID": 2,
      "site_channel": "online",
      "name_channel": "Online Store",
      "brand": "bodypack"
    }
  },
  "error": false
}
````
