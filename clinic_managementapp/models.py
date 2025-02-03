from django.db import models

# Create your models here.

class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)

class doctor_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    firstname=models.CharField(max_length=100)
    lastname=models.CharField(max_length=100)
    dob=models.DateField()
    gender=models.CharField(max_length=100)
    specilization=models.TextField()
    qualification=models.TextField()
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    pin=models.CharField(max_length=100)
    photo = models.FileField()

class shedule_table(models.Model):
    DOCTOR=models.ForeignKey(doctor_table,on_delete=models.CASCADE)
    date=models.DateField()
    fromtime=models.TimeField()
    totime=models.TimeField()

class user_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    firstname=models.CharField(max_length=100)
    lastname=models.CharField(max_length=100)
    dob=models.DateField()
    gender=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post = models.CharField(max_length=100)
    pin= models.CharField(max_length=100)
    phone= models.CharField(max_length=100)
    email= models.CharField(max_length=100)

class booking_table(models.Model):
    SHEDULE=models.ForeignKey(shedule_table,on_delete=models.CASCADE)
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    sloat=models.CharField(max_length=50)
    token=models.IntegerField()
    date=models.DateField()
    status=models.CharField(max_length=100)
    bstatus=models.CharField(max_length=100)

class complaint_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=100)
    date=models.DateField()
    reply=models.CharField(max_length=100)

class feedback_table(models.Model):
    DOCTOR = models.ForeignKey(doctor_table, on_delete=models.CASCADE)
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    feedback=models.CharField(max_length=100)
    rating=models.FloatField()
    date = models.DateField()
class disease_table(models.Model):
    disease = models.CharField(max_length=100)
    remedy = models.CharField(max_length=1000)
    preventive_measure = models.CharField(max_length=1000)
    department= models.CharField(max_length=100)

class symptom_table(models.Model):
    disease = models.ForeignKey(disease_table,on_delete=models.CASCADE)
    symptom = models.CharField(max_length=100)

class prescription_table(models.Model):
    BOOKING= models.ForeignKey(booking_table, on_delete=models.CASCADE)
    prescription = models.CharField(max_length=5000)
    type = models.CharField(max_length=20)
    date = models.DateField()

class pharmacy_table(models.Model):
    LOGIN = models.ForeignKey(login_table, on_delete=models.CASCADE)
    name= models.CharField(max_length=100)
    place= models.CharField(max_length=100)
    post = models.CharField(max_length=100)
    pin = models.CharField(max_length=100)
    latitude= models.CharField(max_length=100)
    longitude= models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)


class medicine_table(models.Model):
    PHARMACY = models.ForeignKey(pharmacy_table, on_delete=models.CASCADE)
    medicinename = models.CharField(max_length=100)
    description = models.CharField(max_length=100)
    rate = models.CharField(max_length=100)
    stock = models.CharField(max_length=100)

class request_table(models.Model):
    PRESCRIPTION = models.ForeignKey(prescription_table, on_delete=models.CASCADE)
    PHARMACY = models.ForeignKey(pharmacy_table, on_delete=models.CASCADE)
    date = models.DateField()
    status = models.CharField(max_length=100)

class bill_table(models.Model):
    prescription= models.ForeignKey(prescription_table, on_delete=models.CASCADE)
    PHARMACY= models.ForeignKey(pharmacy_table, on_delete=models.CASCADE)
    Total = models.CharField(max_length=600)
    Status = models.CharField(max_length=600)

class bill_items_table(models.Model):
    MEDICINE= models.ForeignKey(medicine_table, on_delete=models.CASCADE)
    bill= models.ForeignKey(bill_table, on_delete=models.CASCADE)
    quantity= models.CharField(max_length=600)

