# Unix Timestamp API

A simple unix timestamp converter API made in swift, for testing Vapor.

## Usage

#### Converting UTC date

<summary><code>POST</code> <code><b>/converter</b></code> <code>Convert a date from UTC to Unix</code></summary>

##### Parameters

> | name      |  type     | data type               | body                                                                  |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | Date      |  required | JSON                    | { "date": "dd/mm/yyyy" } |


##### Responses

> | http code     | content-type                      | response                                                            |
> |---------------|-----------------------------------|---------------------------------------------------------------------|
> | `200`         | `text/plain;charset=UTF-8`        | `{ "unix_timestamp": 1234567890 }`                                  |
> | `400`         | `application/json`                | `{ "error": "Formato de data inválido. Use dd/mm/yyyy." }`          |

##### Example cURL

> ```javascript
>  curl -X POST -H "Content-Type: application/json" -d '{ "date": "13/11/2023" }' http://localhost:9001/converter
> ```
