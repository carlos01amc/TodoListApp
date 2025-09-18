# 📝 Simple Todo List (SwiftUI + SwiftData)

A minimal but clean todo list app built with **SwiftUI** and **SwiftData**.  
The goal of this project is to practice building modular, modern iOS apps with navigation, persistence, and reusable UI components.

---

## ✨ Features

- Add new tasks
- Edit task details (title, description, completed status)
- Mark tasks as complete/incomplete with a single tap
- Delete tasks from the detail screen or with swipe-to-delete
- Tasks are persisted locally using **SwiftData**
- Modular components like `CardView` for clean, reusable UI

---

## 🛠️ Tech Stack

- **SwiftUI** for declarative UI
- **SwiftData** for persistence and live model updates
- **MVVM-lite approach** — simple direct bindings with room to introduce view models later
- Modular views (`TaskListView`, `DetailTaskView`, `CardView`)
