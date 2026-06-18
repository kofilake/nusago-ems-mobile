# NusaGo Employee Management System - Mobile 📱
This is the repository for NusaGo EMS app, a mobile application made for viewing NusaGo employee list and developed as part of the internship (PKL) project for **PT NusaGo Digital Travelindo**. The system is built using Flutter and implements **Clean Architecture + BloC Pattern.**



## 🔑 Prerequisites
- **Flutter SDK:** Install Flutter (Eunsure Dart SDK 3.4+).
- **Git:** Install Git to clone the repository.
- IDE like **VS Code** or **Android Studio**.

## 📥 Cloning and Installation
1. **Clone the repository:** Open your terminal and run:
```bash
git clone https://github.com/kofilake/nusago-ems-mobile
cd nusago_mobile
```

2. **Fetch the dependencies:** To download all the necessary Flutter packages, run:
```bash
flutter pub get
```

## ⚙️ Endpoint Configuration
This project uses local IP for the endpoint URL. You need to configure them before running the app:
1. Navigate to ```core/network/``` directory
2. Open ```api_endpoint.dart``` and change the baseUrl to your backend URL:
```bash
class ApiEndpoints {
  static const String baseUrl = '<YOUR_BACKEND_URL>';  #example: http://api.nusago.com/api

  static const String loginEnd = '$baseUrl/login';
  static const String registerEnd = '$baseUrl/register';
  static const String logoutEnd = '$baseUrl/logout';
  static const String employeesListEnd = '$baseUrl/employees';
  static const String employeesDetailEnd = '$baseUrl/employees/{id}';
}
```

## 🚀 Running the App
To run the application, open terminal and navigate to the main directory (```/nusago_ems```) and run:
```bash
flutter run
```

## 📂 Project Structure Overview
```bash
lib/
├── core/                   # Core utilities, error handling, themes, constants
├── config/                 # Configuration setup (routes, themes, injections)
├── features/               # Feature modules (e.g., auth, profile)
│   └── auth/
│       ├── data/           # Models, Data Sources (Remote/Local), Repositories Impl
│       ├── domain/         # Entities, Repositories definitions, Use Cases
│       └── presentation/   # BLoC, Pages/Screens, Widgets for the specific feature
├── injection.dart          # Dependency Injection Registration (GetIt)
└── main.dart               # Application entry point
```
