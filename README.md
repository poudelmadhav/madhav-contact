# Madhav Contact

An app build in Rails to accept contact form data as API and sends mail to client.


## Health Check

Check status of website https://paudelm.com.np/_health

## Usuage

Make a post request to https://paudelm.com.np/api/v1/contacts with data in following format:

```json
{
    "contact": {
        "_email": "receiver@email.com",
        "_subject": "Subject to receive on email",
        "name": "Contacter name",
        "email": "sender@email.com",
        "subject": "Subject on HTML form",
        "website": "paudelm.com.np",
        "message": "Message"
    }
}
```
This will forward data to receiver email address.

By this you can make static html form dynamic.
