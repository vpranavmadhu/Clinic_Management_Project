# Generated by Django 3.2.23 on 2023-12-20 16:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clinic_managementapp', '0003_auto_20231218_2310'),
    ]

    operations = [
        migrations.AddField(
            model_name='booking_table',
            name='bstatus',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='booking_table',
            name='sloat',
            field=models.CharField(default=1, max_length=50),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='booking_table',
            name='token',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
    ]
