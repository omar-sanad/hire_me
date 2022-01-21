import bcrypt
import jwt

from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser
from rest_framework import status

from BackEnd.settings import SECRET_KEY
from api import engine
from api.models import Candidate, Job, Recruiter, Company
from api.serializers import CandidateSerializer, JobSerializer, RecruiterSerializer, CompanySerializer
from rest_framework.decorators import api_view

@api_view(['POST'])
def candidates_register(request):
    if request.method == 'POST':
        element = JSONParser().parse(request)
        serializer = CandidateSerializer(data=element)
        password = serializer.initial_data['password']
        encrypted = bcrypt.hashpw(bytes(str(password), 'utf-8'), bcrypt.gensalt())
        print(str(encrypted).split("\'")[1])
        serializer.initial_data['password'] = str(encrypted).split("\'")[1]
        if serializer.is_valid():
            serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)

@api_view(['POST'])
def recruiters_register(request):
    if request.method == 'POST':
        element = JSONParser().parse(request)
        serializer = RecruiterSerializer(data=element)
        password = serializer.initial_data['password']
        encrypted = bcrypt.hashpw(bytes(str(password), 'utf-8'), bcrypt.gensalt())
        print(str(encrypted).split("\'")[1])
        serializer.initial_data['password'] = str(encrypted).split("\'")[1]
        if serializer.is_valid():
            serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['POST'])
def login(request):
    try:
        if request.method == 'POST':
            element = JSONParser().parse(request)
            candidate_serializer = CandidateSerializer(data=element)
            recruiter_serializer = RecruiterSerializer(data=element)
            if True:
                candidates_list = Candidate.objects.all()
                recruiters_list = Recruiter.objects.all()
                candidates = candidates_list.filter(email__icontains=candidate_serializer.initial_data['email'])
                recruiters = recruiters_list.filter(email__icontains=recruiter_serializer.initial_data['email'])
                if len(candidates) > 0:
                    given_password = candidate_serializer.initial_data['password']
                    password = candidates[0].password
                    if bcrypt.checkpw(str(given_password).encode('utf-8'), str(password).encode('utf-8')):
                        token = jwt.encode({"email": candidate_serializer.initial_data['email']}, SECRET_KEY,
                                           algorithm="HS256")
                        data = {
                            'code': 1,
                            'id': candidates[0].id,
                            'role': 'candidate',
                            'token': token
                        }
                        return JsonResponse(data, status=status.HTTP_200_OK)
                    else:
                        data = {
                            'code': 2
                        }
                        return JsonResponse(data, status=status.HTTP_200_OK)
                elif len(recruiters) > 0:
                    given_password = recruiter_serializer.initial_data['password']
                    password = recruiters[0].password
                    if bcrypt.checkpw(str(given_password).encode('utf-8'), str(password).encode('utf-8')):
                        token = jwt.encode({"email": recruiter_serializer.initial_data['email']}, SECRET_KEY,
                                           algorithm="HS256")
                        data = {
                            'code': 1,
                            'id': recruiters[0].id,
                            'role': 'recruiter',
                            'token': token
                        }
                        return JsonResponse(data, status=status.HTTP_200_OK)
                    else:
                        data = {
                            'code': 2
                        }
                        return JsonResponse(data, status=status.HTTP_200_OK)
                else:
                    data = {
                        'code': 3
                    }
                    return JsonResponse(data, status=status.HTTP_200_OK)
    except Exception as e:
        data = {
            'code': 4,
            'message': str(e)
        }
        return JsonResponse(data, status=status.HTTP_200_OK)

@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_jobs(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = JobSerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_messages(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = JobSerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_hobbies(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = JobSerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_projects(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = JobSerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_educations(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = JobSerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_experiences(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = JobSerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_skills(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = JobSerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_companies(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Company.objects.all()
        owner = request.GET.get('owner', None)
        if owner is not None:
            elements = elements.filter(owner__exact=owner)
            elements_serializer = CompanySerializer(elements, many=True)
            return JsonResponse(elements_serializer.data[0], safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = CompanySerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_volunteerings(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = JobSerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_certificates(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = JobSerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_awards(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        element = JSONParser().parse(request)
        element_serializer = JobSerializer(data=element)
        if element_serializer.is_valid():
            element_serializer.save()
            data = {
                'code': 1
            }
            return JsonResponse(data, status=status.HTTP_200_OK)
        else:
            data = {
                'code': 2
            }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)


@api_view(['GET', 'POST', 'PUT', 'DELETE'])
def handle_resume(request):
    token = request.headers['Authorization']
    decoded = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    if decoded["email"] is None:
        data = {
            'code': 5
        }
        return JsonResponse(data, status=status.HTTP_401_UNAUTHORIZED)
    if request.method == 'GET':
        elements = Job.objects.all()
        client = request.GET.get('client', None)
        driver = request.GET.get('driver', None)
        if client is not None:
            elements = elements.filter(client__exact=client)
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        elif driver is not None:
            elements = elements.filter(driver__exact=driver, status__exact='PENDING')
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
        else:
            elements_serializer = JobSerializer(elements, many=True)
            return JsonResponse(elements_serializer.data, safe=False)
    elif request.method == 'POST':
        content = engine.merge()
        pdfkit.from_string(content,'resume.pdf')
        data = {
            'code': content
        }
        return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'PUT':
        id = request.GET.get('id', None)
        idd = request.GET.get('idd', None)
        if id is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            rating = element_serializer.initial_data['rating']
            if rating is not None:
                Job.objects.filter(id=id).update(rating=rating)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
        elif idd is not None:
            element = JSONParser().parse(request)
            element_serializer = JobSerializer(data=element)
            the_status = element_serializer.initial_data['status']
            if the_status is not None:
                Job.objects.filter(id=idd).update(status=the_status)
            if True:
                data = {
                    'code': 1
                }
                return JsonResponse(data, status=status.HTTP_200_OK)
    elif request.method == 'DELETE':
        id = request.GET.get('id', None)
        Job.objects.filter(id=id).delete()
        data = {
            'code': 1
        }
        return JsonResponse(data, status=status.HTTP_200_OK)
