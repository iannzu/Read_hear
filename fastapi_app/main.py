from fastapi import FastAPI, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from sqlalchemy.orm import Session
from passlib.context import CryptContext
from models import UserLog, Creation, Base
from database import SessionLocal, engine

app = FastAPI()
Base.metadata.create_all(bind=engine)

origins = ["*"]  # Allow all origins for development

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def hash_password(password: str):
    return pwd_context.hash(password)

def verify_password(plain, hashed):
    return pwd_context.verify(plain, hashed)

# Schemas
class UserCreate(BaseModel):
    email: str
    username: str
    password: str

class UserLogin(BaseModel):
    email: str
    password: str

class CreationCreate(BaseModel):
    title: str
    description: str
    type: str
    owner_id: int

class CreationOut(BaseModel):
    id: int
    title: str
    description: str
    type: str
    owner_id: int

    class Config:
        orm_mode = True

# Auth routes
@app.post("/signup/")
def signup(user: UserCreate, db: Session = Depends(get_db)):
    hashed = hash_password(user.password)
    print(f"Signup password: {user.password} -> {hashed}")  # Debug

    existing = db.query(UserLog).filter(
        (UserLog.email == user.email) | (UserLog.username == user.username)
    ).first()

    if existing:
        raise HTTPException(status_code=400, detail="Email or username already exists")

    new_user = UserLog(
        email=user.email,
        username=user.username,
        password_hash=hashed
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return {"id": new_user.id, "email": new_user.email, "username": new_user.username}


@app.post("/login/")
def login(user: UserLogin, db: Session = Depends(get_db)):
    db_user = db.query(UserLog).filter(UserLog.email == user.email).first()
    
    print(f"User input password: {user.password}")
    if db_user:
        print(f"Stored hash: {db_user.password_hash}")
        print(f"Password match: {verify_password(user.password, db_user.password_hash)}")
    else:
        print("No user found with that email.")

    if not db_user or not verify_password(user.password, db_user.password_hash):
        raise HTTPException(status_code=401, detail="Invalid credentials")
    
    return {"message": "Login successful", "id": db_user.id, "username": db_user.username}


# Creations
@app.post("/creations/", response_model=CreationOut)
def create_creation(creation: CreationCreate, db: Session = Depends(get_db)):
    new_creation = Creation(**creation.dict())
    db.add(new_creation)
    db.commit()
    db.refresh(new_creation)
    return new_creation

@app.get("/creations/{user_id}", response_model=list[CreationOut])
def get_user_creations(user_id: int, db: Session = Depends(get_db)):
    return db.query(Creation).filter(Creation.owner_id == user_id).all()

@app.put("/creations/{creation_id}", response_model=CreationOut)
def update_creation(creation_id: int, updated: CreationCreate, db: Session = Depends(get_db)):
    creation = db.query(Creation).filter(Creation.id == creation_id).first()
    if not creation:
        raise HTTPException(status_code=404, detail="Creation not found")
    for field, value in updated.dict().items():
        setattr(creation, field, value)
    db.commit()
    db.refresh(creation)
    return creation

@app.delete("/creations/{creation_id}")
def delete_creation(creation_id: int, db: Session = Depends(get_db)):
    creation = db.query(Creation).filter(Creation.id == creation_id).first()
    if not creation:
        raise HTTPException(status_code=404, detail="Creation not found")
    db.delete(creation)
    db.commit()
    return {"message": "Creation deleted"}

@app.get("/")
def root():
    return {"message": "API is working"}
