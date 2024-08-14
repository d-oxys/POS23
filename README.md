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
  - `id_site` (optional): `number` -Menampilkan user menurut id_site
  - `isNotAssigned` (optional): `boolean` -Menampilkan user yang belum di tambahkan ke site

- **Contoh Request**:

  - `GET users?q=J&limit=10`

- **Response**:

```json
{
    "status": 200,
    "message": "Users retrieved successfully",
    "users": [
        {
            "id": 1,
            "nip": "123456",
            "name": "John Doe",
            "email": "john.doe@example.com",
            "role": "admin",
            "site": "Online Store"
        },
        {
            "id": 2,
            "nip": "654321",
            "name": "Jane Smith",
            "email": "jane.smith@example.com",
            "role": "cashier",
            "site": "Offline Store"
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


### Get Site Data EMACS API

- **URL**: `https://emacs-api.duapuluhtiga.com/api/store/all`
- **Method**: `GET`
- **Query Parameters**:

  - `store` (optional): `string` - Nama channel store site yang ingin dicari.
  - `code` (optional): `string` - Nama code store site yang ingin dicari.
  - `limit` (optional): `number` - Batas jumlah store site yang ingin diambil. Default adalah 100.
  - `offset` (optional): `number` - ?

- **Contoh Request**:

  - `api/store/all`

- **Response**:

```json
[
    {
        "site": "KS00001",
        "name": "PT. EIGERINDO MULTI PRODUK INDUSTRI",
        "category": "KONSI",
        "ip": ""
    },
    {
        "site": "2031",
        "name": "ST EX BP KATAMSO SEMARANG",
        "category": "STORE",
        "ip": "10.30.0.26"
    },
    {
        "site": "2037",
        "name": "ST EX SIMANJUNTAK",
        "category": "STORE",
        "ip": "10.30.0.39"
    },
    {
        "site": "5001",
        "name": "SH EX BP BIP",
        "category": "STORE",
        "ip": "10.30.0.40"
    },
    {
        "site": "5009",
        "name": "SH BP METROPOLITAN MALL",
        "category": "STORE",
        "ip": "10.30.0.22"
    },
]
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
   "userId": "number";
   "storeSiteId": "number";
   "user_name": "string";
   "site_name": "string";
}
```
- **Response**:

```json
{
    "status": 200,
    "message": "User added from store site successfully",
    "storeUser": {
        "user": "654321",
        "storeSite": "KS00001",
        "user_name": "Jane Smith",
        "site_name": "PT. EIGERINDO MULTI PRODUK INDUSTRI"
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
   "userId": "number";
   "storeSiteId": "number";
   "user_name": "string";
   "site_name": "string";
}
```

- **Response**:

```json
{
    "status": 200,
    "message": "User updated from store site successfully",
    "storeUser": {
        "user": "654321",
        "storeSite": "KS00001",
        "user_name": "Jane Smith",
        "site_name": "PT. EIGERINDO MULTI PRODUK INDUSTRI"
    },
    "error": false
}
```

### Delete User to Store Site

- **URL**: `/store-sites/delete/:userId`
- **Method**: `DELETE`
- **Request Params**: `userId` - `number`
- **example**: `/store-sites/delete/654321`

- **Response**:

```json
{
    "status": 200,
    "message": "User removed from store site successfully",
    "storeUser": {
        "user": "654321",
        "storeSite": "KS00001",
        "user_name": "Jane Smith",
        "site_name": "PT. EIGERINDO MULTI PRODUK INDUSTRI"
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

### Get All Artikel Data By EMACS API

- **URL**: `https://emacs-api.duapuluhtiga.com/api/artikel/`
- **Method**: `GET`
- **Query Parameters**:

  - `offset` (optional): `string` - ?
  - `limit` (optional): `number` - Batas jumlah artikel yang ingin diambil. Default adalah 100.
  - `artikel` (optional): `number` - mencari nama artikel tapi hanya satu
  - `description` (optional): `number` - mencari artikel berdasarkan description

- **Contoh Request**:

  - `GET https://emacs-api.duapuluhtiga.com/api/artikel/all?limit=2&offset=5`

- **Response**:

```json
[
    {
        "description": "R.LT. PRO TECH 8.8, BLK, 14\"",
        "artikel": "920000107001",
        "generic": "920000107",
        "brand": "BODYPACK",
        "group": "BAGS",
        "kategori": "BACKPACK",
        "sub_kategori": "LAPTOP BACKPACK",
        "harga_jual": 595000,
        "hpp": 291322
    },
    {
        "description": "R.LT. +CAM 3575-01, GRY, 14\"",
        "artikel": "920000121001",
        "generic": "920000121",
        "brand": "BODYPACK",
        "group": "BAGS",
        "kategori": "BACKPACK",
        "sub_kategori": "CAMERA BACKPACK",
        "harga_jual": 650000,
        "hpp": 165414
    }
]
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
