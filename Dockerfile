# เรียกใช้ Python 3.13 bookworm เป็น base image
FROM python:3.13-bookworm     

# กำหนดโฟลเดอร์ทำงานใน container เป็น /code
WORKDIR /code                   

# คัดลอกไฟล์ requirements.txt ไปยัง container
COPY requirements.txt .        

# ติดตั้ง dependencies จาก requirements.txt
RUN pip install --no-cache-dir -r requirements.txt  

# คัดลอกไฟล์ทั้งหมดจากเครื่องเราไปยัง container
COPY . .                        

# เปิดพอร์ต 8000 ให้ container ใช้งาน
EXPOSE 8000

# สั่งให้ container รัน FastAPI ด้วย Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
