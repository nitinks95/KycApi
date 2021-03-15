# KycApi

## Purpose of this wrapper

The goal is to have satisfied clients and customers. Knowing the users topic of interest and storing it in a separate table and linking it with user with many to many relation

## Pre-requisites

  * Elixir 1.10.4 has to be installed
  * Postgres database should be installed and the credentials must be updated in config/config.exs

## To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## APIs for operations - 

  ### http://localhost:4000/api/users/signup

  This API is used to create new users. There is no authentication required for this user.

  **Call Parameters**

    - Type: POST
    - Content-Type: application/json

  **Input**

  ```json
    {
      "user": {
        "email": String.t(),
        "password": String.t(),
        "full_name": String.t(),
        "age": Integer.t(),
        "interests": [
          {
            "topic": String.t(),
            "description": String.t()
          },...
        ]
      }
    }
  ```

  **Output**

  ```json
    {
      "user": {
        "email": String.t(),
        "full_name": String.t(),
        "age": Integer.t(),
        "token": <token>,
        "interests": [
          {
            "topic": String.t(),
            "description": String.t()
          },...
        ]
      }
    }
  ```

  **Errors**

    - User already present
    - not a valid email ID
    - Password must be minimum of 8 characters
    - Missing mandatory parameters

---

### http://localhost:4000/api/users/signin

  This API is used to login users and the user token for performing operations. There is no authentication required for this user.

  **Call Parameters**

    - Type: POST
    - Content-Type: application/json

  **Input**

  ```json
    {
      "user": {
        "email": String.t(),
        "password": String.t()
      }
    }
  ```

  **Output**

  ```json
    {
      "user": {
        "id": Integer.t(),
        "email": String.t(),
        "token": <token>
      }
    }
  ```

  **Errors**

    - Invalid Password

---

### http://localhost:4000/api/users/<id>

  This API is used to update the user details like password, name, age and interests. There is authentication required for this user.

  **Call Parameters**

    - Type: POST
    - Content-Type: application/json
    - Authorization: Bearer <user-token>

  **Input**

  ```json
    {
      "user": {
        "email": String.t(),
        "password": String.t(),
        "full_name": String.t(),
        "age": Integer.t(),
        "interests": [
          {
            "topic": String.t(),
            "description": String.t()
          },...
        ]
      }
    }
  ```

  **Output**

  ```json
    {
      "user": {
        "id": Integer.t(),
        "email": String.t(),
        "full_name": String.t(),
        "age": Integer.t(),
        "interests": [
          {
            "topic": String.t(),
            "description": String.t()
          },...
        ]
      }
    }
  ```

  **Errors**

    - not a valid user
    - Password must be minimum of 8 characters
    - Missing mandatory parameters

---

### http://localhost:4000/api/users

  This API is used to list all the users stored. There is authentication required for this user.

  **Call Parameters**

    - Type: GET
    - Content-Type: application/json
    - Authorization: Bearer <user-token>

  **Output**

  ```json
    {
      "user": [
        {
          "id": Integer.t(),
          "email": String.t(),
          "full_name": String.t(),
          "age": Integer.t(),
          "interests": [
            {
              "topic": String.t(),
              "description": String.t()
            },...
          ]
        },...
      ]
    }
  ```
---

### http://localhost:4000/api/interest

  This API is used to list all the topic of interests stored. There is authentication required for this user.

  **Call Parameters**

    - Type: GET
    - Content-Type: application/json
    - Authorization: Bearer <user-token>

  **Output**

  ```json
    {
      "interests": [
        {
          "id": Integer.t(),
          "topic": String.t(),
          "description": String.t()
        },...
      ]
    }
  ```
---

### http://localhost:4000/api/interest

  This API is used to create a new topic of interest. There is authentication required for this user.

  **Call Parameters**

    - Type: POST
    - Content-Type: application/json
    - Authorization: Bearer <user-token>

  **Input**

  ```json
    {
      "interests": [
        {
          "topic": String.t(),
          "description": String.t()
        },...
      ]
    }
  ```

  **Output**

  ```json
    {
      "interests": [
        {
          "id": Integer.t(),
          "topic": String.t(),
          "description": String.t()
        },...
      ]
    }
  ```

  **Errors**

    - Missing mandatory parameters

---

### http://localhost:4000/api/interest/<id>

  This API is used to update the topic of interest. There is authentication required for this user.

  **Call Parameters**

    - Type: POST
    - Content-Type: application/json
    - Authorization: Bearer <user-token>

  **Input**

  ```json
    {
      "interests": {
          "topic": String.t(),
          "description": String.t()
        }
      ]
    }
  ```

  **Output**

  ```json
    {
      "interests": {
          "id": Integer.t(),
          "topic": String.t(),
          "description": String.t()
        }
    }
  ```

  **Errors**

    - Missing mandatory parameters

---
---


## References

  * Official website: https://www.phoenixframework.org/
  * Docs: https://hexdocs.pm/phoenix
  * https://pamit.medium.com/building-a-restful-backend-with-elixir-phoenix-84fe390975c
  * https://medium.com/coletiv-stories/ecto-elixir-many-to-many-relationships-66403933f8c1
