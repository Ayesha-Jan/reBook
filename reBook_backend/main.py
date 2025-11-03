from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from database import Base, engine, SessionLocal
import models

app = FastAPI(title="ReBook Mini API")

Base.metadata.create_all(bind=engine)


# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


# --- Simple seed data on first run ---
@app.on_event("startup")
def seed_data():
    db = SessionLocal()
    if not db.query(models.User).first():
        user = models.User(name="Alice", email="alice@example.com")
        book = models.Book(title="The Great Gatsby", author="F. Scott Fitzgerald", owner=user)
        db.add_all([user, book])
        db.commit()
    db.close()


# --- Endpoints ---

@app.get("/")
def home():
    return {"message": "ReBook API Running"}


@app.get("/books")
def get_books(db: Session = Depends(get_db)):
    book = db.query(models.Book).first()
    return {"book": {"title": book.title, "author": book.author, "owner": book.owner.name}}


@app.post("/exchange/request")
def send_request(name: str, db: Session = Depends(get_db)):
    book = db.query(models.Book).first()
    if not book:
        raise HTTPException(status_code=404, detail="No book available")
    exchange = models.Exchange(book=book, requester_name=name)
    db.add(exchange)
    db.commit()
    return {"message": f"Exchange request sent by {name}"}


@app.post("/exchange/accept")
def accept_request(db: Session = Depends(get_db)):
    exchange = db.query(models.Exchange).first()
    if not exchange:
        raise HTTPException(status_code=404, detail="No exchange to accept")
    exchange.status = "accepted"
    db.commit()
    return {"message": "Exchange accepted!"}


@app.get("/profile")
def profile(db: Session = Depends(get_db)):
    user = db.query(models.User).first()
    return {"name": user.name, "email": user.email, "book": user.book.title}
