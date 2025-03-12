FROM 3.13.2-bookworm            #เรียก image จาก docker hub
WORKDIR /code                   #ทํางานในโฟลเดอร์ /code
COPY requirements.txt .         #คัดลอกไฟล์ requirements.txt จากเครื่องเรา ไปยัง image ซึ่งก็คือ โฟลเดอร์ /code/
RUN pip install -r requirements.txt  #สั่งให้ docker รันคำสั่ง pip install เพื่อติดตั้ง dependencies
COPY . .                        #คัดลอกไฟล์ทั้งหมดจากเครื่องเรา ไปยัง image
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]   #CMD เป็นคำสั่งรัน เหมือน RUN แต่ต่างกันที่ RUN เสร็จ output ไปที่ cache แต่ CMD รันให้ container ทำงาน