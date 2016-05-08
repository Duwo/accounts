from django.shortcuts import render
from registration.views import  RegistrationView
from django.contrib.auth.views import login
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.views.generic import TemplateView, ListView, DetailView

# Create your views here.
class RegistrationView(RegistrationView):
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated():
            messages.add_message(request, messages.INFO,"Already Logged In")
            return HttpResponseRedirect(reverse("registration_profile"))
        else:
            return super(RegistrationView, self).get(self, *args, **kwargs)
    
def custom_login(request):
    if request.user.is_authenticated():
        messages.add_message(request, messages.INFO,"Already Logged In")
        return HttpResponseRedirect(reverse("registration_profile"))
    else:
        return login(request)

class ProfileView(TemplateView):
    template_name = "induwo_registration/profile.html"
