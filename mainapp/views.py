from django.shortcuts import render,redirect
from adminapp.models import *
from django.contrib import messages

# Create your views here.

def home(request):
    return render(request,'main_template/main-home.html')

def student_login(request):
    if request.method == "POST":
        email = request.POST.get('stu_email')
        stud_password = request.POST.get('stu_pwd')
        try:
            stud = Student_Management.objects.get(Email = email, Student_Password = stud_password)
            messages.success(request,"Login Successfully")
            request.session['Student_ID'] = stud.Student_ID
            return redirect('student_dashboard')
        except:
            messages.error(request,"Invalid Credentials")
            return redirect('student_login')
    return render(request, 'main_template/student-login.html')

def admin_login(request):
    admin_name = 'admin'
    admin_pswd = 'admin'
    if request.method == "POST":
        adm_name = request.POST.get('admin-id')
        adm_pswd = request.POST.get('admin-pwd')
        if admin_name == adm_name and admin_pswd == adm_pswd:
            messages.success(request,"Login Successful")
            return redirect('admin_dashboard')
        else:
            messages.error(request,"Invalid Credentials")
            return redirect('admin_login')
    return render(request, 'main_template/admin-login.html')

def faculty_login(request):
    if request.method == "POST":
        faculty_id = request.POST.get('faculty_id')
        faculty_password = request.POST.get('facaulty_pwd')
        try:
           Faculty_Management.objects.get(F_ID = faculty_id, Faculty_Password = faculty_password)
           messages.success(request,"Login Successfully")
           return redirect('faculty_dashboard') 
        except:
            messages.error(request,"Invalid Credentials")
            return redirect('faculty_login')
    return render(request, 'main_template/faculty-login.html')

def about(request):
    return render(request, 'main_template/main-about.html')

def contact(request):
    return render(request, 'main_template/main-contact.html')
def instructor(request):
    return render(request, 'main_template/main-instructor.html')
def gallery(request):
    return render(request, 'main_template/main-gallery.html')