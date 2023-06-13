from django.shortcuts import render,redirect
from adminapp.models import *
from django.contrib import messages
from facultyapp.models import *
# Create your views here.

def student_dashboard(request):
    a = Learning_Management.objects.all().count()
    b = Library_Management.objects.all().count()
    c = Thesis_Management.objects.all().count()
    return render(request,'student_template/index.html', {'cou' :a, 'lib':b, 'the':c})


def student_alumni_details(request):
    al = Alumni_Management.objects.all()
    return render(request,'student_template/student-view-alumni-details.html', {'alum' : al})

def student_attendance_details(request):
    st = request.session['Student_ID']
    stu = Student_Management.objects.get(Student_ID = st)
    subj = Subject_Management.objects.all()
    if request.method == "POST":
        sem = request.POST.get("semester")
        sub = request.POST.get("subject")
        a = Attendence_Management.objects.filter(Att_Subject = sub, Stu_Sem = sem, Student_Roll = stu.Roll_No)
        return render(request,'student_template/student-view-attendance-details.html', {'atten' : a, 'subs' : subj})
    return render(request,'student_template/student-view-attendance-details.html',{ 'subs' : subj})

def student_view_book(request):
    stud_books = Library_Management.objects.all()
    return render(request,'student_template/student-view-books.html',{'stud_b':stud_books})

def student_view_courses(request):
    stud_course = Learning_Management.objects.all()
    return render(request,'student_template/student-view-courses.html',{'stud_c':stud_course})

def student_my_courses(request):
    st = request.session['Student_ID']
    stu = Student_Management.objects.get(Student_ID = st)
    my_courses = Course_Buy_Model.objects.filter(Stundent_Roll_num = stu.Roll_No)
    return render(request,'student_template/student-my-courses.html', {'mycourse' : my_courses})

def add_course_btn(req, id):
    st = req.session['Student_ID']
    stu = Student_Management.objects.get(Student_ID = st)
    cou_details = Learning_Management.objects.get(Learning_ID = id)
    buy = Course_Buy_Model(Stundent_Roll_num = stu.Roll_No, CourseName = cou_details.Course_Name, Price = cou_details.Price, Description = cou_details.Description)
    buy.save()
    return redirect("student_view_courses")


def student_marks_details(request):
    if request.method == 'POST':
        sem = request.POST.get("name")
        # print(sem)
        st = request.session['Student_ID']
        stu = Student_Management.objects.get(Student_ID = st)
        a = Marks_Management.objects.filter(Student_Roll_No = stu.Roll_No, Student_Semester = sem)
        return render(request,'student_template/student-view-marks-details.html', {'stde':a})
    return render(request,'student_template/student-view-marks-details.html')

def student_view_results(request):
    st = request.session['Student_ID']
    stu = Student_Management.objects.get(Student_ID = st)
    a = Grade_Management.objects.filter(Student_Roll_No = stu.Roll_No)
    return render(request,'student_template/student-view-results.html', {'stu':a})

def student_view_thesis(request):
    stud_thesis = Thesis_Management.objects.all()
    return render(request,'student_template/student-view-thesis.html',{'stud_the':stud_thesis})

def stud_logout(req):
    messages.info(req,"Logged Out")
    return redirect('student_login')