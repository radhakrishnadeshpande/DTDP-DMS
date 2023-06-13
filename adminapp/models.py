from django.db import models

# Create your models here.

class Faculty_Management(models.Model):
    Faculty_ID = models.AutoField(primary_key=True)
    F_ID = models.TextField(max_length=100)
    Full_Name = models.TextField(max_length=100)
    Email = models.EmailField()
    Department = models.TextField(max_length=100)
    Preferred_Subject = models.TextField(max_length=100)
    Profile = models.FileField(upload_to='Images')
    Status = models.TextField(default='pending',null=True)
    Faculty_Password = models.TextField(max_length=4)
    class Meta:
        db_table = 'faculty_management'


class Subject_Management(models.Model):
    Subject_ID = models.AutoField(primary_key=True)
    Subject_Name = models.TextField(max_length=100)
    Branch_Name = models.TextField(max_length=100)
    Semester = models.TextField(max_length=100)
    Faculty = models.TextField(max_length=50,null=True)
    Status = models.TextField(default='pending',null=True)
    Fac_Foregin = models.ForeignKey(Faculty_Management, on_delete = models.CASCADE, null = True)
    class Meta:
        db_table = 'subject_management'


class Student_Management(models.Model):
    Student_ID = models.AutoField(primary_key=True)
    Full_Name = models.TextField(max_length=100)
    Roll_No = models.TextField(max_length=100)
    Email = models.EmailField()
    Branch_Name = models.TextField(max_length=100)
    Semester = models.TextField(max_length=100)
    Address = models.TextField(max_length=100)
    Phone_No = models.TextField(max_length=10)
    Profile = models.FileField(upload_to='Images')
    Student_Password = models.TextField(max_length=4)
    Alumni = models.TextField(default='Not-Alumni', null=True)
    Status = models.TextField(default='pending',null=True)
    Subject = models.TextField(max_length=20, null=True)
    Marks = models.IntegerField(default=0, null=True)
    Marks_Assignment = models.TextField(max_length=50, null=True)
    Att_Date = models.DateField(null = True)
    Grade = models.IntegerField(default=0, null=True)

    class Meta:
        db_table = 'student_management'


class Marks_Management(models.Model):
    Marks_ID = models.AutoField(primary_key=True)
    Student_Branch = models.TextField(max_length=100, null=True)
    Student_Semester = models.TextField(max_length=100, null=True)
    Student_Subject = models.TextField(max_length=100, null=True)
    # Student_Profile = models.FileField(upload_to='Images')
    Student_Name = models.TextField(max_length=100)
    Student_Roll_No = models.TextField(max_length=100)
    Add_Marks = models.IntegerField(default=0, null=True)
    Stu_Foregin = models.ForeignKey(Student_Management, on_delete = models.CASCADE, null = True) 

    class Meta:
        db_table = 'marks_management'

class Grade_Management(models.Model):
    Grade_ID = models.AutoField(primary_key=True)
    Student_Branch = models.TextField(max_length=100, null=True)
    Student_Semester = models.TextField(max_length=100, null=True)
    # Student_Subject = models.TextField(max_length=100, null=True)
    # Student_Profile = models.FileField(upload_to='Images')
    Student_Name = models.TextField(max_length=100)
    Student_Roll_No = models.TextField(max_length=100)
    Add_Marks = models.FloatField(default=0.0, null=True)
    Stu_Foregin = models.ForeignKey(Student_Management, on_delete = models.CASCADE, null = True) 

    class Meta:
        db_table = 'grade_management'

class Library_Management(models.Model):
    Library_ID = models.AutoField(primary_key=True)
    Title = models.TextField(max_length=100)
    Author_Name = models.TextField(max_length=100)
    Publisher_Name = models.TextField(max_length=100)
    Preferred_Name = models.TextField(max_length=100)
    class Meta:
        db_table = 'library_management'


class Learning_Management(models.Model):
    Learning_ID = models.AutoField(primary_key=True)
    Course_Name = models.TextField(max_length=100, null=True)
    Price = models.TextField(max_length=100, null=True)
    Photo = models.FileField(upload_to='Images',null=True)
    Description = models.TextField(max_length=100, null=True)

    class Meta:
        db_table = 'learning_management'


class Alumni_Management(models.Model):
    Alumni_ID = models.AutoField(primary_key=True)
    Student_Name = models.TextField(max_length=100,null=True)
    Student_Profile = models.FileField(upload_to='Images',null=True)
    Student_Roll_No = models.TextField(max_length=100,null=True)
    Student_Branch = models.TextField(max_length=100,null=True)

    class Meta:
        db_table = 'alumni_management'


class Thesis_Management(models.Model):
    Thesis_ID = models.AutoField(primary_key=True)
    Thesis_Name = models.TextField(max_length=100,null=True)
    Thesis_File = models.FileField(upload_to='Images',null=True)

    class Meta:
        db_table = 'thesis_management'

class Course_Buy_Model(models.Model):
    Buy_ID = models.AutoField(primary_key=True)
    Student_Name = models.TextField(max_length=40)
    Stundent_Roll_num = models.TextField(max_length=40)
    Student_Branch = models.TextField(max_length=40)
    CourseName = models.TextField(max_length=400 , null = True)
    Price = models.TextField(max_length=400 , null = True)
    Description = models.TextField(max_length=800 , null = True)

    class Meta:
        db_table = 'buy_course'