# Generated by Django 3.0.5 on 2022-01-19 10:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_auto_20220119_0933'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='company',
            name='logo',
        ),
        migrations.AddField(
            model_name='company',
            name='owner',
            field=models.IntegerField(default=0),
        ),
    ]
