# 📰 Flutter News App

A fully functional **Flutter news application** built for internship evaluation. It showcases real-time news from a public API with clean UI, search, theme toggling, and article viewing features.

## Features

- **Login Page** with validation
- **News Feed** with latest articles
- **Search Bar** to filter news
- **Dark Mode** toggle
- **WebView** to read full articles
- **Pull to Refresh** support

## 💻 Tech Stack

- **Flutter** (Latest Stable)
- `http` – for API calls
- `provider` – for state management
- `webview_flutter` – for full article viewing
- `cached_network_image` – for optimized image loading

## 🔑 How to Set API Key
This app uses a public news API (NewsAPI). To replace the API key:

1. Go to lib/utils/api_key.dart

2. Replace 'API_KEY' with your own key from the news API provider (like 48095a3b78724b82be0e658654ca1cf6).

🔗 You can get a free API key from https://newsapi.org

## 🚀 How to Run

1. Clone the project:
   ```bash
   git clone https://github.com/SmitaPatel19/NewsApp
   cd NewsApp
   ```

2. Install packages:
   ```bash
   flutter pub get
   ```

3. Run on emulator/device:
   ```bash
   flutter run
   ```

4. To generate APK:
   ```bash
   flutter build apk --release
   ```

## 📲 APK Demo

You can find the built APK in `/build/app/outputs/flutter-apk/app-release.apk`.

---

## 🤝 Contributing  

Got an idea? Found a bug? Feel free to **contribute**! Fork this repo, make your changes, and submit a pull request. Contributions are always welcome. 🙌  

---

## 🎉 Acknowledgements  

A huge shoutout to the **Flutter** team for making such awesome tools! 🚀  

If you like this project, don’t forget to **⭐ Star** the repo! 😊  

---
## 🙋‍♂️ About Me

This app was built as part of my Flutter learning journey and internship task. It demonstrates core Flutter concepts like UI building, state management, API integration, and navigation.
