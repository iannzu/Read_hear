from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from database import Base

class UserLog(Base):
    __tablename__ = 'users'

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, index=True)
    username = Column(String, unique=True, index=True)
    password_hash = Column(String)

    creations = relationship("Creation", back_populates="owner")


class Creation(Base):
    __tablename__ = 'creations'

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String)
    description = Column(String)
    type = Column(String)
    owner_id = Column(Integer, ForeignKey('users.id'))

    owner = relationship("UserLog", back_populates="creations")
