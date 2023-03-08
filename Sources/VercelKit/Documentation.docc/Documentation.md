# ``VercelKit``
@Metadata {
    @Available(iOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "8.0")
}

Connect with the Vercel REST API.

## Overview
To get started with VercelKit check out the <doc:QuickstartGuide>

>Note VercelKit is powered the official REST API provided by [Vercel](https://vercel.com/docs/rest-api) but is not affiliated in any way with Vercel.

## Project Structure
This project is far from complete. If you experience any bugs or have any feature requests, please file an issue over on [GitHub](https://github.com/LeoSM-07/VercelKit). 

## Topics

- <doc:QuickstartGuide>

### Requests

- ``VercelKit/VercelApi/getProjectList()``
- ``VercelKit/VercelApi/getUser()``
- ``VercelKit/VercelApi/getAuthTokenList()``

### Models
- ``VAuthToken``
- ``VAuthUser``
- ``VAuthUserLimited``
- ``VProject``

- ``VPagination``
- ``VOrigin``

### Convince
- ``VercelKit/VercelApi/getUserImage(_:size:)``
- ``VercelKit/VercelData``

### Misc
- ``VercelKit/VercelApi``
- ``VercelKit/VAuthUserResponse``
- ``VercelKit/VListAuthTokenResponse``
- ``VercelKit/VProjectListResponse``
