# Quickstart Guide

Learn to make your first API request

## Connect to the API

To get started with VercelKit, initialize a new ``VercelApi`` object that will serve as host for the API connection.

The API requires that you create an account token from your account settings in the [Vercel Dashboard](https://vercel.com/account/tokens). You can then pass this token to the ``VercelApi``.

```swift
let api = VercelApi(token: "abcdefgh")
```

To make a request, just call one of the methods on ``VercelApi``. All requests have the possibility to throw an error and are run asynchronously. Make sure to handle any errors and run these functions in an async environment.
```swift
Task {
    let user = try? await api.getUser()
}
```

## Topics

### Additional Requests
Check out some of the possible requests available after initializing the API

- ``VercelKit/VercelApi/getProjectList()``
- ``VercelKit/VercelApi/getUser()``
- ``VercelKit/VercelApi/getAuthTokenList()``

