import smtplib
from datetime import datetime
from django.db.models import Q
from email.mime.text import MIMEText

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http.response import HttpResponse
from django.shortcuts import render
from .models import *
from django.utils import timezone


import math




import numpy as np

import random
from collections import Counter



def logout(request):
    auth.logout(request)
    return render(request,'index.html')

def login(request):
    return render(request,'index.html')


def forgotpass(request):
    return render(request,'forgotindex.html')



def forgotpassword1(request):
    print(request.POST)
    try:
        print("1")
        print(request.POST)
        email = request.POST['textfield']
        print(email)
        # qry = "SELECT `login`.`password` FROM `student`  JOIN `login` ON `login`.`L_id` = `student`.`L_id` WHERE email=%s"
        s = doctor_table.objects.get(email=email)
        print(s, "=============")
        if s is None:
            return HttpResponse("<script>alert('invalid email');window.location='/'</script>")
        else:
            try:
                gmail = smtplib.SMTP('smtp.gmail.com', 587)
                gmail.ehlo()
                gmail.starttls()
                gmail.login('2023group11@gmail.com', 'msddfgelyyxkcagn')
                print("login=======")
            except Exception as e:
                print("Couldn't setup email!!" + str(e))
            msg = MIMEText("Your password is : " + str(s.LOGIN.password))
            print(msg)
            msg['Subject'] = 'Clinic management'
            msg['To'] = email
            msg['From'] = '2023group11@gmail.com'

            print("ok====")

            try:
                gmail.send_message(msg)
            except Exception as e:
                return HttpResponse("<script>alert('invalid');window.location='/'</script>")
            return HttpResponse("<script>alert('sent');window.location='/'</script>")
    except Exception as e:
        print(e)
        return HttpResponse("<script>alert('invalid');window.location='/'</script>")


def loginpost(request):
    un=request.POST['textfield']
    pwd=request.POST['textfield2']
    try:
        ob=login_table.objects.get(username=un,password=pwd)
        if ob.type == "admin":
            ob1=auth.authenticate(username="admin",password="12345")
            if ob1 is not None:
                auth.login(request,ob1)
            return HttpResponse("<script>alert('welcome');window.location='/adminhome'</script>")
        elif ob.type == "doctor":
            ob1 = auth.authenticate(username="admin", password="12345")
            if ob1 is not None:
                auth.login(request, ob1)
            request.session['lid']=ob.id
            return HttpResponse("<script>alert('welcome');window.location='/doc_home'</script>")

        else:
            return HttpResponse("<script>alert('Invalid username or password');window.location='/'</script>")


    except:
        return HttpResponse("<script>alert('Invalid username or password');window.location='/'</script>")


@login_required(login_url='/')

def add_doc(request):
    return render(request,'admin/add doc.html')

@login_required(login_url='/')

def add_doc_post(request):
    fname=request.POST['textfield']
    lname = request.POST['textfield2']
    dob = request.POST['textfield3']
    gender = request.POST['radiobutton']

    spe = request.POST.getlist('textfield4')
    # qua = request.POST['textfield5']
    spp=','.join(spe)
    selected_values = request.POST.getlist('textfield5')
    # Join the selected values with commas
    selected_values_string = ', '.join(selected_values)
    place = request.POST['place']
    post = request.POST['post']
    pin = request.POST['pin']

    email = request.POST['textfield6']
    phone = request.POST['textfield7']
    uname = request.POST['textfield8']
    password = request.POST['textfield9']
    photo = request.FILES['f']
    fs=FileSystemStorage()
    fsave=fs.save(photo.name,photo)



    ob=login_table()
    ob.username=uname
    ob.password=password
    ob.type='doctor'
    ob.save()

    ob1=doctor_table()
    ob1.LOGIN=ob
    ob1.firstname=fname
    ob1.lastname=lname
    ob1.dob=dob
    ob1.gender=gender
    ob1.specilization=spp
    ob1.qualification=selected_values_string
    ob1.email=email
    ob1.phone=phone
    ob1.place=place
    ob1.post=post
    ob1.pin=pin
    ob1.photo=fsave
    ob1.save()
    return HttpResponse("<script>alert('Added');window.location='/manage_doctor#about'</script>")


@login_required(login_url='/')

def add_shedule(request):
    current_date = timezone.now()
    fdate=current_date.strftime('%Y-%m-%d')
    print(fdate)
    return render(request,'admin/add shedule.html',{'m':fdate})

@login_required(login_url='/')
def insert_schedule(request):
    date=request.POST['textfield2']
    From=request.POST['textfield4']
    To=request.POST['textfield6']
    ob=shedule_table()
    ob.DOCTOR = doctor_table.objects.get(id=request.session['did'])
    ob.date =date
    ob.fromtime = From
    ob.totime = To
    ob.save()

    return HttpResponse("<script>alert('Added');window.location='/view_shedule/"+str(request.session['did'])+"#about'</script>")

@login_required(login_url='/')
def delete_sche(request,id):
    ob=shedule_table.objects.get(id=id)
    ob.delete()
    return HttpResponse(
        "<script>alert('Deleted');window.location='/view_shedule/" + str(request.session['did']) + "#about'</script>")

@login_required(login_url='/')
def adminhome(request):
    return render(request,'admin/adminindex.html')

@login_required(login_url='/')
def booking_details(request):
    ob = booking_table.objects.all()
    oj=doctor_table.objects.all()
    return render(request,'admin/booking details.html',{'val':ob,"val2":oj})
@login_required(login_url='/')
def booking_search(request):
    dt=request.POST['textfield']
    id=request.POST['select']
    print("==="+id+"=============")


    if(id=="All"):
        try:
            ob = booking_table.objects.filter(date=dt)
            if len(ob)==0:
                return HttpResponse("<script>alert('not found');window.location='/booking_details#about'</script>")

            oj = doctor_table.objects.all()
            return render(request, 'admin/booking details.html', {'val': ob, "val2": oj,"dt":dt})
        except:
            ob = booking_table.objects.all()
            oj = doctor_table.objects.all()
            return render(request, 'admin/booking details.html', {'val': ob, "val2": oj, "dt": dt})
    else:
        try:
            ob = booking_table.objects.filter(date=dt,SHEDULE__DOCTOR__id=id)
            oj = doctor_table.objects.all()
            if len(ob) == 0:
                return HttpResponse("<script>alert('not found');window.location='/booking_details#about'</script>")

            return render(request, 'admin/booking details.html', {'val': ob, "val2": oj, "dt": dt, "dr": int(id)})

        except:
            ob = booking_table.objects.filter( SHEDULE__DOCTOR__id=id)
            oj = doctor_table.objects.all()
            if len(ob) == 0:
                return HttpResponse("<script>alert('not found');window.location='/booking_details#about'</script>")

            return render(request, 'admin/booking details.html', {'val': ob, "val2": oj, "dt": dt, "dr": int(id)})


@login_required(login_url='/')
def com_search(request):
    dt=request.POST['textfield']
    ob = complaint_table.objects.filter(date=dt)
    if len(ob) == 0:
        return HttpResponse("<script>alert('not found');window.location='/view_comp_and_reply#about'</script>")
    else:
        return render(request, 'admin/view comp and reply.html',{'val':ob,"dt":dt})

@login_required(login_url='/')
def feedback_ad(request):
    ob=feedback_table.objects.all()
    oj=doctor_table.objects.all()
    return render(request,'admin/feedback ad.html',{'val':ob,'val2':oj})
@login_required(login_url='/')
def feedback_search(request):
    id=request.POST['select']
    ob = feedback_table.objects.filter(DOCTOR__id=id)
    oj = doctor_table.objects.all()
    return render(request, 'admin/feedback ad.html', {'val': ob, 'val2': oj,"dr":int(id)})
@login_required(login_url='/')
def manage_doctor(request):
    ob=doctor_table.objects.all()
    return render(request, 'admin/manage doctor.html',{"val":ob})
@login_required(login_url='/')
def doc_search(request):
    nm=request.POST['textfield2']
    ob = doctor_table.objects.filter(firstname__icontains=nm)
    if len(ob) == 0:
        return HttpResponse("<script>alert('not found');window.location='/manage_doctor#about'</script>")
    else:
        return render(request, 'admin/manage doctor.html', {"val": ob,"nm":nm})

@login_required(login_url='/')
def edit_doc(request,id):
    request.session['did']=id
    ob=doctor_table.objects.get(id=id)
    return render(request,'admin/edit doc.html',{'val':ob,'date':str(ob.dob)})
@login_required(login_url='/')
def edit_doc_post(request):
    if 'f' in request.FILES:
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        dob = request.POST['textfield3']
        gender = request.POST['radiobutton']

        spe = request.POST.getlist('textfield4')
        # qua = request.POST['textfield5']
        spp = ','.join(spe)
        selected_values = request.POST.getlist('textfield5')
        # Join the selected values with commas
        selected_values_string = ', '.join(selected_values)

        place = request.POST['place']
        post = request.POST['post']
        pin = request.POST['pin']

        email = request.POST['textfield6']
        phone = request.POST['textfield7']
        photo = request.FILES['f']
        fs = FileSystemStorage()
        fsave = fs.save(photo.name, photo)

        ob1 = doctor_table.objects.get(id=request.session['did'])
        ob1.firstname = fname
        ob1.lastname = lname
        ob1.dob = dob
        ob1.gender = gender
        ob1.specilization = spp
        ob1.qualification = selected_values_string
        ob1.email = email
        ob1.phone = phone
        ob1.place = place
        ob1.post = post
        ob1.pin = pin
        ob1.photo = fsave
        ob1.save()
        return HttpResponse("<script>alert('Added');window.location='/manage_doctor#about'</script>")
    else:
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        dob = request.POST['textfield3']
        gender = request.POST['radiobutton']

        spe = request.POST.getlist('textfield4')
        # qua = request.POST['textfield5']
        spp = ','.join(spe)
        selected_values = request.POST.getlist('textfield5')
        # Join the selected values with commas
        selected_values_string = ', '.join(selected_values)

        place = request.POST['place']
        post = request.POST['post']
        pin = request.POST['pin']

        email = request.POST['textfield6']
        phone = request.POST['textfield7']
        ob1 = doctor_table.objects.get(id=request.session['did'])
        ob1.firstname = fname
        ob1.lastname = lname
        ob1.dob = dob
        ob1.gender = gender
        ob1.specilization = spp
        ob1.qualification = selected_values_string
        ob1.email = email
        ob1.phone = phone
        ob1.place = place
        ob1.post = post
        ob1.pin = pin
        ob1.save()
    return HttpResponse("<script>alert('Updated');window.location='/manage_doctor#about'</script>")
@login_required(login_url='/')
def dlt_doc(request,id):
    ob=doctor_table.objects.get(LOGIN__id=id)
    ob.delete()
    return HttpResponse("<script>alert('Deleted');window.location='/manage_doctor#about'</script>")
@login_required(login_url='/')
def manage_shedulead(request):
    return render(request, 'admin/manage shedule.html')

@login_required(login_url='/')
def reply_send(request,id):
    request.session['cid']=id
    return render(request, 'admin/reply send.html')
@login_required(login_url='/')
def editreply(request,id):
    request.session['cid']=id
    ok=complaint_table.objects.get(id=id)
    return render(request, 'admin/edit reply.html',{'val':ok})
@login_required(login_url='/')
def editreply_code(request):
    rep=request.POST['textfield']
    ob=complaint_table.objects.get(id=request.session['cid'])
    ob.reply=rep
    ob.save()
    return HttpResponse("<script>alert('Updated');window.location='/view_comp_and_reply#about'</script>")
@login_required(login_url='/')
def reply_code(request):
    rep=request.POST['textfield']
    ob=complaint_table.objects.get(id=request.session['cid'])
    ob.reply=rep
    ob.save()
    return HttpResponse("<script>alert('Replied');window.location='/view_comp_and_reply#about'</script>")

@login_required(login_url='/')
def view_comp_and_reply(request):
    ob=complaint_table.objects.all()
    return render(request, 'admin/view comp and reply.html',{'val':ob})


@login_required(login_url='/')
def view_patientad(request):
    return render(request, 'admin/view patient.html')
@login_required(login_url='/')
def view_shedule(request,id):
    request.session['did']=id
    ob=shedule_table.objects.filter(DOCTOR__id=id)
    return render(request, 'admin/view shedule.html',{"val":ob})
@login_required(login_url='/')
def booking_details_doc(request):
    return render(request, 'doctor/booking details.html')

@login_required(login_url='/')
def doc_home(request):
    return render(request, 'doctor/doctorindex.html')

@login_required(login_url='/')
def view_patient(request):
    ob=booking_table.objects.filter(SHEDULE__DOCTOR__LOGIN__id=request.session['lid'],SHEDULE__date__gte=datetime.today()).order_by("SHEDULE__date")
    return render(request, 'doctor/view patient.html',{'val':ob})





@login_required(login_url='/')
def view_patient_search(request):
    date=request.POST['textfield']
    ob=booking_table.objects.filter(SHEDULE__DOCTOR__LOGIN__id=request.session['lid'],SHEDULE__date=date).order_by("token")
    if len(ob) == 0:
        return HttpResponse("<script>alert('not found');window.location='/view_patient#about'</script>")
    else:
        return render(request, 'doctor/view patient.html',{'val':ob,"d":date})

@login_required(login_url='/')
def view_she(request):
    ob = shedule_table.objects.filter(DOCTOR__LOGIN__id=request.session['lid'])
    return render(request, 'doctor/view she.html',{"val":ob})


@login_required(login_url='/')
def viewshe_search(request):
    d=request.POST['textfield']
    ob = shedule_table.objects.filter(DOCTOR__LOGIN__id=request.session['lid'],date=d)
    if len(ob) == 0:
        return HttpResponse("<script>alert('not found');window.location='/view_she#about'</script>")
    else:
        return render(request, 'doctor/view she.html', {"val": ob,"d":d})


@login_required(login_url='/')
def view_prescription_doc(request,id):
    request.session['bid']=id
    oj=booking_table.objects.get(id=id)
    x=oj.USER.id
    ob=prescription_table.objects.filter(BOOKING__USER=x)
    return render(request, 'doctor/view prescription_doc.html',{'val':ob})






           # ////////////////////////////////////////



# //////////////////////////////////////





@login_required(login_url='/')





@login_required(login_url='/')
def upload_priscrip(request):
    return render(request, 'doctor/upload priscrip.html')
@login_required(login_url='/')
def pres_code(request):
    obb=booking_table.objects.get(id=request.session['bid'])
    obb.bstatus="completed"
    obb.save()

    try:
        print(request.POST,"JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ")
        presc=request.FILES['fl']
        fs=FileSystemStorage()
        fn=fs.save(presc.name,presc)
        ob=prescription_table()
        ob.prescription=fn
        ob.type="f"
        ob.date=datetime.today()
        ob.BOOKING=booking_table.objects.get(id=request.session['bid'])
        ob.save()
        return HttpResponse("<script>alert('Added');window.location='/view_patient'</script>")

    except:
        print("DDDDDDDDDDDDDDDDDDDD")
        txt=request.POST['txt']
        ob = prescription_table()
        ob.prescription = txt
        ob.type = "t"
        ob.date = datetime.today()
        ob.BOOKING = booking_table.objects.get(id=request.session['bid'])
        ob.save()
        return HttpResponse("<script>alert('Added');window.location='/view_patient'</script>")


@login_required(login_url='/')
def view_feedback(request):
    return render(request, 'pharmacy/view feedback.html')


@login_required(login_url='/')
def view_feedback_doc(request):
    ob=feedback_table.objects.filter(DOCTOR__LOGIN__id=request.session['lid'])
    return render(request, 'doctor/view feedbackd.html',{"val":ob})
@login_required(login_url='/')
def view_docfeedback_search(request):
    dt=request.POST['textfield']
    ob=feedback_table.objects.filter(DOCTOR__LOGIN__id=request.session['lid'],date=dt)
    if len(ob) == 0:
        return HttpResponse("<script>alert('not found');window.location='/view_feedback_doc#about'</script>")
    else:
        return render(request, 'doctor/view feedbackd.html', {"val": ob})




# ////////////////////////////////////////////webservice///////////////////////////////////////////////////


from django.core import serializers
import json
from django.http import JsonResponse



def logincode(request):
     print(request.POST)
     un=request.POST['uname']
     pwd=request.POST['pass']
     print(un,pwd)
     try:
         users = login_table.objects.get(username=un,password=pwd)


         if users is None:
                data = {"task": "invalid"}
         else:
                print("in user function")
                data = {"task":"valid","id":users.id}
         r = json.dumps(data)
         print (r)
         return HttpResponse(r)
     except:
         data = {"task": "invalid"}
         r = json.dumps(data)
         print(r)
         return HttpResponse(r)


def registration(request):
    print(request.POST,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    Fname=request.POST['Fname']
    Lname=request.POST['Lname']
    place= request.POST['place']
    post_office = request.POST['post_office']
    pin_code = request.POST['pin_code']
    phone = request.POST['phone']
    gender = request.POST['gender']
    dob = request.POST['dob']
    email_id = request.POST['email_id']
    uname = request.POST['uname']
    passwd = request.POST['passwd']

    lob = login_table()
    lob.username = uname
    lob.password = passwd
    lob.type = 'user'
    lob.save()

    userob = user_table()
    userob.firstname = Fname
    userob.lastname = Lname
    userob.place = place
    userob.post = post_office
    userob.pin = pin_code
    userob.phone= phone
    userob.gender = gender
    userob.dob = dob
    userob.email = email_id
    userob.LOGIN=lob
    userob.save()


    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)




def  view_doc(request):
    dep=request.POST['dep']
    if dep == "all":
        ob = doctor_table.objects.all()
        data = []
        for i in ob:
            row = {"fname": i.firstname, "lname": i.lastname, "id": i.id, "gender": i.gender,
                   "specilization": i.specilization, "qualification": i.qualification, "phone": i.phone,
                   "photo": str(i.photo.url)}

            data.append(row)
        r = json.dumps(data)
        return HttpResponse(r)
    else:
        ob = doctor_table.objects.filter(specilization=dep)
        data = []
        for i in ob:
            row = {"fname": i.firstname, "lname": i.lastname, "id": i.id, "gender": i.gender,
                   "specilization": i.specilization, "qualification": i.qualification, "phone": i.phone,
                   "photo": str(i.photo.url)}

            data.append(row)
        r = json.dumps(data)
        return HttpResponse(r)

def  view_doc_search(request):
    dname=request.POST['dname']
    dep = request.POST['dep']
    if dep == "all":
        ob = doctor_table.objects.filter(firstname__istartswith=dname)
        data = []
        for i in ob:
            row = {"fname": i.firstname, "lname": i.lastname,"id":i.id, "gender": i.gender,"specilization": i.specilization,"qualification": i.qualification,"phone": i.phone,"photo":str(i.photo.url)}

            data.append(row)
        r = json.dumps(data)
        return HttpResponse(r)
    else:
        ob = doctor_table.objects.filter(firstname__istartswith=dname,specilization=dep)
        data = []
        for i in ob:
            row = {"fname": i.firstname, "lname": i.lastname, "id": i.id, "gender": i.gender,
                   "specilization": i.specilization, "qualification": i.qualification, "phone": i.phone,
                   "photo": str(i.photo.url)}

            data.append(row)
        r = json.dumps(data)
        return HttpResponse(r)



def  view_slot(request):
    print(request.POST,"KKKKKKKKKKKKKKKKKKK")
    did=request.POST['did']
    o=datetime.today()
    ob = shedule_table.objects.filter(DOCTOR__id=did,date__gte=o)
    data = []
    for i in ob:
        row = {"ftime":str(i.fromtime), "ttime": str(i.totime),"date":str(i.date),"id":i.id}

        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)





def  view_booking_details(request):
    bt=request.POST['bt']
    ob = shedule_table.objects.filter(DOCTOR__id=bt)
    data = []
    for i in ob:
        row = {"USER": i.USER,"date":str(i.date),"status": i.status}

        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)




def view_slot_status(request):
    print(request.POST,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    SHEDULE=request.POST['schid']
    ob=shedule_table.objects.get(id=SHEDULE)
    from datetime import datetime, timedelta
    tlist=[]

    date_str = '2023-02-28 '+str(ob.fromtime)
    date_str1 = '2023-02-28 '+str(ob.totime)
    date_format = '%Y-%m-%d  %H:%M'

    date_obj = datetime.strptime(date_str, date_format)
    date_obj1 = datetime.strptime(date_str1, date_format)

    now_plus_15 = date_obj + timedelta(minutes=15)
    while(now_plus_15<=date_obj1):
        ft=str(date_obj).split(" ")[1].split(":")
        if int(ft[0])<12:
            fts=ft[0]+":"+ft[1]+" AM"
        elif int(ft[0])==12:
            fts = ft[0] + ":" + ft[1] + " PM"
        else:
            fts=str(int(ft[0])-12)+":"+ft[1]+" PM"
        et=str(now_plus_15).split(" ")[1].split(":")

        if int(et[0])<12:
            ets=et[0]+":"+et[1]+" AM"
        elif int(et[0])==12:
            ets = et[0] + ":" + et[1] + " PM"
        else:
            ets=str(int(et[0])-12)+":"+et[1]+" PM"


        tlist.append(fts+" to "+ets)
        date_obj=now_plus_15
        now_plus_15 = date_obj + timedelta(minutes=15)
    print(tlist)

    data=[]
    for i in range(len(tlist)):
        r={"slot":tlist[i],"tno":i+1}
        obs=booking_table.objects.filter(SHEDULE__id=SHEDULE,sloat=tlist[i])
        if len(obs)>0:
            r['status']="b"
        else:
            r['status']="a"
        data.append(r)
    return JsonResponse(data,safe=False)





def Book_now(request):
    print(request.POST,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    SHEDULE=request.POST['shid']
    USER=request.POST['lid']
    DOC=request.POST['did']
    slot=request.POST['slot']
    tno=request.POST['tno']

    o=datetime.today()
    print(o,"DDDDDDDDDDDDDD")
    ox=booking_table.objects.filter(USER__LOGIN__id=USER,SHEDULE__DOCTOR__id= DOC ,date=o)
    print(ox)
    if len(ox)==0:

        lob = booking_table()
        lob.SHEDULE =shedule_table.objects.get(id=SHEDULE)
        lob.USER =user_table.objects.get(LOGIN__id=USER)
        lob.date = datetime.today()
        lob.status = 'pending'
        lob.bstatus = 'pending'
        lob.sloat = slot
        lob.token = tno

        lob.save()





        data = {"task": "success","bid":lob.id}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    else:
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)



def payment_doc(request):
    print(request.POST,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    bid=request.POST['bid']
    ob=booking_table.objects.get(id=bid)
    ob.status='payed'
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def payment_doc_delete(request):
    print(request.POST,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    bid=request.POST['bid']
    ob=booking_table.objects.get(id=bid)
    ob.status='payed'
    ob.delete()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def payment_ph(request):
    print(request.POST,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    bid=request.POST['bid']
    ob=bill_table.objects.get(id=bid)
    ob.Status='payed'
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)


def delete_booking(request):
    print(request.POST,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    bid=request.POST['bid']
    ob=booking_table.objects.get(id=bid)
    ob.delete()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)





def  view_booking_user_details(request):
    lid=request.POST['lid']
    ob = booking_table.objects.filter(USER__LOGIN__id=lid)
    data = []
    for i in ob:
        row = {"sloat": i.sloat,"token": i.token,"pstatus": i.bstatus,"docfname":i.SHEDULE.DOCTOR.firstname,"doclname":i.SHEDULE.DOCTOR.lastname,"id":i.id}

        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)


def view_prescription_user(request):
    bid=request.POST['bid']
    ob = prescription_table.objects.filter(BOOKING__id=bid)
    data = []
    for i in ob:
        row = {"prescription": str(i.prescription),"date":str(i.date),"type":i.type,"id":i.id}

        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def view_feedback_user(request):
    did=request.POST['did']
    ob = feedback_table.objects.filter(DOCTOR__id=did)
    data = []
    for i in ob:
        row = {"USER":i.USER.firstname+" "+i.USER.lastname,"feedback":i.feedback,"rating":i.rating,"date":str(i.date)}

        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def Send_user_feedback(request):
    print(request.POST,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    feedback=request.POST['feedback']
    rating=request.POST['rating']
    did=request.POST['did']
    lid=request.POST['lid']

    lob = feedback_table()
    lob.DOCTOR = doctor_table.objects.get(id=did)
    lob.USER = user_table.objects.get(LOGIN__id=lid)
    lob.feedback = feedback
    lob.rating = rating
    lob.date = datetime.today()
    lob.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)

def Send_user_complaint(request):
    print(request.POST,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    complaint=request.POST['complaint']
    lid=request.POST['lid']

    lob = complaint_table()
    lob.USER = user_table.objects.get(LOGIN__id=lid)
    lob.complaint = complaint
    lob.reply = 'pending'
    lob.date = datetime.today()
    lob.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)


def Send_req_for_ph(request):
    print(request.POST,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    PRESCRIPTION=request.POST['pid']

    lob = request_table()
    lob.PRESCRIPTION = prescription_table.objects.get(id=PRESCRIPTION)
    lob.PHARMACY =pharmacy_table.objects.get(id=1)
    lob.status = 'pending'
    lob.date = datetime.today()
    lob.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)



def view_complaint_user(request):
    lid=request.POST['lid']
    ob = complaint_table.objects.filter(USER__LOGIN__id=lid)
    data = []
    for i in ob:
        row = {"complaint":i.complaint,"reply":i.reply,"date":str(i.date)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)


def view_bill(request):
    lid=request.POST['lid']
    ob = bill_table.objects.filter(prescription__BOOKING__USER__LOGIN__id=lid)
    data = []
    for i in ob:
        row = {"prescription":str(i.prescription.prescription),"total":i.Total,"PHARMACY":i.PHARMACY.name,"id":i.id,"Status":i.Status}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def AV_symptoms(request):

    ob = symptom_table.objects.all()
    data = []
    data1=[]
    for i in ob:
        if i.symptom not in data1:
            r={"symptom":i.symptom}
            data1.append(i.symptom)
            data.append(r)

    return JsonResponse(data,safe=False)


def predictimg(request):
    f=request.FILES['file']
    fs=FileSystemStorage()
    fn=fs.save(f.name,f)
    res=predict(r"C:\Users\albin\PycharmProjects\clinic_management\media/"+fn)

    return JsonResponse({"img":"/media/"+fn,"res":res,"task":"success"})



def AV_symptoms1(request):
    sym = request.POST['sym']
    syms = sym.split("#")
    print("---", syms)
    symrow = []
    for i in syms:
        # r="'"+i+"'"
        if i != "":
            symrow.append(i)
    print(symrow)


    ob=symptom_table.objects.filter(symptom__in=symrow)
    dis_list=[]
    for i in ob:
        if i.disease.id not in dis_list:
            dis_list.append(i.disease.id)
    d_sym=[]
    ob=symptom_table.objects.filter(disease__id__in=dis_list)
    for i in ob:
        if i.symptom not in d_sym:
            d_sym.append(i.symptom)

    dataset=[]
    y=[]
    for i in dis_list:
        r=[]
        ob = symptom_table.objects.filter(disease__id=i)
        for ii in ob:
           r.append(ii.symptom)

        row=[]

        for j in d_sym:
            if j in r:
                row.append(1)
            else:
                row.append(0)
        dataset.append(row)
        y.append(i)
    row=[]
    for j in d_sym:
        if j in symrow:
            row.append(1)
        else:
            row.append(0)

    distributions = []
    i=0
    for features in dataset:


        euclidean_distance = np.linalg.norm(np.array(features) - np.array(row))

        distributions.append([euclidean_distance, y[i]])
        i=i+1
    k=1
    print(distributions,"****************************")
    results = [i[1] for i in sorted(distributions)[:k]]
    result = Counter(results).most_common(1)[0][0]

    print(result,"=====================")
    print(result,"=====================")
    print(result,"=====================")
    print(result,"=====================")
    i=disease_table.objects.get(id=result)
    # disease = models.CharField(max_length=100)
    # remedy = models.CharField(max_length=1000)
    # preventive_measure = models.CharField(max_length=1000)
    # department =
    r={"disease":i.disease,"remedy":i.remedy,"preventive_measure":i.preventive_measure,"department":i.department}
    return  JsonResponse(r)



