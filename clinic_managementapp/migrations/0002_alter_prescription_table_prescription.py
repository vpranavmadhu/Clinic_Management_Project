# Generated by Django 3.2.23 on 2023-12-17 22:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clinic_managementapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='prescription_table',
            name='prescription',
            field=models.CharField(max_length=5000),
        ),
    ]
