# 💰 E-Wallet App

A modern and intuitive e-wallet application built using **Flutter**. It allows users to create and manage multiple wallets with multi-currency support, perform deposit and withdrawal transactions, and enjoy light/dark mode switching with smooth UX.

---

## 📱 Features

- 🔐 Secure login with JWT token
- 💼 Multiple wallets per user
- 💱 Currency support for **USD**, **EUR**, and **GBP**
- 💸 Deposit & Withdrawal transactions
- 📊 Transaction history with pagination
- 🌗 Light & Dark mode toggle using `Cubit`
- 🔁 API retry mechanism using `dio_retry_plus`
- 🧠 Clean architecture with Cubit & Repository pattern

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/herisandiyadi/ewallet.git
cd ewallet
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Set up environment

Create a `.env` file at the root and configure the API base URL:

```env
BASE_URL=https://your-api-url.com
```

### 4. Run the app

```bash
flutter run
```

---

## 📁 Project Structure

```
lib/
├── features/                     # Feature-based structure
│   ├── core/                     # Core utilities, global configurations
│   │   ├── constants/            # App constants (e.g., baseUrl, colors)
|   |   ├── injection.dart        # get_it dependency setup
│   │   ├── error/                # Custom exceptions and failure handlers
│   │   ├── network/              # Dio setup, interceptors, internet checker
│   │   └── theme/                # ThemeCubit for light/dark mode
│   │
│   ├── auth/                     # Authentication feature
│   │   ├── data/                 # Data layer
│   │   │   ├── models/           # Auth-related models
│   │   │   ├── datasources/      # Remote/local data sources
│   │   │   └── repositories/     # Repository implementation
│   │   ├── domain/               # Domain layer
│   │   │   ├── entities/         # Auth entities
│   │   │   ├── repositories/     # Abstract repository contracts
│   │   │   └── usecases/         # Business logic
│   │   └── presentation/         # UI layer
│   │       ├── cubit/            # Cubit for auth state management
│   │       ├── pages/            # Login/Register screens
│   │       └── widgets/          # Auth-specific widgets
│
│   ├── wallet/                   # Wallet feature
│   │   ├── data/
│   │   │   ├── models/           # Wallet models
│   │   │   ├── datasources/      # Wallet API or local sources
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── cubit/
│   │       ├── pages/
│   │       └── widgets/
│
│   └── transactions/            # Transactions feature
│       ├── data/
│       │   ├── models/
│       │   ├── datasources/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── cubit/
│           ├── pages/
│           └── widgets/
│
├── shared/                      # Shared/common UI or logic
│   ├── widgets/                 # Globally reusable widgets
│   └── extensions/              # Dart extension methods
│
└── main.dart                    # App entry point

```

---

## 📦 Main Dependencies

| Package | Usage |
|--------|-------|
| [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | State management (Cubit) |
| [`dio`](https://pub.dev/packages/dio) | HTTP client |
| [`dio_retry_plus`](https://pub.dev/packages/dio_retry_plus) | Auto-retry failed requests |
| [`get_it`](https://pub.dev/packages/get_it) | Dependency injection |
| [`flutter_secure_storage`](https://pub.dev/packages/flutter_secure_storage) | Secure token storage |
| [`equatable`](https://pub.dev/packages/equatable) | Value comparison |
| [`go_router`](https://pub.dev/packages/go_router) | Routing |
| [`intl`](https://pub.dev/packages/intl) | Date/time formatting |

---

## 🧑‍🎨 UI Highlights

- Beautiful card-styled wallet UI
- Elegant modal dialogs with rounded corners (`borderRadius: 16`)
- Clear separation between actions (Deposit / Withdrawal)
- Responsive design with scroll-safe layouts

---

## 💡 Sample Code

### 🌗 Theme Toggle with Cubit

```dart
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
```

### 📆 Format UTC Date

```dart
String formatUtcDate(String utc) {
  final date = DateTime.parse(utc).toLocal();
  return DateFormat('yyyy-MM-dd HH:mm').format(date);
}
```

---


## 📸 Screenshots

<table> <tr> <th>List Wallet View</th> <th> Detail Transaction</th> <th>Dark Mode</th> </tr> <tr> <td><img src="https://github.com/user-attachments/assets/fc5f8106-b3d1-4373-9527-c49f11cacbfe" width="250"/></td> <td><img src="https://github.com/user-attachments/assets/addcdc86-57fd-40f8-87cb-d52023ae7c5a" width="250"/></td> <td><img src="https://github.com/user-attachments/assets/e5042737-d8b8-4cb5-9695-57ef6d8ec2ae" width="250"/></td> </tr> </table>


---

## 📤 Future Improvements

- 🔔 Push notifications
- 📂 Export transaction history (PDF or CSV)
- 👥 Multi-user support
- 🧾 Receipt generation for transactions

---


## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Heri Sandiyadi**  
[GitHub](https://github.com/herisandiyadi)  
Feel free to connect and collaborate!
