# 📋 Simbiotik Flutter Task — Job Portal App

An elegant and responsive Flutter application that fetches and displays job listings from a remote REST API, complete with detailed job views, smooth animations, and robust error handling. Built as a practical assignment for **Simbiotik Technologies**.

---

## 📱 Screenshots & Screen Recording

> **Note:** Add your actual screenshots and screen recording files to the `screenshots/` and `recording/` directories respectively.

| Home Screen | Job Detail Screen |
| :---: | :---: |
| <img src="screenshots/home.png" width="250"/> | <img src="screenshots/detail.png" width="250"/> |

🎥 **Screen Recording:** [Watch Demo](recording/demo.mp4)

---

## ✨ Features

- **Job Listings**: Fetches job data from a remote REST API and displays them in a scrollable list.
- **Detailed View**: Tap on any job card to view the full description, salary, location, and application details.
- **State Management**: Clean and reactive state management using **GetX**.
- **Network Calls**: Robust API handling using the **Dio** package.
- **Responsive UI**: Custom widgets, tailored typography, and a modern Material Design aesthetic.
- **Loading & Error States**: Graceful handling of network delays and errors with user-friendly feedback.

---

## 🛠️ Tech Stack & Architecture

| Layer | Technology |
| --- | --- |
| **Framework** | Flutter |
| **Language** | Dart |
| **State Management** | GetX |
| **Networking** | Dio |
| **Architecture** | MVC (Model-View-Controller) |

### 📂 Folder Structure

```
lib/
 ├── controllers/          # GetX Controllers for State Management
 │   └── job_controller.dart
 ├── models/               # Data Models
 │   └── job_model.dart
 ├── services/             # API Services (Dio)
 │   └── api_service.dart
 ├── views/                # UI Layer
 │   ├── screens/
 │   │   ├── job_dashboard_screen.dart
 │   │   └── job_detail_screen.dart
 │   └── widgets/
 │       └── job_card.dart
 └── main.dart             # Application Entry Point
```

---

## 🚀 How to Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ajscodes/simbiotik_task.git
   cd simbiotik_task
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

---

## 📦 APK

The release APK is available in the [`apk/`](apk/) directory:

```
apk/app-release.apk
```

You can also build it yourself:
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

---

## 📝 Notes

- Secondary **build/** and **cache** layers (`.dart_tool/`, `.flutter-plugins`, `build/`, etc.) have been explicitly omitted via the standard Flutter [`.gitignore`](.gitignore), ensuring a clean source project.
- The repository contains only the source code, configuration, and deliverable assets (APK, screenshots, recording).
