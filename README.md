# 📚🔄 ReBook

**ReBook** is a community-driven Book Exchange App that allows users to trade, share, and explore used books easily. Whether you’re a reader, collector, or sustainability advocate, ReBook connects book lovers within their local community while promoting eco-friendly sharing.
**Note:** This is a prototype. Only basic book listing, profile viewing, and exchange request functionality is implemented.

---

## Features

### Home Page

- Displays a list of available books.
- Shows book title, author, and owner.
- Request a book from another user using the "Request" button.
- Loading indicator while fetching data.
- Handles empty book lists gracefully.

---

### Profile Page

- Displays user name and email.
- Shows the list of books owned by the user.
- Accept exchange requests via a button.
- Loading indicator while fetching profile data.

---

### Backend API
Built with **FastAPI**:

- **Endpoints**:
  - `/books` – Get all available books
  - `/profile` – Fetch logged-in user profile
  - `/exchange/request` – Send an exchange request
  - `/exchange/accept` – Accept a pending exchange
- **Data Management**: PostgreSQL with SQLAlchemy ORM
- **Seed Data**: Auto-creates initial users and books on first run

---

### Book Exchange (Future)
- **Request a Book**: Send a request to the book owner
- **Accept / Decline Requests**: Book owners can manage incoming requests
- **Notifications**: Receive updates on exchange status
- **Admin Panel**: Manage users, books, and categories (backend)

---

## Getting Started

### Prerequisites

- Flutter SDK (Frontend)
- Python 3.10+ with FastAPI, SQLAlchemy (Backend)
- PostgreSQL
- Android Studio / Xcode or a physical device

### Clone the repository

    git clone https://github.com/Ayesha-Jan/reBook.git
    cd reBook

### Running the Backend

    cd rebook_backend
    pip install -r requirements.txt
    uvicorn main:app --reload

### Running the Frontend

    cd rebook_frontend
    flutter pub get
    flutter run

---

## Author

Developed by: Ayesha A. Jan  
Email: Ayesha.Jan@stud.srh-campus-berlin.de  
🎓 BST Software Engineering – 2025
