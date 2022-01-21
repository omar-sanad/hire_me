from django.conf.urls import url
from api import views

urlpatterns = [
    url(r'^api/v1/candidates/register$', views.candidates_register),
    url(r'^api/v1/recruiters/register$', views.recruiters_register),
    url(r'^api/v1/login$', views.login),
    url(r'^api/v1/messages$', views.handle_messages),
    url(r'^api/v1/jobs$', views.handle_jobs),
    url(r'^api/v1/hobbies$', views.handle_hobbies),
    url(r'^api/v1/projects$', views.handle_projects),
    url(r'^api/v1/educations$', views.handle_educations),
    url(r'^api/v1/experiences$', views.handle_experiences),
    url(r'^api/v1/skills$', views.handle_skills),
    url(r'^api/v1/companies$', views.handle_companies),
    url(r'^api/v1/companies$', views.handle_companies),
    url(r'^api/v1/certificates$', views.handle_certificates),
    url(r'^api/v1/awards$', views.handle_awards),
    url(r'^api/v1/resume$', views.handle_resume),
]
