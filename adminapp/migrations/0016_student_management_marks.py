# Generated by Django 4.2.1 on 2023-05-31 12:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0015_marks_management_stu_foregin'),
    ]

    operations = [
        migrations.AddField(
            model_name='student_management',
            name='Marks',
            field=models.IntegerField(default=0, null=True),
        ),
    ]
