from rest_framework import serializers
from api.models import Candidate, Job, Education, Experience, Skill, Company, Volunteering, Certificate, Award, Hobby, \
    Recruiter


class CandidateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Candidate
        fields = ('id',
                  'first_name',
                  'last_name',
                  'email',
                  'phone_number',
                  'address',
                  'password',
                  'identity_code')
        extra_kwargs = {
            'email': {'required': False},
            'password': {'required': False},
            'first_name': {'required': False},
            'last_name': {'required': False},
            'phone_number': {'required': False},
            'address': {'required': False},
            'identity_code': {'required': False}
        }


class RecruiterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Recruiter
        fields = ('id',
                  'first_name',
                  'last_name',
                  'email',
                  'phone_number',
                  'password',
                  'identity_code')
        extra_kwargs = {
            'email': {'required': False},
            'password': {'required': False},
            'first_name': {'required': False},
            'last_name': {'required': False},
            'phone_number': {'required': False},
            'identity_code': {'required': False}
        }


'''
class RequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Request
        fields = ('id',
                  'driver',
                  'type',
                  'identity',
                  'licence',
                  'matriculation',
                  'status')
        extra_kwargs = {
            'status': {'required': False}
        }

'''


class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ('id',)
        extra_kwargs = {
            'rating': {'required': False}
        }


class EducationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Education
        fields = ('id')
        extra_kwargs = {
            'rating': {'required': False}
        }


class ExperienceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Experience
        fields = ('id')
        extra_kwargs = {
            'rating': {'required': False}
        }


class SkillSerializer(serializers.ModelSerializer):
    class Meta:
        model = Skill
        fields = ('id')
        extra_kwargs = {
            'rating': {'required': False}
        }


class CompanySerializer(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = ('id',
                  'owner',
                  'name',
                  'description',
                  'date',
                  'website',
                  'domain')
        extra_kwargs = {
            'owner': {'required': False},
            'name': {'required': False},
            'description': {'required': False},
            'date': {'required': False},
            'website': {'required': False},
            'domain': {'required': False}
        }


class HobbySerializer(serializers.ModelSerializer):
    class Meta:
        model = Hobby
        fields = ('id')
        extra_kwargs = {
            'rating': {'required': False}
        }


class AwardSerializer(serializers.ModelSerializer):
    class Meta:
        model = Award
        fields = ('id')
        extra_kwargs = {
            'rating': {'required': False}
        }


class CertificateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Certificate
        fields = ('id')
        extra_kwargs = {
            'rating': {'required': False}
        }


class VolunteeringSerializer(serializers.ModelSerializer):
    class Meta:
        model = Volunteering
        fields = ('id')
        extra_kwargs = {
            'rating': {'required': False}
        }
