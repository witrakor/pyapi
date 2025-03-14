from fastapi import FastAPI
from .routers import book, user, file
from fastapi.middleware.cors import CORSMiddleware
import os

app = FastAPI()

origins = [
    "http://localhost:8080",
    "http://localhost:3000",
    "https://stackpython.co"
]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(book.router)
app.include_router(user.router)
app.include_router(file.router)

@app.get("/")
async def root():
    to_person = os.getenv("to_person", "you")
    database_url = os.getenv("DATABASE_URL", "No database URL found")  # ดึงค่าจาก environment variable
    return {"message": f"Hello {to_person}, I love {to_person} DATABASE_URL={database_url}"}


# ถ้ามีโค้ดส่วนนี้ เวลารันให้รันใช้คำสั่ง  python3 -m app.main ก็พอ  
# แต่ถ้าไม่มีให้ใช้คำสั่ง uvicorn app.main:app --reload
#if __name__ == "__main__":
#    import uvicorn
#    uvicorn.run("app.main:app", host="127.0.0.1", port=8080, reload=True)