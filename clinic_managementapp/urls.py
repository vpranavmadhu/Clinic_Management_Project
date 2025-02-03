from django.urls import path

from clinic_managementapp import views

urlpatterns = [
    path('',views.login,name="login"),
    path('loginpost',views.loginpost,name="loginpost"),

    path('add_doc',views.add_doc,name="add_doc"),
    path('edit_doc_post',views.edit_doc_post,name="edit_doc_post"),
    path('edit_doc/<int:id>',views.edit_doc,name="edit_doc"),
    path('dlt_doc/<int:id>',views.dlt_doc,name="dlt_doc"),
    path('editreply/<int:id>',views.editreply,name="editreply"),
    path('editreply_code',views.editreply_code,name="editreply_code"),
    path('add_shedule',views.add_shedule,name="add_shedule"),
    path('adminhome',views.adminhome,name="adminhome"),
    path('booking_details',views.booking_details,name="booking_details"),
    path('feedback_ad',views.feedback_ad,name="feedback_ad"),
    path('manage_doctor',views.manage_doctor,name="manage_doctor"),
    path('manage_shedulead',views.manage_shedulead,name="manage_shedulead"),
    path('reply_send/<int:id>',views.reply_send,name="reply_send"),
    path('reply_code',views.reply_code,name="reply_code"),
    path('view_comp_and_reply',views.view_comp_and_reply,name="view_comp_and_reply"),
    path('view_patientad',views.view_patientad, name="view_patientad"),
    path('view_shedule/<int:id>',views.view_shedule, name="view_shedule"),
    path('delete_sche/<int:id>',views.delete_sche, name="delete_sche"),
    path('booking_details_doc',views.booking_details_doc, name="booking_details_doc"),
    path('insert_schedule',views.insert_schedule, name="insert_schedule"),
    path('doc_home', views.doc_home, name="doc_home"),
    path('viewshe_search', views.viewshe_search, name="viewshe_search"),
    path('view_patient', views.view_patient, name="view_patient"),
    path('view_she', views.view_she, name="view_she"),
    path('doc_search', views.doc_search, name="doc_search"),

    path('upload_priscrip', views.upload_priscrip, name="upload_priscrip"),
    path('view_feedback', views.view_feedback, name="view_feedback"),
    # path('view_prescription', views.view_prescription, name="view_prescription"),
    path('add_doc_post', views.add_doc_post, name="add_doc_post"),
    path('booking_search', views.booking_search, name="booking_search"),
    path('com_search', views.com_search, name="com_search"),
    path('feedback_search', views.feedback_search, name="feedback_search"),
    path('view_feedback_doc', views.view_feedback_doc, name="view_feedback_doc"),
    path('view_docfeedback_search', views.view_docfeedback_search, name="view_docfeedback_search"),
    path('view_patient_search', views.view_patient_search, name="view_patient_search"),
    path('pres_code', views.pres_code, name="pres_code"),
    path('view_prescription_doc/<int:id>', views.view_prescription_doc, name="view_prescription_doc"),

    # path('edited_med', views.edited_med, name="edited_med"),
    path('logout', views.logout, name="logout"),
    path('forgotpass', views.forgotpass, name="forgotpass"),
    path('forgotpassword1', views.forgotpassword1, name="forgotpassword1"),








    path('logincode', views.logincode, name="logincode"),
    path('view_bill', views.view_bill, name="view_bill"),
    path('registration', views.registration, name="registration"),
    path('view_doc', views.view_doc, name="view_doc"),
    path('view_doc_search', views.view_doc_search, name="view_doc_search"),
    path('view_slot', views.view_slot, name="view_slot"),
    path('Book_now', views.Book_now, name="Book_now"),
    path('view_slot_status', views.view_slot_status, name="view_slot_status"),
    path('view_booking_user_details', views.view_booking_user_details, name="view_booking_user_details"),

    path('Send_user_feedback', views.Send_user_feedback, name="Send_user_feedback"),
    path('view_feedback_user', views.view_feedback_user, name="view_feedback_user"),
    path('Send_user_complaint', views.Send_user_complaint, name="Send_user_complaint"),
    path('view_complaint_user', views.view_complaint_user, name="view_complaint_user"),
    path('Send_req_for_ph', views.Send_req_for_ph, name="Send_req_for_ph"),
    path('payment_doc', views.payment_doc, name="payment_doc"),
    path('payment_ph', views.payment_ph, name="payment_ph"),
    path('payment_doc_delete', views.payment_doc_delete, name="payment_doc_delete"),
    path('delete_booking', views.delete_booking, name="delete_booking"),
    path('AV_symptoms', views.AV_symptoms, name="AV_symptoms"),
    path('AV_symptoms1', views.AV_symptoms1, name="AV_symptoms1"),
    path('predictimg', views.predictimg, name="predictimg"),


]
