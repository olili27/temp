from django.urls import path

from . import views


# urlConf for the admin app
urlpatterns = [
    path("", views.index, name="admin_index")
]