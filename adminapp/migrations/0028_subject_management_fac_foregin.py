# Generated by Django 4.2 on 2023-06-01 12:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0027_alter_student_management_grade'),
    ]

    operations = [
        migrations.AddField(
            model_name='subject_management',
            name='Fac_Foregin',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='adminapp.faculty_management'),
        ),
    ]
