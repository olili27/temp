from django.urls import path

from . import views


urlpatterns = [path("", views.index, name="vendor_index")]
