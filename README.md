 Automated Patch Management System

An automated patch management system built using **Flutter** (frontend) and **Firebase** (backend). This app enables admins to upload patches and users to view/download them. It simplifies patch tracking, management, and secure distribution.

---

 📱 Features

- ✅ Firebase Authentication (Login/Register)
- 👨‍💻 Admin Panel for uploading patch files
- 👥 User Interface to view/download patches
- ☁️ Firebase Storage for patch hosting
- 🔄 Real-time patch list via Firestore
- 🔐 Role-based user access (Admin/User)
- 📦 File picker integration

---

 🏗️ Tech Stack

| Technology     | Purpose                  |
|----------------|---------------------------|
| Flutter        | UI development            |
| Dart           | Programming language      |
| Firebase Auth  | User authentication       |
| Cloud Firestore| Patch data storage        |
| Firebase Storage| File uploads             |
| File Picker    | Select patch files locally|

---

 🛠️ Setup Instructions

 1. 🔥 Firebase Setup

- Go to [Firebase Console](https://console.firebase.google.com/)
- Create a new project
- Enable **Authentication** → Email/Password
- Create **Firestore Database**
- Enable **Firebase Storage**

Download `google-services.json` and place it in `android/app/`

---

 2. 🧑‍💻 Clone the Repo

```bash
git clone https://github.com/your-username/patch-management-flutter.git
cd patch-management-flutter
````

---

 3. 📦 Install Dependencies

```bash
flutter pub get
```

---

### 4. ▶️ Run the App

```bash
flutter run
```

---

 👤 User Roles

* Admin Can upload patches (title, description, file)
* User Can view and download available patches
* Role-based access can be expanded via Firestore rules or user metadata*

---

 📁 Project Structure

```
lib/
├── auth/              # Login & registration
├── home/              # User & Admin dashboard
├── models/            # Patch data model
├── services/          # Firebase services
├── widgets/           # Reusable components
├── utils/             # Role management
└── main.dart          # Entry point
```

---

 🚀 Future Improvements

* ✅ Push Notifications (FCM)
* ✅ Patch Version Control
* ✅ Patch Deployment Status Tracking
* ✅ Scheduled Updates
* ✅ Admin Dashboard Analytics

