# LingoBreeze – My Vocabulary

## About the Project

LingoBreeze is a simple vocabulary learning application built using Flutter. The goal of this feature is to help users save and manage words they want to learn later.

The application fetches vocabulary words from a Node.js API and allows users to save selected words to Firebase Firestore. Users can then view all their saved words in the "My Vocabulary" section.

This project was developed as part of an internship assignment and focuses on clean architecture, reusable components, proper state management, and a smooth user experience.

## Features

* Fetch vocabulary words from a REST API
* Save selected words to Firebase Firestore
* View saved vocabulary words
* Loading state handling
* Empty state handling
* Error state handling
* Pull-to-refresh support
* Duplicate word prevention
* Clean and simple user interface

## Tech Stack

### Frontend

* Flutter
* Provider (State Management)

### Backend

* Node.js
* Express.js

### Database

* Firebase Firestore

## Project Structure

The project follows a Clean Architecture approach and is divided into three main layers:

* **Data Layer** – Handles API calls and Firebase operations
* **Domain Layer** – Contains business logic and entities
* **Presentation Layer** – Contains UI screens, widgets, and state management

## Application Flow

1. The application fetches vocabulary words from the Node.js API using the `GET /words` endpoint.
2. Users can browse the available words.
3. A word can be saved with a single click.
4. Saved words are stored in Firebase Firestore.
5. The saved words appear in the "My Vocabulary" section.

## API Endpoint

### Get All Words

```http
GET /words
```

Example Response:

```json
[
  {
    "word": "Apple",
    "meaning": "A fruit",
    "translation": "Manzana"
  }
]
```

## Running the Backend

Navigate to the backend folder:

```bash
cd backend
```

Install dependencies:

```bash
npm install
```

Start the server:

```bash
node server.js
```

The API will run on:

```text
http://localhost:3000/words
```

## Running the Flutter Application

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Firebase Integration

Firebase Firestore is used to store saved vocabulary words. Whenever a user saves a word from the API list, it is stored in Firestore and displayed in the "My Vocabulary" section.

## AI Contribution

AI tools were used during development to accelerate implementation and explore different approaches.

Estimated contribution:

* UI Development: 60%
* Backend Development: 50%
* Architecture & Integration: Manual

## Future Improvements

* User authentication
* Search and filter functionality
* Word categories
* Favorites and bookmarks
* Pronunciation support
* Daily vocabulary challenges
