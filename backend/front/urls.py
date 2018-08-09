from django.urls import re_path

from front.views import FrontendView

urlpatterns = [re_path(r"^[a-zA-Z0-9/-]*$", FrontendView.as_view(), name="app")]
