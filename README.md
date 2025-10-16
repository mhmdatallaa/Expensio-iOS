# Expensio 💰

An intuitive expense tracking iOS app built with SwiftUI, designed to help users effortlessly manage their daily spending and gain insights into their financial habits.

## 🎯 Features

### Core Functionality
- **Expense Tracking**: Add, view, and delete expenses with ease
- **Smart Categorization**: Pre-built categories with emojis for quick expense classification
- **Real-time Totals**: Dynamic calculation of total expenses
- **Visual Analytics**: Interactive charts and graphs using Swift Charts
- **Dark Mode Support**: Seamless light/dark mode switching

### User Experience
- **Clean UI/UX**: Modern design with intuitive navigation
- **Quick Actions**: Fast expense entry with quick category selection
- **Detailed Views**: Comprehensive expense details and editing

### Data Visualization
- **Bar Charts**: Category-wise spending breakdown
- **Pie Charts**: Spending distribution overview
- **Statistics Dashboard**: Comprehensive financial insights

## 🏗️ Architecture

### Tech Stack
- **Framework**: SwiftUI (iOS 18.0+)
- **Data Visualization**: Swift Charts
- **Architecture**: MVVM Pattern
- **Data Persistence**: Core Data with custom storage layer
- **Navigation**: NavigationStack with TabView

### Key Components
```swift
ExpensioApp.swift          // App entry point
RootView.swift            // Main tab navigation
OnboardingView.swift      // Welcome screen
HomeView.swift           // Main expense list
AddExpenseView.swift     // Expense creation
StatView.swift          // Analytics dashboard
SettingsView.swift      // User preferences
```

### Data Model
- **Category System**: 18 predefined expense categories
- **Expense Model**: Title, amount, category, date, notes
- **Storage Layer**: CoreData with custom persistence store


## 🛠️ Technical Highlights

- **SwiftUI Mastery**: Modern declarative UI with advanced SwiftUI features
- **Data Persistence**: Robust Core Data implementation with custom storage layer
- **Charts Integration**: Beautiful data visualization using Swift Charts
- **MVVM Architecture**: Clean separation of concerns with observable models
- **iOS 18 Features**: Leverages latest iOS capabilities and design patterns

## 🎯 Development Skills Demonstrated

- Advanced SwiftUI development
- Core Data and data persistence
- Charts and data visualization
- MVVM architectural pattern
- Navigation and state management
- Custom UI components
- Dark mode implementation
- iOS app lifecycle management

## 🚧 Future Enhancements
- [ ] Budget setting and alerts
- [ ] Multiple currency support
- [ ] Cloud sync capabilities
- [ ] Receipt photo capture
- [ ] Advanced filtering and search

