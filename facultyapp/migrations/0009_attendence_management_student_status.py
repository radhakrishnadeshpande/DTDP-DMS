# Generated by Django 4.2 on 2023-06-01 06:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facultyapp', '0008_alter_attendence_management_att_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='attendence_management',
            name='Student_Status',
            field=models.TextField(default='absent', null=True),
        ),
    ]
