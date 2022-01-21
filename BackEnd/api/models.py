from django.db import models


class Candidate(models.Model):
    first_name = models.CharField(max_length=240, blank=False, default='')
    last_name = models.CharField(max_length=240, blank=False, default='')
    email = models.CharField(max_length=240, blank=False, default='', unique=True)
    phone_number = models.CharField(max_length=240, blank=False, default='', unique=True)
    address = models.CharField(max_length=240, blank=False, default='')
    identity_code = models.CharField(max_length=240, blank=False, default='', unique=True)
    password = models.CharField(max_length=240, blank=False, default='')


class Recruiter(models.Model):
    first_name = models.CharField(max_length=240, blank=False, default='')
    last_name = models.CharField(max_length=240, blank=False, default='')
    email = models.CharField(max_length=240, blank=False, default='', unique=True)
    phone_number = models.CharField(max_length=240, blank=False, default='', unique=True)
    identity_code = models.CharField(max_length=240, blank=False, default='')
    password = models.CharField(max_length=240, blank=False, default='')


class Company(models.Model):
    name = models.CharField(max_length=240, blank=False, default='')
    owner = models.IntegerField(default=0)
    description = models.CharField(max_length=240, blank=False, default='')
    date = models.CharField(max_length=240, blank=False, default='')
    website = models.CharField(max_length=240, blank=False, default='')
    domain = models.CharField(max_length=240, blank=False, default='')


class Job(models.Model):
    title = models.CharField(max_length=240, blank=False, default='')
    description = models.CharField(max_length=240, blank=False, default='')
    type = models.CharField(max_length=240, blank=False, default='')
    starting_date = models.CharField(max_length=240, blank=False, default='')
    field = models.CharField(max_length=240, blank=False, default='')


class Education(models.Model):
    title = models.CharField(max_length=240, blank=False, default='')
    description = models.CharField(max_length=240, blank=False, default='')
    start = models.CharField(max_length=240, blank=False, default='')
    end = models.CharField(max_length=240, blank=False, default='')
    diploma = models.CharField(max_length=240, blank=False, default='')


class Experience(models.Model):
    title = models.CharField(max_length=240, blank=False, default='')
    description = models.CharField(max_length=240, blank=False, default='')
    start = models.CharField(max_length=240, blank=False, default='')
    end = models.CharField(max_length=240, blank=False, default='')
    company = models.CharField(max_length=240, blank=False, default='')
    specialty = models.CharField(max_length=240, blank=False, default='')


class Skill(models.Model):
    name = models.CharField(max_length=240, blank=False, default='')
    type = models.CharField(max_length=240, blank=False, default='')


class Project(models.Model):
    title = models.CharField(max_length=240, blank=False, default='')
    description = models.CharField(max_length=240, blank=False, default='')
    start = models.CharField(max_length=240, blank=False, default='')
    end = models.CharField(max_length=240, blank=False, default='')
    domain = models.CharField(max_length=240, blank=False, default='')
    link = models.CharField(max_length=240, blank=False, default='')


class Hobby(models.Model):
    name = models.CharField(max_length=240, blank=False, default='')
    description = models.CharField(max_length=240, blank=False, default='')


class Award(models.Model):
    name = models.CharField(max_length=240, blank=False, default='')
    description = models.CharField(max_length=240, blank=False, default='')
    date = models.CharField(max_length=240, blank=False, default='')
    issuer = models.CharField(max_length=240, blank=False, default='')


class Certificate(models.Model):
    name = models.CharField(max_length=240, blank=False, default='')
    description = models.CharField(max_length=240, blank=False, default='')
    date = models.CharField(max_length=240, blank=False, default='')
    issuer = models.CharField(max_length=240, blank=False, default='')
    domain = models.CharField(max_length=240, blank=False, default='')
    link = models.CharField(max_length=240, blank=False, default='')


class Volunteering(models.Model):
    title = models.CharField(max_length=240, blank=False, default='')
    description = models.CharField(max_length=240, blank=False, default='')
    date = models.CharField(max_length=240, blank=False, default='')
    where = models.CharField(max_length=240, blank=False, default='')
    domain = models.CharField(max_length=240, blank=False, default='')
