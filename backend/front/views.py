from django.conf import settings
from django.views.generic import TemplateView


class FrontendView(TemplateView):
    template_name = "app.html"

    def get_template_names(self):
        if settings.DEBUG:
            return ["app_dev.html"]

        return super().get_template_names()
