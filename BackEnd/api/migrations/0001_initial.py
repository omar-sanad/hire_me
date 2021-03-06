# Generated by Django 3.0.5 on 2021-11-18 09:35

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Award',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=240)),
                ('description', models.CharField(default='', max_length=240)),
                ('date', models.CharField(default='', max_length=240)),
                ('issuer', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Candidate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(default='', max_length=240)),
                ('last_name', models.CharField(default='', max_length=240)),
                ('email', models.CharField(default='', max_length=240, unique=True)),
                ('phone_number', models.CharField(default='', max_length=240, unique=True)),
                ('address', models.CharField(default='', max_length=240)),
                ('identity_code', models.CharField(default='', max_length=240, unique=True)),
                ('photo', models.CharField(default='', max_length=240)),
                ('password', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Certificate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=240)),
                ('description', models.CharField(default='', max_length=240)),
                ('date', models.CharField(default='', max_length=240)),
                ('issuer', models.CharField(default='', max_length=240)),
                ('domain', models.CharField(default='', max_length=240)),
                ('link', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Company',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=240)),
                ('description', models.CharField(default='', max_length=240)),
                ('logo', models.CharField(default='', max_length=240)),
                ('date', models.CharField(default='', max_length=240)),
                ('website', models.CharField(default='', max_length=240)),
                ('domain', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Education',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='', max_length=240)),
                ('description', models.CharField(default='', max_length=240)),
                ('start', models.CharField(default='', max_length=240)),
                ('end', models.CharField(default='', max_length=240)),
                ('diploma', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Experience',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='', max_length=240)),
                ('description', models.CharField(default='', max_length=240)),
                ('start', models.CharField(default='', max_length=240)),
                ('end', models.CharField(default='', max_length=240)),
                ('company', models.CharField(default='', max_length=240)),
                ('specialty', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Hobby',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=240)),
                ('description', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Job',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='', max_length=240)),
                ('description', models.CharField(default='', max_length=240)),
                ('type', models.CharField(default='', max_length=240)),
                ('starting_date', models.CharField(default='', max_length=240)),
                ('field', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='', max_length=240)),
                ('description', models.CharField(default='', max_length=240)),
                ('start', models.CharField(default='', max_length=240)),
                ('end', models.CharField(default='', max_length=240)),
                ('domain', models.CharField(default='', max_length=240)),
                ('link', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Recruiter',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(default='', max_length=240)),
                ('last_name', models.CharField(default='', max_length=240)),
                ('email', models.CharField(default='', max_length=240, unique=True)),
                ('phone_number', models.CharField(default='', max_length=240, unique=True)),
                ('identity_code', models.CharField(default='', max_length=240)),
                ('photo', models.CharField(default='', max_length=240)),
                ('password', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Skill',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=240)),
                ('type', models.CharField(default='', max_length=240)),
            ],
        ),
        migrations.CreateModel(
            name='Volunteering',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='', max_length=240)),
                ('description', models.CharField(default='', max_length=240)),
                ('date', models.CharField(default='', max_length=240)),
                ('where', models.CharField(default='', max_length=240)),
                ('domain', models.CharField(default='', max_length=240)),
            ],
        ),
    ]
