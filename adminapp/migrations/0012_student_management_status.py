# Generated by Django 4.2.1 on 2023-05-27 08:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0011_subject_management_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='student_management',
            name='Status',
            field=models.TextField(default='pending', null=True),
        ),
    ]