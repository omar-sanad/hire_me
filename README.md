# hire_me

1- Open the BackEnd FOlder with PyCharm or IntelliJ IDEA with python plugin installed
2- You must have python 3.7.11 installed, then run in the terminal : pip install -r requirements.txt
3- Run MySQL server then edit the following part with the MySQL server information in the file BackEnd.settings.py :
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'recruitment',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': '127.0.0.1',
        'PORT': '3306'
    },
}

4- Run : python manage.py migrate , to create tables in the database
5- Run python manage.py runserver 0.0.0.0:8080 to start the server

6- Open FrontEnd Folder with Android Studio or IntelliJ IDEA with Flutter and Dart plugin installed
7- Run the following command : flutter pub get
8- Open an Android Emulator or connect your phone with the PC and enable USB debugging
9- Run the following command : flutter run
