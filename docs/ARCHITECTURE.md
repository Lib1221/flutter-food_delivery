# Architecture

A Flutter food ordering app using Firebase for auth and data, Stripe for payments, Dio for HTTP, and Google Maps for delivery location.

## Modules (`lib/`)

| Folder / file | Role |
| ------------- | ---- |
| `main.dart`, `firebase_options.dart` | Bootstrap and Firebase init |
| `splashScreen/` | Launch screen |
| `Authservice/` | Firebase Authentication (sign up, sign in, sign out) |
| `dashboard.dart` | Home: categories and featured items |
| `cart/` | Cart state and checkout summary |
| `payment/` | Stripe PaymentSheet flow |
| `maps/` | Address selection and map view |
| `posting.dart` | Adding menu items (admin/vendor) |
| `common.dart` | Shared widgets and constants |

## Flow

```
Auth -> Dashboard (Firestore categories/items) -> Cart -> Payment (Stripe) -> Order document in Firestore
```
