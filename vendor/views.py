from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello there, it is from the vendor!!!")
