# Generated by Django 3.2.23 on 2023-12-20 18:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clinic_managementapp', '0004_auto_20231220_2134'),
    ]

    operations = [
        migrations.AddField(
            model_name='prescription_table',
            name='type',
            field=models.CharField(default=1, max_length=20),
            preserve_default=False,
        ),
    ]
