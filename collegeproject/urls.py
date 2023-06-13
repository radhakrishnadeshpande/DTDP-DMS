"""
URL configuration for collegeproject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views as main_views
from adminapp import views as admin_views
from facultyapp import views as faculty_views
from studentapp import views as student_views

from django.conf.urls.static import static
from django.conf import settings

#main_views
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',main_views.home,name='home'),
    path('student_login', main_views.student_login, name="student_login"),
    path('faculty_login', main_views.faculty_login, name="faculty_login"),
    path('admin_login', main_views.admin_login, name="admin_login"),
    path('about',main_views.about,name='about'),
    path('gallery',main_views.gallery,name='gallery'),
    path('instructor',main_views.instructor,name='instructor'),


    path('contact',main_views.contact,name='contact'),

#admin_views
    path('admin_dashboard',admin_views.admin_dashboard,name='admin_dashboard'),
    path('add_faculty',admin_views.add_faculty,name='add_faculty'),
    path('manage_faculty',admin_views.manage_faculty,name='manage_faculty'),
    path('add_subject',admin_views.add_subject,name='add_subject'),
    path('manage_subject',admin_views.manage_subject,name='manage_subject'),
    path('assign_sub_faculty',admin_views.assign_sub_faculty,name='assign_sub_faculty'),
    # path('assign_sub_faculty/<int:id>/',admin_views.assign_sub_faculty,name='assign_sub_faculty'),

    path('add_students',admin_views.add_students,name='add_students'),
    path('manage_student',admin_views.manage_student,name='manage_student'),
    path('admin_view_attendance',admin_views.admin_view_attendance,name='admin_view_attendance'),
    path('add_sem_marks',admin_views.add_sem_marks,name='add_sem_marks'),
    path('admin_view_marks',admin_views.admin_view_marks,name='admin_view_marks'),
    path('add_resources',admin_views.add_resources,name='add_resources'),
    path('manage_resources',admin_views.manage_resourses,name='manage_resources'),
    path('add_courses',admin_views.add_courses,name='add_courses'),
    path('manage_course',admin_views.manage_course,name='manage_course'),
    path('admin_add_alumni',admin_views.admin_add_alumni,name='admin_add_alumni'),
    path('manage_alumni',admin_views.manage_alumni,name='manage_alumni'),
    path('upload_thesis',admin_views.upload_thesis,name='upload_thesis'),
    path('manage_thesis',admin_views.manage_thesis,name='manage_thesis'),
    path('edit_course/<int:id>',admin_views.edit_course,name='edit_course'),
    path('edit_student/<int:id>',admin_views.edit_student,name='edit_student'),
    path('add_alumni_btn/<int:id>',admin_views.add_alumni_btn,name='add_alumni_btn'),

    # path('add_marks',admin_views.add_marks,name='add_marks'),
    path('faculty_change_status/<int:id>',admin_views.faculty_change_status,name='faculty_change_status'),
    path('faculty_Delete/<int:id>',admin_views.faculty_Delete,name='faculty_Delete'),
    path('delete_subject/<int:id>',admin_views.delete_subject,name='delete_subject'),
    path('assign_subject/<int:id>',admin_views.assign_subject,name='assign_subject'),
    path('stud_status/<int:id>',admin_views.stud_status,name='stud_status'),
    path('delete_student/<int:id>',admin_views.delete_student,name='delete_student'),
    path('delete_thesis/<int:id>',admin_views.delete_thesis,name='delete_thesis'),
    path('delete_course/<int:id>',admin_views.delete_course,name='delete_course'),
    path('delete_resourse/<int:id>',admin_views.delete_resourse,name='delete_resourse'),
    path('delete_alumni/<int:id>',admin_views.delete_alumni,name='delete_alumni'),
    path('admin_logout',admin_views.admin_logout,name='admin_logout'),
    path('grade_marks',admin_views.grade_marks,name='grade_marks'),

#faculty_views

    path('faculty_dashboard',faculty_views.faculty_dashboard,name='faculty_dashboard'),
    path('faculty_add_attendance',faculty_views.faculty_add_attendance,name='faculty_add_attendance'),
    path('faculty_view_attendance',faculty_views.faculty_view_attendance,name='faculty_view_attendance'),
    path('faculty_add_marks',faculty_views.faculty_add_marks,name='faculty_add_marks'),
    path('faculty_view_marks',faculty_views.faculty_view_marks,name='faculty_view_marks'),
    # path('present_btn/<int:id>',faculty_views.present_btn,name='present_btn'),
    # path('absent_btn/<int:id>',faculty_views.absent_btn,name='absent_btn'),
    path('faculty_logout',faculty_views.faculty_logout,name='faculty_logout'),
    path('mark_attendance',faculty_views.mark_attendance,name='mark_attendance'),
    path('mark_add',faculty_views.mark_add,name='mark_add'),

#student_views
    
    path('student_dashboard',student_views.student_dashboard,name='student_dashboard'),
    path('student_attendance_details',student_views.student_attendance_details,name='student_attendance_details'),
    path('student_marks_details',student_views.student_marks_details,name='student_marks_details'),
    path('student_view_results',student_views.student_view_results,name='student_view_results'),
    path('student_view_book',student_views.student_view_book,name='student_view_book'),
    path('student_view_courses',student_views.student_view_courses,name='student_view_courses'),
    path('student_my_courses',student_views.student_my_courses,name='student_my_courses'),
    path('student_alumni_details',student_views.student_alumni_details,name='student_alumni_details'),
    path('student_view_thesis',student_views.student_view_thesis,name='student_view_thesis'),
    path('add_course_btn/<int:id>',student_views.add_course_btn,name='add_course_btn'),
    path('stud_logout',student_views.stud_logout,name='stud_logout'),
    


]+ static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)