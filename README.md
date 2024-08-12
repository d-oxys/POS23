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

### Get User Data

- **URL**: `/users`
- **Method**: `GET`
- **Query Parameters**:

  - `q` (optional): `string` - Nama user yang ingin dicari.
  - `limit` (optional): `number` - Batas jumlah user yang ingin diambil. Default adalah 100.

- **Contoh Request**:

  - `GET /users?q=John&limit=10`

- **Response**:

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

### Add Site Data

- **URL**: `/store-sites/add`
- **Method**: `POST`
- **Request Body**:

```json
{
  "site_channel": "string",
  "name_channel": "string",
  "brand": "string"
}
```

- **Response**:

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

### Get Site Data

- **URL**: `/store-sites`
- **Method**: `GET`
- **Query Parameters**:

  - `q` (optional): `string` - Nama channel store site yang ingin dicari.
  - `limit` (optional): `number` - Batas jumlah store site yang ingin diambil. Default adalah 100.

- **Contoh Request**:

  - `/store-sites?q=Online&limit=10`

- **Response**:

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

### Update Site Data

- **URL**: `/store-sites/update-sites/:id`
- **Method**: `PUT`
- **Path Parameters**:

  - `id`: `number` - ID dari store site yang ingin diperbarui.

- **Request Body**:

```json
{
  "site_channel": "string",
  "name_channel": "string",
  "brand": "string"
}
```

- **Response**:

```json
{
  "status": 201,
  "message": "Store site updated successfully",
  "storeSite": {
    "ID": 1,
    "site_channel": "edited online",
    "name_channel": "edited Online Store",
    "brand": "bodypack"
  },
  "error": false
}
```

### Add User to Site Data

- **URL**: `/store-sites/add-user`
- **Method**: `POST`
- **Request Body**:

```json
{
  "userId": "number",
  "storeSiteId": "number"
}
```
- **Response**:

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
```

### Update User to Store Site

- **URL**: `/store-sites/update-user`
- **Method**: `PUT`
- **Request Body**:

```json
{
  "userId": "number",
  "newStoreSiteId": "number"
}
```

- **Response**:

```json
{
  "status": 200,
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
```

### Get All Artikel Data

- **URL**: `/artikel`
- **Method**: `GET`
- **Query Parameters**:

  - `name` (optional): `string` - Nama artikel yang ingin dicari.
  - `limit` (optional): `number` - Batas jumlah artikel yang ingin diambil. Default adalah 100.

- **Contoh Request**:

  - `GET /artikel?name=Promo&limit=10`

- **Response**:

```json
{
  "status": 200,
  "message": "Artikel retrieved successfully",
  "artikel": [
    {
      "ID": 1,
      "name": "Promo Lebaran",
      "price": 100000,
      "promos": [
        {
          "ID": 1,
          "name": "Promo Lebaran",
          "value": 20,
          "min": 2
        }
      ]
    },
    {
      "ID": 2,
      "name": "Diskon Akhir Tahun",
      "price": 150000,
      "promos": [
        {
          "ID": 2,
          "name": "Diskon Akhir Tahun",
          "value": 15,
          "min": 3
        }
      ]
    }
  ],
  "error": false
}
```

### Create Checkout

- **URL**: `/checkout`
- **Method**: `POST`
- **Request Body**:

```json
{
  "userId": 1,
  "items": [
    {
      "artikelId": 1,
      "qty": 3,
      "price": 100000,
      "discount": 20000,
      "promo_id": 1
    },
    {
      "artikelId": 2,
      "qty": 5,
      "price": 150000,
      "discount": 30000,
      "promo_id": 2
    }
  ]
}
```

- **Response**:

```json
{
  "message": "Checkout created successfully",
  "kode_checkout": "CHK1723256757895",
  "user_id": 1,
  "total": 650000
}
```

### Get Checkout Details by Kode Checkout

- **URL**: `/checkout`
- **Method**: `GET`
- **Contoh Request**:
- **Response**:

```json
[
  {
    "kode_checkout": "CHK1723256757895",
    "user": {
      "Name": "John Doe",
      "NIP": "123456"
    },
    "details": [
      {
        "artikel": {
          "ID": 1,
          "name": "Promo Lebaran",
          "price": 100000
        },
        "promo": {
          "ID": 1,
          "name": "Promo Lebaran",
          "value": 20,
          "min": 2
        },
        "qty": 3,
        "price": 100000,
        "discount": 20000
      }
    ]
  }
]
```
