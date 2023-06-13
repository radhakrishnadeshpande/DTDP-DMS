from django.shortcuts import render,redirect
from adminapp.models import *
import string,random
from django.contrib import messages
from facultyapp.models import *

from collegeproject.settings import EMAIL_HOST_USER
from django.core.mail import EmailMultiAlternatives
# Create your views here.

def admin_dashboard(request):
    a = Learning_Management.objects.all().count()
    b = Library_Management.objects.all().count()
    c = Alumni_Management.objects.all().count()
    return render(request,'admin_template/index.html',{'cou' :a, 'lib':b, 'alu':c})

def add_faculty(request):
    guide_char = string.ascii_letters + string.digits
    if request.method == "POST":
        faculty_id = request.POST.get('faculty_id')
        faculty_fname = request.POST.get('faculty_fname')
        faculty_email = request.POST.get('faculty_email')
        faculty_department = request.POST.get('faculty_department')
        faculty_preff_sub = request.POST.get('faculty_preff_sub')
        faculty_profile = request.FILES['faculty_profile']
        faculty_pswd = ''.join(random.choices(guide_char, k=4))
        Faculty_Management.objects.create(F_ID = faculty_id, Full_Name = faculty_fname, Email = faculty_email, Department = faculty_department, Preferred_Subject = faculty_preff_sub, Profile = faculty_profile, Faculty_Password = faculty_pswd)
          # Sending booking details to admin email
        html_content = "<p>Dear Faculty, Your Password is: " + faculty_pswd+"</p>."
        from_mail = EMAIL_HOST_USER
        to_mail = [faculty_email]
        msg = EmailMultiAlternatives("DTDP", html_content, from_mail, to_mail)
        msg.attach_alternative(html_content, "text/html")
        msg.send()
        return redirect('add_faculty')
    return render(request,'admin_template/admin-add-faculty.html')

def manage_faculty(request):
    mang_faculty = Faculty_Management.objects.all()
    return render(request,'admin_template/admin-manage-faculty.html',{'mg':mang_faculty})

def faculty_change_status(request,id):
    variable_status = Faculty_Management.objects.get(Faculty_ID=id)
    if(variable_status.Status == 'pending'):
        variable_status.Status = 'accepted'
        variable_status.save()
    elif(variable_status.Status == 'accepted'):
        variable_status.Status = 'rejected'
        variable_status.save()
    elif(variable_status.Status == 'rejected'):
        variable_status.Status = 'accepted'
        variable_status.save()
    else:
        variable_status.Status = 'accepted'
        variable_status.save()
    return redirect('manage_faculty')

def faculty_Delete(req,id):
    delete111 = Faculty_Management.objects.get(Faculty_ID=id)
    delete111.delete()
    return redirect('manage_faculty')


def add_subject(request):
    fac = Faculty_Management.objects.all()
    if request.method == "POST":
        sub_name = request.POST.get('sub_name')
        sub_branch = request.POST.get('sub_branch')
        sub_semester = request.POST.get('sub_semester')
        facc = request.POST.get('faculty')
        Subject_Management.objects.create(Subject_Name = sub_name, Branch_Name = sub_branch, Semester = sub_semester, Faculty = facc)
        return render(request,'admin_template/admin-add-subject.html', {'fac':fac})
    return render(request,'admin_template/admin-add-subject.html', {'fac':fac})

def manage_subject(request):
    mg_sub = Subject_Management.objects.all()
    return render(request,'admin_template/admin-manage-subject.html',{'mg_s':mg_sub})

def delete_subject(request,id):
    del_sub = Subject_Management.objects.get(Subject_ID=id)
    del_sub.delete()
    return redirect('manage_subject')

def assign_sub_faculty(request):
    asssign_sub = Subject_Management.objects.all()
    facultys = Faculty_Management.objects.all()
    # variable_status = Subject_Management.objects.get(Subject_ID=id)

    if request.method == 'POST':
        fac_name = request.POST.get('facname')
        print(fac_name, "'faculty name'")
        fac = Faculty_Management.objects.get(Full_Name = fac_name)
        Subject_Management(Faculty = fac.Full_Name, Fac_Foregin = fac.F_ID)
    return render(request,'admin_template/admin-assign-subject-to-faculty.html',{'assign':asssign_sub, 'fac' : facultys})

def assign_subject(request,id):
    9963085550
    
    return redirect('assign_sub_faculty')


    # print(variable_status.Faculty,"llll")
    # if request.method == 'POST':
    #         stu_name = request.POST.get('assigned_value')
    #         print(stu_name,"identifier")
    
    # return redirect(request,'admin_template/admin-assign-subject-to-faculty.html')


def add_students(request):
    guide_char = string.ascii_letters + string.digits
    if request.method == "POST":
        stu_name = request.POST.get('stu_fname')
        stu_roll_no = request.POST.get('stu_roll_no')
        stu_email = request.POST.get('stu_email')
        stu_branch = request.POST.get('stu_branch')
        stu_semester = request.POST.get('stu_semester')
        stu_address = request.POST.get('stu_address')
        stu_phone = request.POST.get('stu_phone')
        stu_profile = request.FILES['stu_profile']
        stu_pswd = ''.join(random.choices(guide_char, k=4))
        Student_Management.objects.create(Full_Name = stu_name, Roll_No = stu_roll_no, Email = stu_email, Branch_Name = stu_branch, Semester = stu_semester, Address = stu_address, Phone_No = stu_phone, Profile = stu_profile, Student_Password = stu_pswd)
         # Sending booking details to admin email
        html_content = "<p>Dear Student, Your Password is: " + stu_pswd+"</p>."
        from_mail = EMAIL_HOST_USER
        to_mail = [stu_email]
        msg = EmailMultiAlternatives("DTDP", html_content, from_mail, to_mail)
        msg.attach_alternative(html_content, "text/html")
        msg.send()
    return render(request,'admin_template/admin-add-student.html')

def stud_status(request,id):
    variable_status = Student_Management.objects.get(Student_ID=id)
    if(variable_status.Status == 'pending'):
        variable_status.Status = 'accepted'
        variable_status.save()
    elif(variable_status.Status == 'accepted'):
        variable_status.Status = 'rejected'
        variable_status.save()
    elif(variable_status.Status == 'rejected'):
        variable_status.Status = 'accepted'
        variable_status.save()
    else:
        variable_status.Status = 'accepted'
        variable_status.save()
    return redirect('manage_student')

def delete_student(request,id):
    del_sub = Student_Management.objects.get(Student_ID=id)
    del_sub.delete()
    return redirect('manage_student')
    

def manage_student(request):
    manage_stu = Student_Management.objects.all()
    return render(request,'admin_template/admin-manage-student.html',{'mg_std':manage_stu})

def add_resources(request):
    if request.method == "POST":
        res_title = request.POST.get('res_title')
        res_author = request.POST.get('res_author')
        res_publisher = request.POST.get('res_publisher')
        res_preferred = request.POST.get('res_preferred')
        Library_Management.objects.create(Title = res_title, Author_Name = res_author, Publisher_Name = res_publisher, Preferred_Name = res_preferred)
    return render(request,'admin_template/admin-add-resources.html')

def manage_resourses(request):
    manage_res = Library_Management.objects.all()
    return render(request,'admin_template/admin-manage-resources.html',{'mg_res':manage_res})

def delete_resourse(request,id):
    del_sub = Library_Management.objects.get(Library_ID=id)
    del_sub.delete()
    return redirect('manage_resources')

def add_courses(request):
    if request.method == "POST":
        course = request.POST.get('course')
        price = request.POST.get('price')
        photo = request.FILES['photo']
        textarea = request.POST.get('textarea')
        Learning_Management.objects.create(Course_Name = course, Price = price, Photo = photo, Description = textarea)
    return render(request,'admin_template/admin-add-new-courses.html')

def manage_course(request):
    mg_course = Learning_Management.objects.all()
    return render(request,'admin_template/admin-manage-courses.html',{'mg_course':mg_course})

def delete_course(request,id):
    del_sub = Learning_Management.objects.get(Learning_ID=id)
    del_sub.delete()
    return redirect('manage_course')

def edit_course(request,id):
    edit_course = Learning_Management.objects.get(Learning_ID = id)
    print(edit_course.Course_Name)
    if request.method == 'POST':
        course_name = request.POST.get('course_name')
        course_price = request.POST.get('course_price')
        # course_photo = request.POST.get('course_photo')
        course_desp = request.POST.get('course_desp')
        # stu_profile = request.FILES['edit_profile']

        if len(request.FILES) != 0:
            stu_pic = request.FILES['course_photo']
            edit_course.Course_Name = course_name
            edit_course.Price =course_price
            edit_course.Description =course_desp
            edit_course.Photo =stu_pic
            edit_course.save()
        else:
            edit_course.Course_Name = course_name
            edit_course.Price =course_price
            edit_course.Description =course_desp
            # edit_course.Profile =stu_profile
            edit_course.save()
        return redirect('edit_course', id=id)
    return render(request,'admin_template/admin-course-edit.html', {'stu':edit_course})


def add_sem_marks(request):
    if request.method == "POST":
        branch = request.POST.get('branch')
        semester = request.POST.get('semester')
        subject_name = request.POST.get('subject')
        print(semester, 'djufd', branch, "jygfdb")
        a = Student_Management.objects.filter(Branch_Name = branch, Semester = semester)
        for i in a:
            i.Grade = 1
            i.save()
        return render(request,'admin_template/admin-add-semester-marks.html', {'stu_details' : a})
    return render(request,'admin_template/admin-add-semester-marks.html')    

def grade_marks(req):
    students = Student_Management.objects.filter(Grade__gte = 1)
    if req.method == 'POST':
        for student in students:
            marks_status = req.POST.get(str(student.Student_ID))
            print(type(marks_status))
            print(marks_status,'jjijjj')
            marks_status = float(marks_status)
            grad = Grade_Management(Student_Branch = student.Branch_Name, Student_Semester = student.Semester, Student_Name = student.Full_Name, Student_Roll_No = student.Roll_No, Add_Marks = marks_status,Stu_Foregin=student)
            grad.save()
            student.Grade = 0
            student.save()
        return redirect('add_sem_marks')
    return render(req, 'admin_template/admin-add-semester-marks.html')

def admin_view_marks(request):
    if request.method == "POST":
        branch = request.POST.get('branch')
        semester = request.POST.get('semester')
        subjects = request.POST.get('subject')
        view_marks = Grade_Management.objects.filter(Student_Branch = branch, Student_Semester = semester)
        return render(request,'admin_template/admin-view-marks-details.html',{'v_marks':view_marks, 'sub': subjects})
    return render(request,'admin_template/admin-view-marks-details.html')

def edit_student(request,id):
    edit_stud = Student_Management.objects.get(Student_ID = id)
    print(edit_stud.Full_Name)
    if request.method == 'POST':
        stu_name = request.POST.get('edit_fname')
        # stu_roll_no = request.POST.get('edit_roll_no')
        # stu_email = request.POST.get('edit_email')
        stu_branch = request.POST.get('edit_branch')
        stu_semester = request.POST.get('edit_semester')
        stu_address = request.POST.get('edit_address')
        stu_phone = request.POST.get('edit_phone_no')
        # stu_profile = request.FILES['edit_profile']

        if len(request.FILES) != 0:
            stu_pic = request.FILES['edit_profile']
            edit_stud.Full_Name = stu_name
            # edit_stud.Roll_No = stu_roll_no
#             edit_stud.Email = stu_email
            edit_stud.Branch_Name =stu_branch
            edit_stud.Semester =stu_semester
            edit_stud.Address =stu_address
            edit_stud.Phone_No =stu_phone
            edit_stud.Profile =stu_pic
            edit_stud.save()
        else:
            edit_stud.Full_Name = stu_name
            # edit_stud.Roll_No = stu_roll_no
#             edit_stud.Email = stu_email
            edit_stud.Branch_Name =stu_branch
            edit_stud.Semester =stu_semester
            edit_stud.Address =stu_address
            edit_stud.Phone_No =stu_phone
            # edit_stud.Profile =stu_profile
            edit_stud.save()
        return redirect('edit_student', id=id)
    return render(request,'admin_template/admin-edit-student.html', {'stu':edit_stud})

def admin_add_alumni(request):
    add_alumni = Student_Management.objects.filter(Semester = 'semester-8', Alumni = 'Not-Alumni')
    return render(request,'admin_template/admin-add-alumni-details.html',{'alumni':add_alumni})

def add_alumni_btn(req, id):
    stu_details = Student_Management.objects.get(Student_ID = id)
    stu_details.Alumni = 'Alumni'
    xx = Alumni_Management(Student_Name = stu_details.Full_Name, Student_Roll_No = stu_details.Roll_No, Student_Branch = stu_details.Branch_Name)
    xx.save()
    stu_details.save()

    return redirect("admin_add_alumni")

def manage_alumni(request):
    stu_details = Student_Management.objects.filter(Alumni = 'Alumni')
    return render(request,'admin_template/admin-manage-alumni-details.html',{'add':stu_details})

def delete_alumni(request,id):
    del_sub = Student_Management.objects.get(Student_ID = id)
    del_sub.Alumni = 'Not-Alumni'
    del_sub.save()
    return redirect('manage_alumni')

def admin_view_attendance(request):
    subj = Subject_Management.objects.all()
    if request.method == "POST":
        branch = request.POST.get('branch')
        semester = request.POST.get('semester')
        subjects = request.POST.get('subject')
        attendance = Attendence_Management.objects.filter(Stu_Branch = branch, Stu_Sem = semester, Att_Subject = subjects)
        return render(request,'admin_template/admin-view-attendance-details.html',{'attd':attendance, 'sub':subj})
    return render(request,'admin_template/admin-view-attendance-details.html', {'sub':subj})


def upload_thesis(request):
    if request.method == "POST":
        thesis_name = request.POST.get('thesis_name')
        thesis_file = request.FILES['thesis_file']
        Thesis_Management.objects.create(Thesis_Name = thesis_name, Thesis_File = thesis_file)
        return redirect('upload_thesis')
    return render(request,'admin_template/admin-upload-thesis-details.html')

def manage_thesis(request):
    mg_thesis = Thesis_Management.objects.all()
    return render(request,'admin_template/admin-manage-thesis-details.html',{'mg_t':mg_thesis})

def delete_thesis(request,id):
    del_sub = Thesis_Management.objects.get(Thesis_ID=id)
    del_sub.delete()
    return redirect('manage_thesis')

def admin_logout(req):
    messages.info(req,"Logged Out")
    return redirect('admin_login')