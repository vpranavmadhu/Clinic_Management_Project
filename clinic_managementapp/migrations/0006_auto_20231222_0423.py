# Generated by Django 3.2.23 on 2023-12-21 22:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clinic_managementapp', '0005_prescription_table_type'),
    ]

    operations = [
        migrations.AddField(
            model_name='disease_table',
            name='preventive_measure',
            field=models.CharField(default=1, max_length=1000),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='disease_table',
            name='remedy',
            field=models.CharField(max_length=1000),
        ),
    ]
