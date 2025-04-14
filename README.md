## API Contract for Rails JSON API App

Based on the provided code, the application implements a JSON API for managing users. Here's a breakdown of the API contract:

### Base URL

The base URL for all API endpoints will be the root URL of your Rails application (e.g., `http://localhost:3000`).

### Endpoints

#### 1. Users

* **URL:** `/users`
* **HTTP Method:** `GET`
* **Description:** Retrieves a collection of user resources.
* **Request Headers:**
    * `Accept: application/vnd.api+json`
* **Response Headers:**
    * `Content-Type: application/vnd.api+json`
* **Response Body:**

    ```json
    {
      "data": [
        {
          "type": "users",
          "id": "<user_id>",
          "attributes": {
            "name": "<user_name>",
            "email": "<user_email>"
          }
        },
        ...
      ]
    }
    ```

    * `<user_id>`: The unique identifier for the user.
    * `<user_name>`: The name of the user.
    * `<user_email>`: The email address of the user.
* **Status Codes:**
    * `200 OK`: Successful response.

#### 2. User Details

* **URL:** `/users/{user_id}`
* **HTTP Method:** `GET`
* **Description:** Retrieves a single user resource.
* **Request Headers:**
    * `Accept: application/vnd.api+json`
* **Response Headers:**
    * `Content-Type: application/vnd.api+json`
* **Response Body:**

    ```json
    {
      "data": {
        "type": "users",
        "id": "<user_id>",
        "attributes": {
          "name": "<user_name>",
          "email": "<user_email>"
        }
      }
    }
    ```

* **Status Codes:**
    * `200 OK`: Successful response.
    * `404 Not Found`: If the user with the specified ID does not exist. The response body will include an error object:

    ```json
    {
      "errors": [
        {
          "title": "Not Found"
        }
      ]
    }
    ```

### JSON API Compliance

The API adheres to the JSON API specification. This means:

* Data is structured in a `data` object.
* Resources are identified by `type` and `id`.
* Resource attributes are contained in an `attributes` object.
* Errors are returned in an `errors` array.
* The correct content type (`application/vnd.api+json`) is used.
